# hero__bowl-akai-atun__manos-chef__vertical__feed-4x5__v01

Registro completo del run de `/generate-images`. Sirve como metadata de la pieza
(`METADATA_TEMPLATE.md`) y como trazabilidad del job de generación.

**Fecha:** 2026-08-17
**Skill:** `/generate-images`
**Estado del contexto de marca:** `brand_context/` vacío en el momento del run.
Todo campo específico de Akkai queda etiquetado `HIPÓTESIS`.

---

## 0. Gate previo (CLAUDE.md §3)

```text
OBJETIVO DE NEGOCIO:        Aumentar reservas/pedidos del bowl de atún.            HIPÓTESIS
HÉROE / SEGMENTO:           Comensal urbano que elige dónde comer por Instagram.   HIPÓTESIS
DESEO O TENSIÓN:            Quiere comer algo que se sienta cuidado, no fast food
                            disfrazado de saludable.                               HIPÓTESIS
POSICIONAMIENTO A REFORZAR: Cocina de producto hecha a mano, no ensamblaje.        HIPÓTESIS
PROMESA A DEMOSTRAR:        Cada plato sale de las manos de alguien que lo cuida.  HIPÓTESIS
CAPA PRINCIPAL:             emocional
ATRIBUTO DE IDENTIDAD:      "Como donde saben lo que hacen."                       HIPÓTESIS
PILAR:                      Pilar C — Promesa y transformación (tipo, sin nombrar) POR DEFINIR
FORMATO:                    Hero estático, feed 4:5
HIPÓTESIS DE HOOK:          Manos entregando el plato > plato solo sobre mesa.
RESULTADO DE MEDIA:         Guardados y tiempo de permanencia sobre la media
                            de las fotos de producto sobre fondo blanco.           HIPÓTESIS
RESULTADO DE NEGOCIO:       Clics a reserva/pedido desde el post.                  HIPÓTESIS
EVIDENCIA DISPONIBLE:       1 original real, 1 referencia real. Cero datos de
                            marca, ICP, oferta o analytics.
```

**Lectura honesta del gate:** 9 de 13 campos son hipótesis inventadas por Claude.
Bajo `CLAUDE.md` §3 esto no autoriza publicar; autoriza producir la pieza marcada
como hipótesis. La imagen es utilizable; la estrategia que la justifica todavía no
está respaldada.

---

## 1. Anclas

| Rol | Archivo | Función |
|---|---|---|
| Identidad | `assets/originals/bow akai de atun.jpg` | qué debe seguir siendo lo mismo |
| Dirección visual | `assets/references/PLATO EN MANOS.webp` | cómo queremos que se vea |
| Observación humana | `assets/references/PLATO EN MANOS.md` | HIPÓTESIS, sin confirmar |
| Coherencia de marca | `brand_context/design/` | **vacío → POR DEFINIR** |

### Por qué este par

La referencia es un **bowl sostenido en manos**. El original es un **bowl**. Misma clase
de objeto y misma relación mano-producto posible, con dirección visual opuesta
(high-key sobre blanco vs. low-key sobre negro). Es el par que mejor aísla la variable:
si el resultado conserva el bowl y cambia la dirección, el flujo funciona; si "mejora"
la foto original, el flujo está roto.

Descartados: `vulcanoo.jpg` (roll sobre pizarra, otra clase de vajilla),
`combiancion perfecta.jpg` (cenital de alitas y gyozas, incompatible con encuadre a
altura de manos).

---

## 2. INVARIANTES — vienen del original

- Bowl de cerámica blanca con borde superior moteado marrón-rojizo sin esmaltar.
- Cubos de atún crudo rojo brillante, montados al centro-alto del bowl.
- Sésamo blanco y negro espolvoreado sobre el atún.
- Hilo de salsa cremosa blanca sobre el atún.
- Láminas de aguacate verde, sector superior izquierdo.
- Edamames pelados, sector derecho.
- Espirales de pepino verde, centro-derecha.
- Espirales de zanahoria naranja, centro-inferior.
- Alga nori tostada oscura, sector izquierdo.
- Cebolla morada encurtida y aros de cebolla morada crudos.
- Proporción bowl/porción y disposición radial de los ingredientes por sector.

## 3. ATRIBUTOS TRANSFERIBLES — vienen de la referencia

- Persona sosteniendo el bowl con ambas manos, acunado desde abajo.
- Antebrazos entrando en cuadro, torso como fondo.
- Delantal azul marino sobre camisa blanca arremangada.
- Fondo negro, low-key, caída rápida de luz.
- Luz única suave direccional desde el frente superior.
- Bowl en el tercio inferior-central, ~60% del ancho de cuadro.
- Cámara a la altura del bowl, inclinación descendente leve (~15–20°).
- Distancia media-corta, sensación 50–85 mm.
- Profundidad de campo corta: plato nítido, torso y fondo suaves.
- Contraste cálido del alimento contra entorno frío y oscuro.
- Vertical 4:5.
- Atmósfera silenciosa, editorial, de entrega.

## 4. ADAPTAR — decisiones tomadas en este run

| Elemento | Decisión | Razón |
|---|---|---|
| Chorro de salsa cayendo desde arriba (original) | **Eliminar** | Implausible con el bowl en manos. Es elemento de escena del original, no identidad. |
| Palillos sobre la mesa (original) | **Eliminar** | Prop de la escena original; el nuevo encuadre no tiene mesa. |
| Mesa blanca y fondo high-key (original) | **Eliminar** | Es exactamente la variable que la referencia viene a cambiar. |
| Ceviche, leche de tigre, zanahoria en láminas, microgreens (referencia) | **No copiar** | Contenido del referente, no dirección. |
| Bowl moteado azul del referente | **No copiar** | La vajilla es identidad y viene del original. |
| Delantal | Azul marino neutro, sin logos | `brand_context/design/` vacío. **POR DEFINIR** |

## 5. Brief de generación

```text
KEEP FROM ORIGINAL:
  El bowl exacto y su contenido exacto — ver INVARIANTES §2.

BORROW FROM REFERENCE:
  Manos sosteniendo, fondo negro, luz suave direccional, encuadre vertical 4:5,
  cámara a altura del bowl, DOF corto, grading cálido sobre frío — ver §3.

BRAND CONSTRAINTS:
  Sin logos, sin texto en imagen, sin marca visible en el delantal.
  POR DEFINIR — brand_context/design/ está vacío.

NEW SCENE / COMPOSITION:
  Cocinero de pie contra fondo negro, sosteniendo el bowl con ambas manos hacia
  la cámara, ligeramente por debajo del pecho.

DO NOT CHANGE:
  Ningún ingrediente, ninguna posición de ingrediente, la vajilla.

OUTPUT USE:
  Hero de feed Instagram 4:5. Dejar zona oscura utilizable arriba a la izquierda
  para copy.
```

## 6. Ejecución — **BLOQUEADA**

- **Ruta declarada en `CLAUDE.md` §10.2:** Higgsfield → Cinematic Cameras Generate.
- **Ruta seleccionada como reemplazo:** Higgsfield → `nano_banana_pro`, 4:5, 2k.
- **Estado: no ejecutada.** El brief está completo y es ejecutable, pero las dos anclas
  no pudieron entrar a Higgsfield desde esta sesión remota.

Ver `HALLAZGOS.md` en la raíz del repo para el detalle. Resumen:

1. No existe un modelo "Cinematic Cameras Generate" en el catálogo actual de Higgsfield.
   El candidato más cercano por nombre (`soul_cinematic`) acepta **máximo 1 imagen de
   referencia**, o sea que es incompatible con el flujo de dos anclas que el sistema exige.
2. Subida directa a `upload.higgsfield.ai`: **403**, denegada por política de egress.
3. Importación por URL: Higgsfield recibe **429** contra todos los orígenes respaldados
   por GitHub (raw, githack, statically).
4. Descarga del resultado: el CDN de Higgsfield (`d2ol7oe51mr4n9.cloudfront.net`)
   también está **403** por política de egress, así que aunque la generación ocurriera,
   el archivo no podría volver al repo desde aquí.

## 7. QA (skill §6)

**No ejecutable — no hay imagen que auditar.** Los tres bloques de QA del skill quedan
abiertos:

### Fidelidad al original
- [ ] Pendiente de generación.

### Cercanía a la referencia
- [ ] Pendiente de generación.

### Coherencia de marca
- [ ] **No verificable ni con imagen.** `brand_context/design/` está vacío: no hay paleta,
      tipografía, reglas de vajilla, uniforme ni códigos de cámara contra los cuales
      validar. Este check permanece abierto hasta que se cargue el contexto de marca.

**Veredicto:** el brief queda **aprobado y listo para ejecutar**; la pieza no existe.
Cuando se genere, seguirá siendo **v01 HIPÓTESIS** hasta que (a) la observación de la
referencia sea confirmada por el equipo y (b) exista `brand_context/design/`.

---

## Metadata (METADATA_TEMPLATE.md)

- `subject`: bowl de atún sostenido en manos
- `category`: 01_hero_producto
- `secondary_tags`: manos, low-key, editorial, atún, poke bowl
- `campaign`: ninguna
- `product_or_service`: Bowl Akai de atún
- `orientation`: vertical
- `shot_type`: medium
- `mood`: silencioso, cuidado, editorial
- `best_for`: hero de feed, primera impresión, apertura de carrusel
- `avoid_for`: catálogo, delivery apps, cualquier uso que requiera ver el plato cenital
- `copy_space`: top-left
- `status`: alt (no approved — QA de marca abierto)
- `date_created`: 2026-08-17
- `notes`: Primer run del workflow end-to-end. Generada con dos anclas reales del repo.
  Todo el marco estratégico es HIPÓTESIS por falta de `brand_context/`.
