#!/bin/bash

# 1. Obtener la fecha actual en formato AAAA-MM-DD
FECHA_ACTUAL=$(date +%Y-%m-%d)

# 2. Definir rutas relativas tal como pide la consigna
CARPETA_PADRE="resguardos_tpi"
CARPETA_DESTINO="$CARPETA_PADRE/$FECHA_ACTUAL"

echo "Iniciando proceso de resguardo..."
echo "Creando directorios en: $CARPETA_DESTINO"

# 3. Crear las carpetas si no existen (-p)
mkdir -p "$CARPETA_DESTINO"

# 4. Ejecutar mongodump apuntando a tu clúster de Atlas
# Usamos --uri para la conexión remota y --out para indicarle el destino exacto
mongodump --uri="mongodb+srv://tester01:miclave123@bbdd2tpi.u9g34v6.mongodb.net/mantenimiento_hogar" --out="$CARPETA_DESTINO"

echo "¡Resguardo completado con éxito en la carpeta $CARPETA_DESTINO!"
