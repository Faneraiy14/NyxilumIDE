#!/usr/bin/env bash
# Пакет .deb окремої програми Nx IDE (Ubuntu/Debian).
#   bash packaging/build-deb.sh <тека програми> <версія> <вихідний.deb>
# /opt/nx-ide (свій вбудований nx), команда nx-ide, ярлик «Nx IDE» у меню.
# Команди nx не ставить - вона належить пакету NyxilumNode (конфлікту нема).
set -euo pipefail
umask 022
src="$1"; ver="$2"; out="$3"
work="$(mktemp -d)"
root="$work/pkg"
mkdir -p "$root/DEBIAN" "$root/opt/nx-ide" "$root/usr/bin" "$root/usr/share/applications" "$root/usr/share/icons/hicolor/256x256/apps"
cp -r "$src"/. "$root/opt/nx-ide/"
chmod 755 "$root/opt/nx-ide/Nx"
cat > "$root/usr/bin/nx-ide" <<'SH'
#!/bin/sh
exec /opt/nx-ide/Nx ide "$@"
SH
chmod 755 "$root/usr/bin/nx-ide"
cp "$src/ide/assets/icon.png" "$root/usr/share/icons/hicolor/256x256/apps/nx-ide.png"
cat > "$root/usr/share/applications/nx-ide.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Nx IDE
Comment=Програмування з нуля: блоки (як Scratch) і код NyxilumLang
Exec=/opt/nx-ide/Nx ide
Icon=nx-ide
Terminal=false
Categories=Development;
DESKTOP
size=$(du -sk "$root/opt" | cut -f1)
cat > "$root/DEBIAN/control" <<CONTROL
Package: nx-ide
Version: $ver
Section: devel
Priority: optional
Architecture: amd64
Depends: libc6, libx11-6
Installed-Size: $size
Maintainer: Faneraiy14 <faneraiy14@users.noreply.github.com>
Homepage: https://github.com/Faneraiy14/NyxilumIDE
Description: Nx IDE - програмування з нуля
 Середовище для NyxilumLang: блоки (як Scratch) і код (як VS Code), уроки,
 сцена для ігор, налагоджувач, git, термінал, розширення. Мова вже всередині.
CONTROL
chmod -R go-w "$root"
dpkg-deb --build --root-owner-group "$root" "$out" >/dev/null
rm -rf "$work"
echo "Готово: $out"
