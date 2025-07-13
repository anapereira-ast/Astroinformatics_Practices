#!/bin/bash
# Para descargar archivos desde un link usamos

url="https://archive.stsci.edu/missions/tess/download_scripts/sector/"

# Nombramos lo que estamos buscando

light_curve="tesscurl_sector_73_lc.sh"

# Para descargar utilizamos

curl -O "${url}/{$light_curve}"

# Para confirmar la descarga

echo "Archivo descargado: ${light_curve}"

# Para descargar los 20 primeros archivos

head -n 21 "${light_curve}" | bash

echo "Descarga parcial completada (20 archivos)"
