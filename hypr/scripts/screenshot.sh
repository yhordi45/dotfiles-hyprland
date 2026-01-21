#!/bin/bash
# Toma captura de una región y la guarda en ~/Imágenes
grim -g "$(slurp)" ~/Imágenes/Captura_$(date +%Y-%m-%d_%H-%M-%S).png