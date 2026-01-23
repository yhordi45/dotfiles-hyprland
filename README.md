# 🎨 Dotfiles de Hyprland para Fedora

Configuración personal y completa de **Hyprland** para Fedora Workstation. Una experiencia de escritorio moderna con Wayland, ideal para usuarios que buscan un entorno limpio, rápido y altamente personalizable.

## ✨ Características

- **🎭 Hyprland**: Compositor Wayland moderno con animaciones fluidas
- **📊 Waybar**: Barra de estado elegante con información del sistema
- **🔍 Rofi**: Lanzador de aplicaciones rápido y configurable
- **💻 Kitty**: Emulador de terminal con transparencia y temas
- **🖼️ Hyprpaper**: Gestor de fondos de pantalla
- **📸 Capturas de pantalla**: `Super + Shift + S` con Grim/Slurp; se guardan en Imágenes y se copian al portapapeles
- **⏻ wlogout**: Menú de salida (apagar, reiniciar, cerrar sesión) con `Super + X` o desde Waybar
- **📋 Portapapeles mejorado**: Historial con Cliphist
- **🎨 Tema Catppuccin Mocha**: Colores modernos y suaves
- **⌨️ Teclado latinoamericano**: Configurado por defecto (latam)
- **👆 Gestos touchpad**: Soporte completo para gestos de 3 dedos
- **🔊 Scripts de audio y brillo**: Volumen y micrófono (`volume.sh`), brillo (`brightness.sh`) con teclas de función

## 📋 Requisitos

- **Fedora Workstation** (probado en versiones 40/41)
- **Conexión a internet** (necesaria para descargar paquetes y fuentes)
- **Permisos sudo** (para instalar paquetes del sistema)

## 🚀 Instalación

Hay dos formas de usar esta configuración, dependiendo de tu situación:

---

## 📀 Uso en Live USB

Esta opción es ideal si quieres **probar la configuración** antes de instalar Fedora como sistema principal, o si estás usando Fedora desde un USB sin instalación permanente.

### Pasos para Live USB:

1. **Inicia Fedora desde el Live USB**
   - Arranca tu sistema desde el USB con Fedora
   - Completa la configuración inicial si es necesario

2. **Abre una terminal**
   - Presiona `Super + Q` (Kitty) o busca "Terminal" en el menú
   - También puedes usar `Ctrl + Alt + T`

3. **Clona el repositorio**
   ```bash
   git clone https://github.com/yhordi45/dotfiles-hyprland.git
   cd dotfiles-hyprland
   ```

4. **Ejecuta el script de instalación**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
   
   El script instalará todos los paquetes necesarios y copiará las configuraciones.

5. **Agrega tu wallpaper** (opcional pero recomendado)
   ```bash
   # Copia tu imagen a la ubicación correcta
   cp /ruta/a/tu/imagen.jpg ~/.config/hypr/wallpaper.jpg
   ```

6. **Personaliza aplicaciones** (opcional)
   - Si no usas Brave, edita `~/.config/hypr/hyprland.conf` y cambia:
     ```bash
     $browser = brave-browser  # Cambia a: firefox, chromium, etc.
     ```
   - Si no usas Nautilus, cambia:
     ```bash
     $fileManager = nautilus  # Cambia a: thunar, nemo, etc.
     ```

7. **Inicia sesión con Hyprland**
   - En la pantalla de inicio de sesión, selecciona "Hyprland" como entorno de escritorio
   - Ingresa con tu usuario

### ⚠️ Nota Importante para Live USB

- **Los cambios NO se guardarán permanentemente** después de reiniciar
- Para hacer la instalación permanente, necesitas instalar Fedora primero (ver siguiente sección)
- Puedes crear un usuario persistente en el Live USB si usas herramientas como `usb-creator` con persistencia

---

## 💾 Instalación como Sistema Principal

Esta es la opción recomendada si **ya tienes Fedora instalado** o planeas instalarlo en tu disco duro.

### Pasos para Instalación Normal:

1. **Instala Fedora Workstation** (si aún no lo tienes)
   - Descarga la ISO desde [getfedora.org](https://getfedora.org/es/workstation/)
   - Crea un USB booteable con herramientas como Fedora Media Writer o Rufus
   - Instala Fedora siguiendo el asistente de instalación

2. **Actualiza el sistema**
   ```bash
   sudo dnf update -y
   ```

3. **Clona el repositorio**
   ```bash
   git clone https://github.com/yhordi45/dotfiles-hyprland.git
   cd dotfiles-hyprland
   ```

4. **Ejecuta el script de instalación**
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
   
   Este script:
   - ✅ Instala Hyprland y todas las dependencias (Waybar, Rofi, Kitty, Hyprpaper, etc.)
   - ✅ Instala wlogout, brightnessctl, Grim, Slurp, Cliphist y herramientas de audio
   - ✅ Descarga e instala fuentes Nerd Fonts (JetBrains Mono)
   - ✅ Copia todas las configuraciones y scripts a `~/.config/`
   - ✅ Configura permisos de ejecución para los scripts (`volume.sh`, `brightness.sh`, `screenshot.sh`)

5. **Configura tu wallpaper**
   ```bash
   # Opción 1: Copiar una imagen existente
   cp /ruta/a/tu/imagen.jpg ~/.config/hypr/wallpaper.jpg
   
   # Opción 2: Descargar una imagen de ejemplo
   wget -O ~/.config/hypr/wallpaper.jpg https://ejemplo.com/wallpaper.jpg
   ```

6. **Personaliza aplicaciones predeterminadas**
   ```bash
   nano ~/.config/hypr/hyprland.conf
   ```
   
   Busca y modifica estas líneas según tus preferencias:
   ```bash
   $fileManager = nautilus      # Cambia si usas otro gestor de archivos
   $browser = brave-browser     # Cambia a tu navegador preferido
   ```

7. **Configura Hyprland como entorno de inicio** (si es necesario)
   - Al reiniciar, en la pantalla de inicio de sesión (GDM/SDDM)
   - Selecciona "Hyprland" en el menú de entornos de escritorio
   - O ejecuta: `echo "exec Hyprland" >> ~/.xinitrc` (para inicio manual)

8. **Reinicia o inicia sesión con Hyprland**
   ```bash
   # Opción 1: Reiniciar el sistema
   sudo reboot
   
   # Opción 2: Cerrar sesión y seleccionar Hyprland en el login
   # Opción 3: Iniciar manualmente desde terminal
   Hyprland
   ```

### 🔄 Después de la Instalación

Una vez que inicies sesión con Hyprland por primera vez:
- Los scripts de volumen, brillo y captura estarán listos para usar
- Las capturas (`Super + Shift + S`) se guardan en `~/Imágenes/Screenshots/` y se copian al portapapeles
- El historial del portapapeles funcionará automáticamente
- Todos los atajos de teclado y controles de ratón estarán configurados
- Puedes usar `Super + X` o el icono de energía en Waybar para abrir wlogout

---

## ⌨️ Atajos de Teclado Principales

### Ventanas y aplicaciones

| Atajo | Acción |
|-------|--------|
| `Super + Q` | Abrir terminal (Kitty) |
| `Super + C` | Cerrar ventana activa |
| `Super + M` | Salir de Hyprland |
| `Super + X` | Menú de salida (wlogout) |
| `Super + E` | Abrir gestor de archivos (Nautilus) |
| `Super + F` | Activar/Desactivar ventana flotante |
| `Super + R` | Abrir lanzador de aplicaciones (Rofi) |
| `Super + B` | Abrir navegador (Brave) |
| `Super + Z` | Historial del portapapeles |
| `Super + Shift + S` | Captura de pantalla (región, guardada en Imágenes y portapapeles) |
| `Super + 1-5` | Cambiar a workspace 1-5 |
| `Super + Shift + 1-5` | Mover ventana a workspace 1-5 |
| `Super + ←/→/↑/↓` | Mover foco entre ventanas |
| `Super + P` | Activar modo pseudo (tiling) |
| `Super + J` | Alternar división de ventanas |

### Teclas de función (por ejemplo Lenovo LOQ: Fn + tecla)

| Tecla | Acción |
|-------|--------|
| `F1` (Mute) | Silenciar/Activar sonido |
| `F2` | Bajar volumen |
| `F3` | Subir volumen |
| `F4` (Mic Mute) | Silenciar/Activar micrófono |
| `F5` | Disminuir brillo |
| `F6` | Aumentar brillo |
| `F12` (Calculator) | Abrir calculadora (GNOME) |

Volumen y brillo usan los scripts `volume.sh` y `brightness.sh` en `~/.config/hypr/scripts/`.

### Multimedia (Fn + flechas / Inicio / Fin)

| Tecla | Acción |
|-------|--------|
| `XF86AudioPlay` | Reproducir/Pausar |
| `XF86AudioStop` | Detener |
| `XF86AudioPrev` | Pista anterior |
| `XF86AudioNext` | Pista siguiente |

Requiere `playerctl` (`sudo dnf install playerctl`).

### Ratón

| Acción | Función |
|--------|---------|
| `Super + scroll abajo/arriba` | Cambiar de workspace |
| `Super + botón izquierdo (arrastrar)` | Mover ventana |
| `Super + botón derecho (arrastrar)` | Redimensionar ventana |

> **Nota:** `Super` es la tecla Windows/Command en tu teclado.

---

## 🎨 Personalización

### Cambiar el Wallpaper

```bash
cp /ruta/a/tu/imagen.jpg ~/.config/hypr/wallpaper.jpg
```

Luego recarga Hyprland:
```bash
hyprctl reload
```

### Cambiar Colores y Apariencia

- **Hyprland**: Edita `~/.config/hypr/hyprland.conf` (sección `decoration`)
- **Waybar**: Edita `~/.config/waybar/style.css`
- **Rofi**: Edita `~/.config/rofi/config.rasi`
- **Kitty**: Edita `~/.config/kitty/kitty.conf`

### Cambiar Aplicaciones Predeterminadas

Edita `~/.config/hypr/hyprland.conf` en la sección `VARIABLES`:
```bash
$terminal = kitty          # Cambia el terminal
$fileManager = nautilus    # Cambia el gestor de archivos
$browser = brave-browser   # Cambia el navegador
```

### Modificar Teclado y Touchpad

Edita `~/.config/hypr/hyprland.conf` en la sección `INPUT`:
```bash
kb_layout = latam  # Cambia a: us, es, br, etc.
```

---

## 📁 Estructura del Proyecto

```
dotfiles-hyprland/
├── hypr/
│   ├── hyprland.conf      # Configuración principal de Hyprland
│   ├── hyprpaper.conf     # Configuración de fondos
│   └── scripts/
│       ├── brightness.sh  # Control de brillo
│       ├── screenshot.sh  # Capturas de pantalla
│       └── volume.sh      # Control de volumen
├── waybar/
│   ├── config             # Configuración de Waybar
│   └── style.css          # Estilos CSS de Waybar
├── rofi/
│   └── config.rasi        # Configuración de Rofi
├── kitty/
│   └── kitty.conf         # Configuración de Kitty
├── install.sh             # Script de instalación automática
└── README.md              # Este archivo
```

---

## 🔧 Solución de Problemas

### Hyprland no aparece en el login

Si Hyprland no aparece en el selector de entornos de escritorio:

```bash
# Verificar que Hyprland está instalado
which Hyprland

# Si no está instalado, reinstálalo
sudo dnf install hyprland
```

### Los iconos no se muestran en Waybar

Asegúrate de que las fuentes Nerd Fonts estén instaladas:

```bash
fc-list | grep "Nerd Font"
# Si no aparece nada, reinstala las fuentes:
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
```

### Las capturas de pantalla no funcionan

Usa `Super + Shift + S` (no Print). Verifica que Grim y Slurp estén instalados:

```bash
sudo dnf install grim slurp
```

### El brillo no funciona

Los controles usan el script `~/.config/hypr/scripts/brightness.sh`. Asegúrate de tener `brightnessctl` instalado:

```bash
sudo dnf install brightnessctl
```

### Las teclas multimedia (Play/Pause, siguiente, etc.) no funcionan

Instala `playerctl`:

```bash
sudo dnf install playerctl
```

### Problemas con el portapapeles

Verifica que Cliphist esté ejecutándose. Revisa los logs de Hyprland:

```bash
# Ver errores de Hyprland
journalctl --user -u Hyprland

# Reiniciar Cliphist manualmente
wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &
```

---

## 📝 Notas Importantes

- **Wallpaper**: Debes agregar manualmente tu imagen `wallpaper.jpg` en `~/.config/hypr/` después de la instalación
- **Aplicaciones opcionales**: El script instala `pavucontrol` para control de audio, pero puedes usar otra herramienta
- **Navegador**: Por defecto está configurado Brave, pero puedes cambiarlo fácilmente
- **Gestor de archivos**: Por defecto usa Nautilus (GNOME), puedes cambiarlo a Thunar, Nemo, etc.
- **Salida**: `Super + M` cierra Hyprland directamente; `Super + X` abre wlogout (apagar, reiniciar, cerrar sesión, etc.)
- **Capturas**: Se guardan en `~/Imágenes/Screenshots/` y también se copian al portapapeles. En algunos portátiles (p. ej. Lenovo) Print envía `Super + Shift + S`, que ya está configurado.

---

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Si encuentras algún error, tienes sugerencias o mejoras, no dudes en abrir un issue o enviar un pull request.

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Siéntete libre de usar, modificar y distribuir esta configuración.

---

## 🙏 Agradecimientos

- [Hyprland](https://hyprland.org/) - Compositor Wayland
- [Waybar](https://github.com/Alexays/Waybar) - Barra de estado
- [Rofi](https://github.com/davatorium/rofi) - Lanzador de aplicaciones
- [Kitty](https://sw.kovidgoyal.net/kitty/) - Emulador de terminal
- [wlogout](https://github.com/ArtsyMacaw/wlogout) - Menú de salida
- [Catppuccin](https://github.com/catppuccin/catppuccin) - Paleta de colores

---

**¡Disfruta de tu nueva configuración de Hyprland! 🚀**
