
# ___Script maestro para el diagnostico de proyectos node___

## 1. __🛠️ Configuración Maestra: El Script Para facilitar la vida de los desarrolladores o asegurar el pipeline de Integración Continua (CI)__
 puedes encadenar estos comandos en un único script de diagnóstico integral:
 
 ```javascript
"scripts": {
  "doctor": "node scripts/check-env.js",
  "lint": "eslint .",
  "typecheck": "tsc --noEmit",
  "audit": "pnpm audit",
  "diagnose": "pnpm run doctor && pnpm run audit && pnpm run lint && pnpm run typecheck"
}
```

Al ejecutar npm run diagnose, el proyecto se auto-evaluará por completo en pocos segundos.
## 1.1 __Diagnóstico de Seguridad y Dependencias__
   Herramientas para comprobar si estás usando paquetes vulnerables o desactualizados.
   * ___`pnpm run audit`: Analiza el árbol de dependencias en busca de vulnerabilidades de seguridad conocidas.___
   * ___`pnpm run outdated`: Muestra una lista de los paquetes instalados que tienen versiones más recientes disponibles.___
     
   ```javascript
   "scripts": {
  "audit": "pnpm audit",
  "outdated": "pnpm outdated"
}
```

## 1.2 __Diagnóstico de Calidad de Código y Formato__
   Estos scripts detectan: __malas prácticas__ y __problemas de estilo__ en el código fuente.
   * ___`npm run lint`: Revisa el código en busca de problemas lógicos o de estilo usando ESLint.___
   * ___`pnpm run lint:fix`: Corrige automáticamente los errores de formato detectados.___
   * `pnpm run format:check`: Verifica si el código cumple con las reglas de formato de Prettier sin modificar los archivos.json
     
```javascript
"scripts": {
 "lint": "eslint .",
  "lint:fix": "eslint . --fix",
  "format:check": "prettier --check \".\""
}
```

## 1.3 __Diagnóstico de Compilación y Tipado si tu proyecto Node utiliza TypeScript__ 
Es vital diagnosticar que los tipos sean correctos antes de generar el código de producción.
  * `npm run typecheck`: Ejecuta el compilador de TypeScript en modo de solo diagnóstico (no genera archivos .js), buscando errores de tipado.

```javascript
"scripts": {
  "typecheck": "tsc --noEmit"
}
```
