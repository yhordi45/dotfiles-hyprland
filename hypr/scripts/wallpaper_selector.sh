#!/bin/bash

# Directorio de wallpapers
DIR="$HOME/Documents/wallpapers-hyprland"

# Verificación de seguridad
if [ ! -d "$DIR" ]; then
    notify-send "Error" "Carpeta no encontrada"
    exit 1
fi

# 1. Selector con Rofi
SELECTED=$(ls "$DIR" | rofi -dmenu -p "  Wallpapers" -theme-str 'window {width: 400px;}')

# 2. Si el usuario eligió una imagen...
if [ ! -z "$SELECTED" ]; then
    
    # TRUCO: Obtenemos la posición del mouse (Ej: "1920, 500")
    # 'tr -d " "' elimina el espacio en blanco para que quede "X,Y" limpio
    CURSOR_POS=$(hyprctl cursorpos | tr -d " ")

    # 3. Aplicamos el fondo usando esa posición
    swww img "$DIR/$SELECTED" \
        --transition-type grow \
        --transition-pos "$CURSOR_POS" \
        --transition-step 90 \
        --transition-fps 60 \
        --transition-duration 2
        
    # (Hemos borrado la línea de notify-send)
fi
