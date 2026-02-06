#!/bin/bash

echo "🚀 Iniciando instalación de Dotfiles Hyprland para Fedora..."

# 1. Instalar paquetes necesarios
echo "📦 Instalando paquetes..."
sudo dnf install -y hyprland waybar rofi kitty \
    swww pamixer \
    brightnessctl grim slurp wl-clipboard cliphist \
    pavucontrol polkit-gnome unzip fontawesome-fonts \
    wlogout

# 2. Instalar fuentes Nerd Fonts
echo "abc Instalando fuentes Nerd..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd -

# 3. Copiar configuraciones
echo "📂 Copiando archivos de configuración..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/kitty

cp -r hypr/* ~/.config/hypr/
cp -r waybar/* ~/.config/waybar/
cp -r rofi/* ~/.config/rofi/
cp -r kitty/* ~/.config/kitty/

# 4. Permisos de ejecución
echo "🔑 Dando permisos a scripts..."
chmod +x ~/.config/hypr/scripts/*.sh

echo "✅ ¡Instalación completada! Ahora puedes reiniciar o iniciar Hyprland."
echo "ℹ️  Nota: Recuerda poner tu imagen 'wallpaper.jpg' en ~/.config/hypr/"
