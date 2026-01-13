#!/bin/bash
# Papyarus Local Installer
# Installs THE THEME FROM THE CURRENT DIRECTORY

set -e

DESTDIR="${1:-$HOME/.local/share/icons}"
THEMES="Papyarus Papyarus-Dark Papyarus-Light"

echo "Installing Papyarus to $DESTDIR ..."
mkdir -p "$DESTDIR"

for theme in $THEMES; do
    if [ -d "$theme" ]; then
        echo "Updating $theme ..."
        rm -rf "$DESTDIR/$theme"
        cp -R "$theme" "$DESTDIR/"
        
        # Update cache
        if command -v gtk-update-icon-cache >/dev/null; then
            gtk-update-icon-cache -f -t "$DESTDIR/$theme" || true
        fi
    fi
done

echo "Papyarus installation complete."
