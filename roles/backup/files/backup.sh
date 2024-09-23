#!/bin/bash

# Variables de configuración
BACKUP_DESTINATION="{{ backup_destination }}"
BACKUP_DIRECTORIES="{{ backup_directories | join(' ') }}"
BACKUP_DATE=$(date +%Y-%m-%d)
BACKUP_DIR="${BACKUP_DESTINATION}/${BACKUP_DATE}"
LOG_FILE="${BACKUP_DESTINATION}/backup.log"

# Crear directorio de backup si no existe
mkdir -p "$BACKUP_DIR"

# Realizar el backup incremental diario
echo "$(date): Comenzando backup incremental" >> "$LOG_FILE"
for DIR in $BACKUP_DIRECTORIES; do
    rsync -a --delete "$DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1
done

# Verificar si hoy es viernes
if [ "$(date +%u)" -eq 5 ]; then
    # Comprimir el directorio de backup en un archivo .tar.bz2
    echo "$(date): Comenzando compresión de backups" >> "$LOG_FILE"
    TAR_FILE="${BACKUP_DESTINATION}/backup_${BACKUP_DATE}.tar.bz2"
    tar -cjf "$TAR_FILE" -C "$BACKUP_DESTINATION" "$BACKUP_DATE" >> "$LOG_FILE" 2>&1

    # Eliminar el directorio de backup después de la compresión
    echo "$(date): Eliminando directorio de backup" >> "$LOG_FILE"
    rm -rf "$BACKUP_DIR"
fi
