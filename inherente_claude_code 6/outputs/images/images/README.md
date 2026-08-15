# Biblioteca de imágenes finales — Outputs

Este folder contiene **únicamente imágenes finales o listas para uso de diseño**. No es para originales de cámara ni referencias externas; esos viven en `assets/`.

## Objetivo
Permitir que el sistema de diseño encuentre rápidamente la fotografía correcta según la intención de la pieza, sin depender solo del nombre del archivo.

## Regla principal de selección
1. Primero identifica el objetivo de la pieza: conversión, marca, prueba, educación, ambiente, etc.
2. Luego busca en el folder más específico para ese objetivo.
3. Si una imagen puede vivir en dos categorías, colócala en la categoría que represente **su uso principal** y añade etiquetas en el nombre o metadata.
4. `21_extras_broll_stills/` es para recursos secundarios; no debe convertirse en el depósito por defecto.
5. `98_no_usar/` contiene material descartado que no debe entrar a diseño.
6. `99_archive/` guarda material viejo o reemplazado que se conserva por historial.

## Mapa rápido: qué usar según la intención
- Portada / primera impresión / pieza principal → `01_hero_producto/`
- Venta / oferta / pauta / landing → `02_conversion_oferta/` o `26_cta_promocional/`
- Construcción de marca / mood / estética → `03_ambiente_atmosfera/` o `18_editorial_brand/`
- Mostrar personas → `04_personas_retratos/`, `05_lifestyle_uso_real/`, `13_equipo_founder/`
- Mostrar el producto → `06_producto_detalle/`, `07_producto_en_contexto/`, `27_catalogo_ecommerce/`
- Explicar cómo se hace → `08_proceso_producto/`, `09_proceso_servicio/`
- Demostrar confianza → `10_prueba_social_testimonios/`, `11_ugc_clientes/`, `12_resultados_antes_despues/`
- Mostrar experiencia/servicio → `28_servicio_experiencia/`
- Eventos/comunidad → `14_comunidad_eventos/`
- Recursos de diseño → `20_texturas_fondos_recursos/`, `21_extras_broll_stills/`
- Campañas o temporadas específicas → `22_temporada_campana/`
- Resolver objeciones → `25_objeciones_respuestas/`

## Convención recomendada de nombres
`categoria__tema__sujeto__orientacion__uso__v01.ext`

Ejemplo:
`conversion__menu-lunch__burger-double__vertical__story__v03.jpg`

## Orientación y recorte
Cuando sea útil, agrega uno de estos tokens al nombre:
- `vertical`
- `horizontal`
- `square`
- `wide`
- `closeup`
- `medium`
- `full`

## Estado recomendado
Puedes añadir al nombre:
- `approved`
- `alt`
- `seasonal`
- `evergreen`

Ejemplo:
`ambiente__noche__terraza__horizontal__evergreen__approved.jpg`
