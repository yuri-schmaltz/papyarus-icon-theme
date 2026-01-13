#!/bin/bash
# Papyarus Coverage Enhancement
# Adds common aliases for popular applications

SIZES="16x16 22x22 24x24 32x32 48x48 64x64"

add_alias() {
    local target=$1
    local alias_name=$2
    for size in $SIZES; do
        current_apps="Papyarus/$size/apps"
        if [ -f "$current_apps/$target.svg" ] && [ ! -f "$current_apps/$alias_name.svg" ]; then
            ln -sf "$target.svg" "$current_apps/$alias_name.svg"
            echo "Added alias ($size): $alias_name -> $target"
        fi
    done
}

# IDEs & Editors
add_alias "visual-studio-code" "com.visualstudio.code"
add_alias "visual-studio-code" "vscode"
add_alias "visual-studio-code" "code"
add_alias "sublime-text" "sublime_text"
add_alias "atom" "com.github.atom"

# Browsers
add_alias "google-chrome" "chrome"
add_alias "google-chrome" "google-chrome-stable"
add_alias "firefox" "firefox-esr"
add_alias "brave-browser" "brave"

# Communication
add_alias "discord" "com.discordapp.Discord"
add_alias "telegram" "org.telegram.desktop"
add_alias "slack" "com.slack.Slack"

# Media
add_alias "vlc" "org.videolan.VLC"
add_alias "spotify-client" "spotify"
add_alias "spotify-client" "com.spotify.Client"

echo "Coverage enhancement done."
