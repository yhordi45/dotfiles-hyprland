#!/bin/bash

echo "🚀 Iniciando instalación de Dotfiles Hyprland para Fedora..."

# 1. Instalar paquetes necesarios (Repositorio Oficial)
echo "📦 Instalando paquetes..."
sudo dnf install -y hyprland waybar rofi kitty hyprpaper \
    brightnessctl grim slurp wl-clipboard cliphist \
    pavucontrol polkit-gnome unzip fontawesome-fonts

# 2. Instalar fuentes Nerd Fonts (Necesario para iconos)
echo "abc Instalando fuentes Nerd..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
# Descarga JetBrains Mono Nerd Font
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd -

# 3. Copiar configuraciones
echo "📂 Copiando archivos de configuración..."

# Crear directorios si no existen
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/kitty

# Copiar archivos (asumiendo que estás ejecutando esto desde la carpeta del repo)
cp -r hypr/* ~/.config/hypr/
cp -r waybar/* ~/.config/waybar/
cp -r rofi/* ~/.config/rofi/
cp -r kitty/* ~/.config/kitty/

# 4. Permisos de ejecución
echo "🔑 Dando permisos a scripts..."
chmod +x ~/.config/hypr/scripts/*.sh

echo "✅ ¡Instalación completada! Ahora puedes reiniciar o iniciar Hyprland."
echo "ℹ️  Nota: Recuerda poner tu imagen 'wallpaper.jpg' en ~/.config/hypr/"