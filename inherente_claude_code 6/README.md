# Arquitectura Claude Code — Inherente v3

Esta plantilla separa la **metodología reusable de Inherente** del **contexto específico de cada marca**.

## Estructura

```text
inherente_claude_code/
├── CLAUDE.md
├── README.md
│
├── context/                      # METODOLOGÍA MAESTRA — NO editar por marca
│   ├── BRAND.md
│   ├── ICP.md
│   ├── OFFER.md
│   ├── CONTENT.md
│   ├── DESIGN.md
│   ├── CALENDAR.md
│   ├── PILARESDECONTENIDO.md
│   ├── ANALYTICS.md
│   └── COMMUNITY.md
│
├── brand_context/                # CONTEXTO VARIABLE — se llena por marca
│   ├── brand/
│   ├── icp/
│   ├── offer/
│   ├── content/
│   ├── design/
│   ├── calendar/
│   ├── analytics/
│   ├── community/
│   ├── founder/
│   ├── competitors/
│   └── research/
│
├── skills/
│   ├── create-ad/
│   ├── carousel/
│   ├── stories/
│   ├── campaign/
│   ├── repurpose/
│   ├── translate/
│   ├── reverse-engineering/
│   └── generate-images/
│
├── integrations/
│   ├── figma/
│   └── higgsfield/
│       └── cinematic-cameras-generate/
│
├── assets/
│   ├── brand/
│   ├── originals/                # qué producto/sujeto debe mantenerse
│   ├── references/               # cómo queremos que se vea
│   ├── video/
│   └── audio/
│
└── outputs/
    ├── ads/
    ├── organic/
    ├── campaigns/
    ├── images/
    └── video/
```

## La separación más importante

```text
context/       = CÓMO TRABAJAMOS
                 metodología reusable de Inherente
                 no se modifica al cambiar de marca

brand_context/ = CON QUIÉN ESTAMOS TRABAJANDO
                 datos, documentos, estrategia, investigación
                 y evidencia específica de la marca activa
```

Cuando se duplique esta plantilla para una nueva marca, `context/` permanece igual y `brand_context/` vuelve a comenzar vacío.

## Flujo de trabajo general

```text
METODOLOGÍA INHERENTE
context/
      +
CONTEXTO DE LA MARCA
brand_context/
      +
BRIEF ACTIVO
      +
ASSETS
      ↓
SKILL
      ↓
INTEGRACIÓN / HERRAMIENTA
      ↓
OUTPUT
      ↓
ANÁLISIS DE LA MARCA
brand_context/analytics/
```

## Flujo de imágenes con Higgsfield

El flujo correcto no es “mejorar una foto”. Es **crear una imagen nueva usando dos referencias con responsabilidades distintas**.

```text
assets/originals/
IDENTIDAD
“este es el producto/sujeto que debe mantenerse”
        +
assets/references/
DIRECCIÓN VISUAL
“así queremos que se vea la nueva foto”
        +
brand_context/
COHERENCIA DE MARCA
        ↓
skills/generate-images/
        ↓
Higgsfield
Cinematic Cameras Generate
        ↓
outputs/images/
```

### Ejemplo restaurante

- En `assets/originals/`: la fotografía real del producto del cliente.
- En `assets/references/`: una fotografía de un restaurante/referente cuyo lenguaje fotográfico le gusta al cliente.
- Resultado: una nueva fotografía donde el producto sigue siendo el del cliente, pero la composición, cámara, iluminación, atmósfera y dirección de arte se aproximan al referente dentro de los códigos de la marca.

La referencia funciona como **dirección visual**, no como contenido que deba copiarse literalmente.

## Regla de inmutabilidad

Los nueve MD de `context/` son la base metodológica. No deben rellenarse con información específica del cliente y no deben reescribirse por campaña.

Si una marca aporta un manual, entrevistas, ICP, oferta, reportes, ejemplos de contenido o documentación visual, esos archivos van a `brand_context/` o `assets/` según corresponda.

## Scaffolding de folders

Esta version incluye un `README.md` dentro de los folders variables que antes podian quedar vacios. Esos archivos explican que debe cargarse en cada lugar y sirven como guia de onboarding.

Importante: los README de `brand_context/` son instrucciones de organizacion, no informacion real del cliente. La marca activa se define unicamente con los documentos y assets que el equipo cargue despues.
