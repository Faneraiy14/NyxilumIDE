#!/usr/bin/env bash
# Nx IDE однією командою (Linux, без sudo):
#
#   curl -fsSL https://raw.githubusercontent.com/Faneraiy14/NyxilumIDE/main/install.sh | bash
#
# Програма - у ~/.local/share/nx-ide (з вбудованою мовою), команда nx-ide -
# у ~/.local/bin, ярлик «Nx IDE» - у меню й на робочому столі. Повторний
# запуск = оновлення (або кнопка «Оновити» в самій IDE).
set -euo pipefail

case "$(uname -s)-$(uname -m)" in
    Linux-x86_64) ;;
    *) echo "Цей скрипт - для Linux x64. Windows: NxIDE-win-x64-setup.exe зі сторінки релізів." >&2; exit 1 ;;
esac

dest="$HOME/.local/share/nx-ide"
bin="$HOME/.local/bin"
url="https://github.com/Faneraiy14/NyxilumIDE/releases/latest/download/NxIDE-linux-x64.tar.gz"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
echo "Завантажую Nx IDE..."
curl -fL --progress-bar "$url" -o "$tmp/nxide.tar.gz"
mkdir -p "$tmp/new"
tar -xzf "$tmp/nxide.tar.gz" -C "$tmp/new"

mkdir -p "$dest"
rm -rf "$dest/ide/src" "$dest/ide/examples" "$dest/ide/extensions" "$dest/lib"
cp -R "$tmp/new"/. "$dest/"
chmod +x "$dest/Nx"

mkdir -p "$bin"
cat > "$bin/nx-ide" <<SH
#!/bin/sh
exec "$dest/Nx" ide "\$@"
SH
chmod +x "$bin/nx-ide"

apps="$HOME/.local/share/applications"
mkdir -p "$apps"
cat > "$apps/nx-ide.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Nx IDE
Comment=Програмування з нуля: блоки (як Scratch) і код NyxilumLang
Exec="$dest/Nx" ide
Icon=$dest/ide/assets/icon.png
Terminal=false
Categories=Development;
DESKTOP
desk="$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")"
if [ -d "$desk" ]; then
    cp "$apps/nx-ide.desktop" "$desk/Nx IDE.desktop"
    chmod +x "$desk/Nx IDE.desktop"
    gio set "$desk/Nx IDE.desktop" metadata::trusted true 2>/dev/null || true
fi

echo
echo "Готово: Nx IDE $(grep -o '"version": *"[^"]*"' "$dest/nx-ide.json" | cut -d'"' -f4)."
echo "Запуск - ярлик «Nx IDE» (меню, робочий стіл) або команда nx-ide."
