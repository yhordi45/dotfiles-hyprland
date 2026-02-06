#!/bin/bash

# Configuración
step=2   # Paso de volumen (2%)

# Función para enviar notificación (Opcional, pero útil)
function send_notification {
    volume=$(pamixer --get-volume)
    # Icono dinámico según volumen
    if [ "$volume" -eq 0 ]; then
        icon=""
    elif [ "$volume" -lt 50 ]; then
        icon=""
    else
        icon=""
    fi
    
    # Enviamos notificación rápida con ID fija (para que se reemplace a sí misma y no se acumule)
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-medium "$icon Volumen: ${volume}%"
}

case $1 in
    up)
        # pamixer -i X sube volumen. Por defecto NO pasa del 100%.
        pamixer -i $step
        send_notification
        ;;
    down)
        pamixer -d $step
        send_notification
        ;;
    mute)
        pamixer -t
        if $(pamixer --get-mute); then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low " Silenciado"
        else
            send_notification
        fi
        ;;
esac
