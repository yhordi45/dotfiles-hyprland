#!/bin/bash

# Define el nombre y la ruta del archivo
DIR="$HOME/Imágenes/Screenshots"
FILE="$DIR/Captura_$(date +%Y-%m-%d_%H-%M-%S).png"

# Crea la carpeta si no existe (por si acaso)
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# Toma la captura:
# 1. grim -g "$(slurp)"  -> Selecciona área
# 2. -                   -> Manda la imagen a la salida estándar (memoria) en lugar de disco
# 3. tee "$FILE"         -> Guarda una copia en tu disco
# 4. wl-copy             -> Manda la otra copia al portapapeles
grim -g "$(slurp)" - | tee "$FILE" | wl-copy

# (Opcional) Notificación para saber que funcionó
notify-send "Captura tomada" "Guardada en Imágenes y copiada al portapapeles"
