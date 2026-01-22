#!/bin/bash
# Script para controlar volumen y micrófono

case $1 in
    up)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        ;;
    mic_mute)
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        ;;
esac
