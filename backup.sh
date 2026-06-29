#!/bin/bash
FECHA_ACTUAL=$(date +%Y-%m-%d)
CARPETA_PADRE="resguardos_tpi"
CARPETA_DESTINO="$CARPETA_PADRE/$FECHA_ACTUAL"

echo "Creando directorios en: $CARPETA_DESTINO"

mkdir -p "$CARPETA_DESTINO"

echo "Conectando a MongoDB Atlas y exportando datos (usando Nix-Shell)..."

# Usamos nix-shell para forzar la ejecución de mongodump sin importar el entorno
nix-shell -p mongodb-tools --run "mongodump --uri=\"mongodb+srv://tester01:miclave123@bbdd2tpi.u9g34v6.mongodb.net/mantenimiento_hogar?authSource=admin\" --out=\"$CARPETA_DESTINO\""

echo "¡Resguardo completado con éxito en la carpeta $CARPETA_DESTINO!"