# Script maestro para el diagnóstico de proyectos Node (pnpm)

## 1. 🛠️ Configuración Maestra: El Script
Para facilitar la vida de los desarrolladores o asegurar el pipeline de Integración Continua (CI), puedes encadenar estos comandos en un único script de diagnóstico integral dentro de tu `package.json`:

```json
"scripts": {
  "lint": "eslint .",
  "typecheck": "tsc --noEmit",
  "audit": "pnpm audit",
  "diagnose": "pnpm run audit && pnpm run lint && pnpm run typecheck"
}
```

Al ejecutar `pnpm run diagnose` (o simplemente `pnpm diagnose`), el proyecto se auto-evaluará por completo en pocos segundos.

## 1.1 Diagnóstico de Seguridad y Dependencias
Herramientas para comprobar si estás usando paquetes vulnerables o desactualizados.

* `pnpm run audit`: Analiza el árbol de dependencias en busca de vulnerabilidades de seguridad conocidas.
* `pnpm run outdated`: Muestra una lista de los paquetes instalados que tienen versiones más recientes disponibles.

```json
"scripts": {
  "audit": "pnpm audit",
  "outdated": "pnpm outdated"
}
```

## 1.2 Diagnóstico de Calidad de Código y Formato
Estos scripts detectan malas prácticas y problemas de estilo en el código fuente.

* `pnpm run lint`: Revisa el código en busca de problemas lógicos o de estilo usando ESLint.
* `pnpm run lint:fix`: Corrige automáticamente los errores de formato detectados.
* `pnpm run format:check`: Verifica si el código cumple con las reglas de formato de Prettier sin modificar los archivos.

```json
"scripts": {
  "lint": "eslint .",
  "lint:fix": "eslint . --fix",
  "format:check": "prettier --check \".\""
}
```

## 1.3 Diagnóstico de Compilación y Tipado (TypeScript)
Es vital diagnosticar que los tipos sean correctos antes de generar el código de producción.

* `pnpm run typecheck`: Ejecuta el compilador de TypeScript en modo de solo diagnóstico (no genera archivos `.js`), buscando errores de tipado.

```json
"scripts": {
  "typecheck": "tsc --noEmit"
}
```

---

## 2. 🚀 Guía de Migración: De npm a pnpm

Tutorial paso a paso para reemplazar `npm` por `pnpm` en un proyecto existente de Node.js.

### Paso 1: Instalar pnpm globalmente
Puedes instalar pnpm en tu equipo utilizando `npm` (por única vez) o activando `corepack` (incluido en versiones modernas de Node):

```bash
# Opción A: A través de npm global
npm install -g pnpm

# Opción B: A través de Corepack (Recomendado en Node >= 16.13)
corepack enable
corepack prepare pnpm@latest --activate
```

### Paso 2: Convertir el archivo de bloqueo (lockfile)
Si tu proyecto ya cuenta con un `package-lock.json`, pnpm permite importar la estructura exacta para generar el `pnpm-lock.yaml`:

```bash
pnpm import
```

### Paso 3: Limpiar rastros de npm
Elimina la carpeta `node_modules` y el archivo `package-lock.json` para evitar conflictos:

```bash
# En Linux / macOS:
rm -rf node_modules package-lock.json

# En Windows (PowerShell):
Remove-Item -Recurse -Force node_modules, package-lock.json
```

### Paso 4: Reinstalar dependencias con pnpm
Ejecuta la instalación con pnpm para recrear los enlaces simbólicos en `node_modules`:

```bash
pnpm install
```

### Paso 5: Forzar el uso de pnpm en el proyecto (Opcional recomendado)
Para asegurarte de que nadie en el equipo vuelva a ejecutar accidentalmente `npm install`, puedes definir el gestor oficial y bloquear otros en tu `package.json`:

```json
{
  "packageManager": "pnpm@9.x.x",
  "scripts": {
    "preinstall": "npx only-allow pnpm"
  }
}
```
