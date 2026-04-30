#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

INPUT="$BASE_DIR/logs/sistema.log"
RESULT_LOG="$BASE_DIR/logs/resultado.log"
ERROR_LOG="$BASE_DIR/logs/errores.log"

echo "[$(date)] Verificando errores..." >> "$RESULT_LOG"

if [ ! -f "$INPUT" ]; then
    echo "[$(date)] ERROR: archivo no existe" >> "$ERROR_LOG"
elif [ ! -r "$INPUT" ]; then
    echo "[$(date)] ERROR: sin permisos de lectura" >> "$ERROR_LOG"
else
    grep "error" "$INPUT" >> "$RESULT_LOG"
fi