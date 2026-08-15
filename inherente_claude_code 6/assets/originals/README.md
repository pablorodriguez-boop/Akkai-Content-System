# Originals

Aqui van las imagenes fuente del producto, persona, espacio u objeto cuya identidad debe conservarse en una nueva generacion.

## Funcion

Responde: **que debe seguir siendo el mismo**.

Ejemplos:
- foto real del plato del restaurante;
- foto real del producto y su packaging;
- foto real de una persona;
- foto real del local o espacio;
- objeto que debe permanecer reconocible.

En el flujo de Higgsfield, estas imagenes son el ancla de identidad. No confundirlas con referencias esteticas.

## Fuente de verdad

Banco fotografico de Akkai en Google Drive:

**2025 (utiles para diseno)**
https://drive.google.com/drive/folders/1wiZFhHUQmBo4zsqoAg9sjJBr8WSTqumT

Contiene mas de 150 fotos de camara (JPEG, ~2.5-16 MB cada una, del orden de 1.4 GB en total): platos emplatados con nombre descriptivo (`vulcanoo.jpg`, `cobra final.jpg`, `bow akai de atun.jpg`, `lomito akai.jpg`, `platanito.jpg`, `california.jpg`, `arroz frito.jpg`...) y series crudas de sesion (`DSC0****.jpg`).

## Como poblar esta carpeta

```bash
./scripts/sync_drive_originals.sh          # calidad completa de camara
./scripts/sync_drive_originals.sh --web    # JPEG optimizados a 2400px
./scripts/sync_drive_originals.sh --dry-run
```

Requiere `rclone` configurado una vez con la cuenta que ve la carpeta. El script trae la carpeta completa; ver `scripts/sync_drive_originals.sh` para el detalle.

**El script se corre en local, no desde una sesion remota de Claude Code.** La politica de egress de esas sesiones bloquea `drive.google.com`, `drive.usercontent.google.com` y `docs.google.com`, asi que la descarga masiva no puede ejecutarse desde ahi.

## Que commitear

El repo no deberia cargar el banco completo. Criterio:

- **Commitear**: los originales que entran a produccion, en version optimizada (`--web`). Un plato usado en campana pesa ~400 KB y vive comodo en git.
- **No commitear**: la sesion cruda completa (`DSC0****.jpg`). Esos se quedan en Drive y se bajan bajo demanda.

Git plano guarda cada version binaria para siempre: 1.4 GB de originales encarecen todos los clones futuros del repo de forma permanente. Git LFS tampoco resuelve por si solo — el tier gratuito de GitHub da 1 GB de storage y 1 GB/mes de banda, y esta sola carpeta ya lo pasa.
