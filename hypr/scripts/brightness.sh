#!/bin/bash
# Script para brillo (requiere brightnessctl)

case $1 in
    up)
        brightnessctl s +5%
        ;;
    down)
        brightnessctl s 5%-
        ;;
esac