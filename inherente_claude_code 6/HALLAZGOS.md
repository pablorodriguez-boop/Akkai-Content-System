# HALLAZGOS — primer run end-to-end del workflow

**Fecha:** 2026-08-17
**Qué se intentó:** correr `/generate-images` completo, desde la metodología hasta un
arte final, con las dos anclas reales que ya viven en el repo.
**Resultado:** el brief se produjo completo y es ejecutable. La generación no pudo
ejecutarse. Abajo el detalle de por qué, separando lo que es un problema del *sistema*
de lo que es un problema del *entorno*.

---

## A. Problemas del sistema (viven en el repo, se arreglan editando el repo)

### A1. La ruta obligatoria de Higgsfield no existe

`CLAUDE.md` §10.2 y `integrations/higgsfield/cinematic-cameras-generate/README.md`
declaran una única ruta aprobada: **Cinematic Cameras Generate**.

En el catálogo actual de Higgsfield **no existe ningún modelo con ese nombre ni con ese
id**. Lo más cercano por nombre es `soul_cinematic` ("Soul Cinema — Cinema-grade stills"),
y ese modelo declara:

```
medias: [{ name: "medias", type: "image", max: 1, roles: ["image"] }]
```

**Máximo una imagen de referencia.** El flujo central del sistema exige dos anclas
simultáneas — identidad (original) + dirección visual (referencia). El modelo que lleva
el nombre más parecido al mandato es estructuralmente incapaz de recibir el mandato.

Modelos que sí aceptan multi-referencia y podrían sostener el flujo:
`nano_banana_pro`, `marketing_studio_image`, `kling_omni_image`, `flux_kontext`.

**Acción sugerida:** decidir cuál es la ruta real y renombrar la carpeta de integración
y las referencias en `CLAUDE.md`. Mientras la ruta declarada no exista, cada ejecución
obliga a improvisar el modelo, que es exactamente lo que el sistema intenta evitar.

### A2. El gate no puede pasarse con `brand_context/` vacío

Del bloque de 13 campos de `CLAUDE.md` §3, **9 salieron `HIPÓTESIS` inventadas** y 1
`POR DEFINIR`. Los únicos campos sostenibles con evidencia fueron formato, capa,
hipótesis de hook y evidencia disponible.

Esto no es un fallo — el sistema se comportó como debía y etiquetó todo. Pero significa
que **hoy ninguna pieza puede salir de este repo en estado publicable**, sólo en estado
hipótesis. El cuello de botella real del sistema no es la herramienta de imagen: es que
`brand_context/` está vacío.

### A3. El check de coherencia de marca es hoy inauditable

El QA del skill (`skills/generate-images/README.md` §6) exige validar contra los códigos
de marca de `brand_context/`. Con esa carpeta vacía, ese tercio del QA no puede fallar ni
aprobar: queda mudo. Un QA que no puede fallar no es un QA.

### A4. Faltaba la observación humana de la única referencia

`IMAGE_REFERENCE_GUIDE.md` establece que la observación humana manda sobre la lectura
automática de la imagen, y muestra el patrón `REFERENCIA.webp` + `REFERENCIA.md`.
`PLATO EN MANOS.webp` no tenía su `.md`.

Se creó `assets/references/PLATO EN MANOS.md` en este run, **etiquetado HIPÓTESIS**
porque lo redactó Claude, no el equipo. Tiene 3 preguntas abiertas al final que sólo
Rodrigo puede cerrar.

---

## B. Problemas del entorno (no se arreglan editando el repo)

El workflow de imagen **no es ejecutable desde una sesión remota de Claude Code**. Tres
bloqueos independientes, todos verificados:

| Paso | Host | Resultado |
|---|---|---|
| Subir anclas a Higgsfield | `upload.higgsfield.ai` | **403** — denegado por política de egress |
| Que Higgsfield importe por URL | `raw.githubusercontent.com` | **429** desde el fetcher de Higgsfield |
| Idem vía mirrors | `rawcdn.githack.com`, `cdn.statically.io`, `cdn.jsdelivr.net` | **429 / 404** — todos proxean el mismo origen |
| Descargar el resultado | `d2ol7oe51mr4n9.cloudfront.net` | **403** — denegado por política de egress |

El repo ya documenta este tipo de problema para Google Drive en
`assets/originals/README.md` ("El script se corre en local, no desde una sesión remota
de Claude Code"). El mismo hecho aplica al flujo de imágenes, que es el flujo principal
del sistema, y no estaba documentado en ninguna parte.

**Acción sugerida:** anotar en `CLAUDE.md` §10.2 y en el README de la integración que
`/generate-images` corre en local. Desde sesión remota se puede producir el brief, elegir
anclas, separar invariantes y dejar el job listo — pero la generación y el guardado del
output requieren entorno local.

---

## C. Lo que sí funcionó

Vale registrarlo, porque es la parte que el run venía a comprobar:

1. **La separación de dos capas se sostiene.** `context/` dio el marco de decisión sin
   necesitar edición; `brand_context/` vacío se hizo notar exactamente donde debía.
2. **La regla original-vs-referencia es operativa, no decorativa.** Forzó descartar
   `vulcanoo.jpg` y `combiancion perfecta.jpg` por incompatibilidad de clase de objeto y
   de encuadre con la referencia disponible — una decisión que no se habría tomado
   mirando sólo "qué foto es más linda".
3. **La separación invariantes / transferibles produjo decisiones no obvias.** El chorro
   de salsa y los palillos del original quedaron clasificados como escena, no identidad,
   y por lo tanto eliminables. Eso es precisamente lo que distingue este flujo de un
   "enhance".
4. **La regla de evidencia mordió.** Nada se rellenó con clichés; todo lo no respaldado
   salió etiquetado.

El sistema tiene consistencia real en su capa de decisión. Donde se rompe es en la capa
de ejecución: la ruta de herramienta que manda no existe, y el entorno remoto no puede
alcanzarla.
