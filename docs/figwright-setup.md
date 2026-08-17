# Figwright — Servidor MCP para Figma

[Figwright](https://github.com/awdr74100/figwright) conecta a Claude (u otro cliente MCP) con Figma para leer y escribir directamente en el canvas de diseño: extraer contexto de diseño (layouts, tipografía, componentes) y crear/editar frames, texto, auto-layout, estilos y variables.

Corre en local: un servidor MCP standalone en tu máquina que habla con un plugin instalado dentro de Figma. No requiere Figma Dev Mode ni plan pago.

## Requisitos

- Node.js 20.19+ o 22.12+
- Figma (versión gratuita es suficiente)
- Un cliente MCP compatible (Claude Code, Cursor, etc.)

## 1. Registrar el servidor MCP

```bash
claude mcp add figwright -- npx -y @figwright/mcp@latest
```

Esto agrega la entrada a `.mcp.json`. Configuración equivalente manual:

```json
{
  "mcpServers": {
    "figwright": {
      "command": "npx",
      "args": ["-y", "@figwright/mcp@latest"]
    }
  }
}
```

## 2. Instalar el plugin de Figma

1. Descargar el zip de la [última release](https://github.com/awdr74100/figwright/releases/latest).
2. Descomprimir.
3. En Figma: **Menu → Plugins → Development → Import plugin from manifest…**
4. Seleccionar el `manifest.json` de la carpeta descomprimida.

## 3. Conectar y usar

1. Abrir un archivo en Figma.
2. Ejecutar el plugin: **Plugins → Development → Figwright**.
3. Se conecta automáticamente al servidor MCP local.
4. Reiniciar la sesión de Claude Code — las herramientas de `figwright` aparecen junto a las demás.
