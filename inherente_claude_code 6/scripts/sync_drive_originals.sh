#!/usr/bin/env bash
#
# sync_drive_originals.sh — trae las fotos fuente desde Google Drive a assets/originals/
#
# Carpeta fuente (source of truth):
#   "2025 (utiles para diseno)"
#   https://drive.google.com/drive/folders/1wiZFhHUQmBo4zsqoAg9sjJBr8WSTqumT
#
# Por que existe este script:
#   Las sesiones remotas de Claude Code no pueden descargar de drive.google.com
#   (la politica de egress de la organizacion bloquea ese host). La sincronizacion
#   se corre en local, donde Drive si es alcanzable.
#
# Uso:
#   ./scripts/sync_drive_originals.sh            # calidad completa (~1.4 GB)
#   ./scripts/sync_drive_originals.sh --web      # versiones optimizadas para repo
#   ./scripts/sync_drive_originals.sh --dry-run  # solo lista, no descarga
#
set -euo pipefail

FOLDER_ID="1wiZFhHUQmBo4zsqoAg9sjJBr8WSTqumT"
REMOTE_NAME="${RCLONE_REMOTE:-akkai-drive}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$REPO_ROOT/assets/originals"

MODE="full"
DRY_RUN=""
for arg in "$@"; do
  case "$arg" in
    --web)     MODE="web" ;;
    --dry-run) DRY_RUN="--dry-run" ;;
    -h|--help) sed -n '2,20p' "${BASH_SOURCE[0]}"; exit 0 ;;
    *) echo "Argumento desconocido: $arg" >&2; exit 2 ;;
  esac
done

if ! command -v rclone >/dev/null 2>&1; then
  cat >&2 <<'EOF'
Falta rclone.

  macOS:  brew install rclone
  Linux:  curl https://rclone.org/install.sh | sudo bash

Nota: no usamos "gdown --folder" porque topa a 50 archivos por carpeta y esta
carpeta tiene bastantes mas.
EOF
  exit 1
fi

if ! rclone listremotes 2>/dev/null | grep -qx "${REMOTE_NAME}:"; then
  cat >&2 <<EOF
No existe el remote "${REMOTE_NAME}" en rclone. Configuralo una sola vez:

  rclone config
    n) New remote
    name> ${REMOTE_NAME}
    Storage> drive
    client_id / client_secret> (enter, dejar vacio)
    scope> 1   (full access) o 2 (read-only, suficiente para este script)
    Luego autoriza en el navegador con la cuenta que ve la carpeta.

Si ya lo tienes con otro nombre:  RCLONE_REMOTE=mi-remote $0
EOF
  exit 1
fi

mkdir -p "$DEST"

echo "==> Carpeta Drive: $FOLDER_ID"
echo "==> Destino:       $DEST"
echo "==> Modo:          $MODE"
echo

SRC="${REMOTE_NAME}:"
RCLONE_ARGS=(
  --drive-root-folder-id "$FOLDER_ID"
  --include "*.{jpg,jpeg,JPG,JPEG,png,PNG,webp,WEBP,heic,HEIC}"
  --progress
  --transfers 4
  --checkers 8
)

if [[ "$MODE" == "full" ]]; then
  # Descarga directa a assets/originals/ conservando calidad de camara.
  rclone copy "$SRC" "$DEST" "${RCLONE_ARGS[@]}" ${DRY_RUN:+$DRY_RUN}
  echo
  echo "Listo. Archivos en $DEST:"
  find "$DEST" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | wc -l
  du -sh "$DEST"
  cat <<'EOF'

ATENCION antes de commitear:
  Estos son originales de camara (~8-16 MB cada uno). Meterlos en git plano
  infla el repo de forma permanente: cada clone futuro se los baja enteros.
  Opciones, de mejor a peor:
    1. Dejar Drive como fuente y commitear solo lo que se usa en produccion.
    2. Correr este script con --web y commitear las versiones optimizadas.
    3. Git LFS (ojo: el tier gratuito de GitHub es 1 GB de storage y 1 GB/mes
       de banda; esta carpeta sola ya lo excede).
EOF
else
  # Modo web: descarga a temporal y escribe JPEG optimizados en assets/originals/.
  if ! command -v magick >/dev/null 2>&1 && ! command -v convert >/dev/null 2>&1; then
    echo "Falta ImageMagick (brew install imagemagick / apt install imagemagick)" >&2
    exit 1
  fi
  IM_BIN="$(command -v magick || command -v convert)"

  TMP="$(mktemp -d)"
  trap 'rm -rf "$TMP"' EXIT

  echo "Descargando a temporal..."
  rclone copy "$SRC" "$TMP" "${RCLONE_ARGS[@]}" ${DRY_RUN:+$DRY_RUN}

  if [[ -n "$DRY_RUN" ]]; then
    echo "(dry-run: no se convirtio nada)"
    exit 0
  fi

  echo
  echo "Optimizando a 2400px / calidad 85..."
  count=0
  while IFS= read -r -d '' src; do
    base="$(basename "${src%.*}")"
    out="$DEST/${base}.jpg"
    "$IM_BIN" "$src" \
      -auto-orient \
      -resize '2400x2400>' \
      -strip \
      -quality 85 \
      "$out"
    count=$((count + 1))
    printf '\r  %s archivos' "$count"
  done < <(find "$TMP" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.heic' \) -print0)

  echo
  echo
  echo "Listo. $count archivos optimizados en $DEST"
  du -sh "$DEST"
fi
