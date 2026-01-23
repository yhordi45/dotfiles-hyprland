#!/bin/bash

DIR="$HOME/Imágenes"
FILE="$DIR/Captura_$(date +%Y-%m-%d_%H-%M-%S).png"

# Crear carpeta si no existe
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# 1. Obtener la selección de área primero
GEOMETRY=$(slurp)

# 2. VERIFICACIÓN: Si la geometría está vacía (porque diste Esc o Click Derecho)
# el script se detiene aquí y NO crea ningún archivo.
if [ -z "$GEOMETRY" ]; then
    exit 0
fi

# 3. Si llegamos aquí, es que sí seleccionaste algo. Tomamos la foto.
grim -g "$GEOMETRY" - | tee "$FILE" | wl-copy

# Notificación (Opcional, la configuraremos mejor luego)
notify-send "Captura Guardada" "Copiada al portapapeles"
