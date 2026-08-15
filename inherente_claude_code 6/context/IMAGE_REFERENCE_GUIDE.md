# IMAGE_REFERENCE_GUIDE.md

## Propósito

Este archivo define cómo debe interpretar Claude las imágenes de referencia usadas para generación visual.

Las imágenes de referencia no son instrucciones para copiar una fotografía de forma literal. Son material visual del que se deben extraer atributos específicos de dirección de arte, composición, iluminación, styling, atmósfera o cámara.

Cuando una imagen de referencia tenga una observación humana asociada, esa observación tiene prioridad sobre cualquier interpretación automática de la imagen.

---

## Regla principal

**La observación humana explica qué parte de la referencia importa.**

Claude puede analizar visualmente toda la fotografía, pero no debe asumir que todos sus elementos son deseados.

Ejemplo:

> "Me gusta el chef sosteniendo el platillo, la composición y el color grading. Ajustarlo con apron negro y nuestro platillo."

Esto significa:

### Conservar como referencia
- Persona/chef sosteniendo el platillo.
- Relación visual entre persona y producto.
- Composición.
- Encuadre.
- Color grading.
- Sensación fotográfica general.

### Adaptar
- Vestuario de la persona al contexto de la marca.
- Producto o servicio al producto real de la marca.
- Elementos visuales que deban respetar el universo de marca.

### No asumir
- Que se desea copiar el platillo de la referencia.
- Que se desea copiar el branding de otra empresa.
- Que todos los colores, objetos, props o detalles son deseados.
- Que cualquier elemento visible pero no mencionado por la observación debe trasladarse a la nueva imagen.

---

## Jerarquía de interpretación

Al preparar una generación de imagen, Claude debe usar esta prioridad:

1. **Producto, persona, espacio o servicio original de la marca**
2. **Contexto y reglas específicas de la marca**
3. **Observación humana asociada a la referencia**
4. **Imagen de referencia**
5. **Interpretación visual adicional de Claude**

Si existe conflicto entre estos niveles, gana el nivel superior.

---

## Cómo usar una referencia

Antes de construir un prompt para Higgsfield / Cinematic Cameras Generate:

### 1. Identificar el sujeto original
Determinar qué elemento debe mantenerse fiel:
- producto,
- plato,
- packaging,
- persona,
- espacio,
- servicio,
- uniforme,
- objeto,
- arquitectura,
- etc.

### 2. Leer la referencia visual
Analizar:
- composición,
- ángulo,
- focal aproximada,
- distancia de cámara,
- pose,
- iluminación,
- sombras,
- profundidad de campo,
- fondos,
- styling,
- texturas,
- color grading,
- atmósfera,
- dirección de arte.

### 3. Leer la observación humana
Detectar específicamente:
- qué le gustó al usuario,
- qué debe conservarse,
- qué debe modificarse,
- qué no debe copiarse,
- qué intención visual busca.

### 4. Separar referencia de identidad
La referencia visual aporta dirección estética.

El original de la marca aporta identidad.

Nunca invertir estas funciones.

---

## Observaciones asociadas a imágenes

Idealmente, cada referencia puede tener una observación asociada.

Ejemplo:

```text
assets/references/
├── PLATO_EN_MANOS.webp
└── PLATO_EN_MANOS.md
```

`PLATO_EN_MANOS.md`:

```md
# Observación

Me gusta:
- el chef sosteniendo el platillo,
- la composición,
- el color grading,
- la proximidad con cámara.

Cambiar:
- apron negro,
- utilizar nuestro platillo.

No copiar:
- branding del restaurante de referencia,
- producto de la referencia.
```

También puede existir un archivo central de observaciones si el equipo prefiere ese sistema.

---

## Si la observación está en Git o GitHub

Un comentario o mensaje de commit puede ser útil como contexto humano, pero **no debe ser la única ubicación de una observación importante**.

Claude no debe asumir que siempre tendrá acceso al historial de Git o a mensajes de commits durante una tarea.

Si una observación debe influir consistentemente en futuras generaciones, debe guardarse dentro del repositorio en un archivo de contexto o como archivo `.md` asociado a la referencia.

---

## Regla para referencias múltiples

Si se usan varias referencias, Claude debe entender qué función cumple cada una.

Ejemplo:

- Referencia A → composición.
- Referencia B → iluminación.
- Referencia C → styling.
- Referencia D → color grading.
- Original → identidad del producto.

No mezclar atributos sin justificar su función.

---

## Construcción del brief visual

Antes de enviar una generación a Higgsfield, Claude debe poder expresar internamente:

```text
SUJETO / IDENTIDAD:
Qué debe permanecer fiel a la marca.

REFERENCIA:
Qué imagen o imágenes se están usando.

OBSERVACIÓN HUMANA:
Qué dijo explícitamente el usuario que le interesa.

ATRIBUTOS A TRANSFERIR:
Qué elementos visuales se tomarán de la referencia.

ATRIBUTOS A ADAPTAR:
Qué debe cambiar para pertenecer a la marca.

ATRIBUTOS A IGNORAR:
Qué elementos de la referencia no deben influir.

RESULTADO BUSCADO:
Cómo debería sentirse y funcionar la imagen final.
```

---

## Principio final

**Claude no debe preguntarse solamente "¿qué hay en esta fotografía?"**

Debe preguntarse:

**"¿Qué parte de esta fotografía el usuario quiere convertir en dirección visual para esta marca?"**

La observación humana convierte una referencia visual genérica en una referencia intencional.
