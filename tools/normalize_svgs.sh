#!/bin/bash
# Papyarus SVG Normalization Script
# Uses existing project sed filters to clean SVGs

SCRIPT_DIR="tools"

if [ ! -f "$SCRIPT_DIR/_clean_attrs.sed" ]; then
    echo "Sed filters not found in $SCRIPT_DIR"
    exit 1
fi

echo "Cleaning SVG attributes and styles in Papyarus/ ..."
find Papyarus -type f -name "*.svg" -print0 | xargs -0 sed -r -i -f "$SCRIPT_DIR/_clean_attrs.sed"
find Papyarus -type f -name "*.svg" -print0 | xargs -0 sed -r -i -f "$SCRIPT_DIR/_clean_style_attr.sed"

echo "Normalization complete."
