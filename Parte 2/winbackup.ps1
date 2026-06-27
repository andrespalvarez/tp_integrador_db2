# 1. Obtener la fecha actual en formato AAAA-MM-DD
$FECHA_ACTUAL = Get-Date -Format "yyyy-MM-dd"

# 2. Definir rutas relativas
$CARPETA_PADRE = "resguardos_tpi"
$CARPETA_DESTINO = Join-Path $CARPETA_PADRE $FECHA_ACTUAL

Write-Output "Iniciando proceso de resguardo..."
Write-Output "Creando directorios en: $CARPETA_DESTINO"

# 3. Crear las carpetas si no existen
New-Item -ItemType Directory -Force -Path $CARPETA_DESTINO | Out-Null

# 4. Ejecutar mongodump apuntando a tu clúster de Atlas
# Asegúrate de que mongodump.exe esté en el PATH
& mongodump.exe --uri "mongodb+srv://tester01:miclave123@bbdd2tpi.u9g34v6.mongodb.net/mantenimiento_hogar" --out $CARPETA_DESTINO

Write-Output "¡Resguardo completado con éxito en la carpeta $CARPETA_DESTINO!"
