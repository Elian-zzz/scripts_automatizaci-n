# Definir la ruta del archivo de salida (Escritorio)
$rutaArchivo = "$env:USERPROFILE\Desktop\Especificaciones_PC.txt"

$reporte = @()

$reporte += "========================================="
$reporte += "   REPORTE DE HARDWARE PARA ANALISIS IA"
$reporte += "========================================="
$reporte += "Fecha: $(Get-Date)"
$reporte += ""

# 1. Puntajes de Rendimiento (WinSAT)
$reporte += "[ PUNTAJES WinSAT ]"
$winsat = Get-CimInstance Win32_WinSAT
$reporte += $winsat | Select-Object WinSPRLevel, CPUScore, MemoryScore, DiskScore, GraphicsScore, D3DScore | Out-String
$reporte += ""

# 2. Procesador (CPU)
$reporte += "[ PROCESADOR ]"
$cpu = Get-CimInstance Win32_Processor
$reporte += $cpu | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Out-String
$reporte += ""

# 3. Gráficos (GPU)
$reporte += "[ GRAFICOS ]"
$gpu = Get-CimInstance Win32_VideoController
# Convertimos AdapterRAM de bytes a MB para claridad
$reporte += $gpu | Select-Object Name, @{Name="VRAM_MB"; Expression={[math]::Round($_.AdapterRAM / 1MB, 2)}} | Out-String
$reporte += ""

# 4. Almacenamiento (Discos)
$reporte += "[ DISCOS FISICOS ]"
$discos = Get-PhysicalDisk
$reporte += $discos | Select-Object FriendlyName, @{Name="Size_GB"; Expression={[math]::Round($_.Size / 1GB, 2)}}, MediaType | Out-String
$reporte += ""

# 5. Memoria RAM (Total y Libre)
$reporte += "[ MEMORIA RAM ]"
$cs = Get-CimInstance Win32_ComputerSystem
$os = Get-CimInstance Win32_OperatingSystem
$totalRAM = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
$libreRAM = [math]::Round($os.FreePhysicalMemory / 1MB, 2)

$reporte += "RAM Total: $totalRAM GB"
$reporte += "RAM Libre actual: $libreRAM MB"
$reporte += "========================================="

# Guardar todo en el archivo .txt
$reporte | Out-File -FilePath $rutaArchivo -Encoding utf8

Write-Host "Reporte generado con éxito en: $rutaArchivo" -ForegroundColor Cyan