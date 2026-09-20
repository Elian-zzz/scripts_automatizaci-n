# Scripts útiles 
Repo de scripts variados de automatizaciónes en bash y powershell

* `Get-Hardware.ps1`: archivo que obtiene el hardware de la pc en un archivo `.txt` formateado.
* `Scripts_proyectos_node.md` documentación de scripts de node para el diagnostico de proyectos. [[VER MÁS](https://github.com/Elian-zzz/scripts_automatizaci-n/blob/main/Scripts_proyectos_node.md)]


## Consejos para el __diagnostico de proyectos__ ___NODE___ con `pnpm`
Ejecutar en orden los siguientes comandos de node para diagnosticar el estado de las dependencias de un proyecto: 
| ID | Acción | Comando |
| -- | :----- | ------- |
| 1. | Ver vulnerabilidades de seguridad conocidas | `pnpm audit` |
| 2. | Ver dependencias estado de las versiónes de las dependencias | `pnpm outdated` |
| 3. | Actualizar las versiónes de las dependencias | `pnpm update --interactive --latest` |
| 4. | Volver a ejecutar los comandos 1. y 2. para verificar | `pnpm audit && pnpm outdated` |
| 5. | Arreglar las vulnerabilidades | `pnpm audit fix --force` |

[[VER MÁS COMANDOS DE NODE](https://github.com/Elian-zzz/scripts_automatizaci-n/blob/main/Scripts_proyectos_node.md)]

## Consejos para el __diagnostico de proyectos__ ___NODE___ con `npm`
Ejecutar en orden los siguientes comandos de node para diagnosticar el estado de las dependencias de un proyecto: 
| ID | Acción | Comando |
| -- | :----- | ------- |
| 1. | Ver vulnerabilidades de seguridad conocidas | `npm audit` |
| 2. | Ver dependencias estado de las versiónes de las dependencias | `npm outdated` |
| 3. | Actualizar las versiónes de las dependencias | `npm update --latest` |
| 4. | Volver a ejecutar los comandos 1. y 2. para verificar | `npm audit && npm outdated` |
| 5. | Arreglar las vulnerabilidades | `npm audit fix --force` |

__By Elian-zzz__

---
