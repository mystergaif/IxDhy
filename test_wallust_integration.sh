#!/bin/bash

# Test script for Rhythm + Wallust integration
# This script tests the theme integration with a sample wallpaper

echo "🎨 Testing Rhythm + Wallust Integration"
echo "======================================"

# Check if wallust is installed
if ! command -v wallust &> /dev/null; then
    echo "❌ Wallust not found. Please install wallust first:"
    echo "   cargo install wallust"
    exit 1
fi

# Check if love (LÖVE2D) is installed
if ! command -v love &> /dev/null; then
    echo "❌ LÖVE2D not found. Please install love2d first:"
    echo "   sudo apt install love  # Ubuntu/Debian"
    echo "   sudo pacman -S love    # Arch"
    exit 1
fi

echo "✅ Dependencies found"

# Find a wallpaper to test with
WALLPAPER=""
WALLPAPER_DIRS=(
    "$HOME/Pictures/wallpapers"
    "$HOME/Pictures"
    "$HOME/Wallpapers"
    "/usr/share/pixmaps"
    "/usr/share/backgrounds"
)

for dir in "${WALLPAPER_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        WALLPAPER=$(find "$dir" -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" | head -1)
        if [ -n "$WALLPAPER" ]; then
            echo "📸 Found wallpaper: $WALLPAPER"
            break
        fi
    fi
done

if [ -z "$WALLPAPER" ]; then
    echo "⚠️  No wallpaper found. Using wallust with current colors..."
else
    echo "🎨 Generating colors from wallpaper..."
    wallust run "$WALLPAPER"
fi

echo ""
echo "🔍 Checking generated colors..."
if [ -f "$HOME/.cache/wallust/colors-hyprland.conf" ]; then
    echo "✅ Wallust colors found:"
    head -10 "$HOME/.cache/wallust/colors-hyprland.conf"
else
    echo "❌ No wallust colors found"
    exit 1
fi

echo ""
echo "🧪 Testing Rhythm theme detection..."
cd gui
lua test_theme.lua

echo ""
echo "🚀 Launching Rhythm GUI..."
echo "   Press F7 to see debug info"
echo "   Press F5 to reload theme"
echo "   Press F6 to toggle themes"
echo ""

love .

echo ""
echo "✅ Test complete!"