#!/bin/bash
# Papyarus Visual Cohesion Script
# Aligns key apps with the Yaru folder palette

FILES=(
    "apps/nautilus.svg"
    "apps/thunar.svg"
    "apps/system-file-manager.svg"
    "apps/papyarus-folders-gui.svg"
    "apps/file-manager.svg"
    "apps/org.gnome.Nautilus.svg"
)

SIZES="16x16 22x22 24x24 32x32 48x48 64x64"

recolor() {
    local file=$1
    local old=$2
    local new=$3
    sed -i "s/$old/$new/gI" "$file"
}

for size in $SIZES; do
    for f in "${FILES[@]}"; do
        full_path="Papyarus/$size/$f"
        if [ -f "$full_path" ]; then
            echo "Recoloring $full_path ..."
            # Primary Blue -> Aubergine
            recolor "$full_path" "#5294e2" "#973552"
            # Secondary Blue -> Darker Aubergine
            recolor "$full_path" "#4877b1" "#672437"
            # Bright Blue -> Lighter Aubergine
            recolor "$full_path" "#42a5f5" "#c04c64"
            recolor "$full_path" "#1e88e5" "#973552"
            recolor "$full_path" "#1565c0" "#672437"
        fi
    done
done

echo "Visual cohesion applied."
