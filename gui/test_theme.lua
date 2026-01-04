#!/usr/bin/env lua

-- Simple test script to check theme integration
local HyprlandColors = require("hyprland_colors")

print("=== Rhythm Theme Integration Test ===\n")

-- Test 1: Check if compositor is running
local is_running, compositor = HyprlandColors:isHyprlandRunning()
print(string.format("Compositor detection: %s (%s)", 
    is_running and "✓ DETECTED" or "✗ NOT DETECTED", 
    compositor))

-- Test 2: Try to load colors
print("\nTesting color loading...")
local colors = HyprlandColors:readHyprlandColors()
local color_count = 0

for var, color in pairs(colors) do
    if type(color) == "table" then
        color_count = color_count + 1
    end
end

print(string.format("Colors found: %d", color_count))

if color_count > 0 then
    print("\nFirst 10 colors found:")
    local count = 0
    for var, color in pairs(colors) do
        if type(color) == "table" and count < 10 then
            count = count + 1
            print(string.format("  %-20s = #%02x%02x%02x", 
                var,
                math.floor(color[1] * 255), 
                math.floor(color[2] * 255), 
                math.floor(color[3] * 255)))
        end
    end
end

-- Test 3: Generate theme
print("\nTesting theme generation...")
local theme = HyprlandColors:generateTheme(colors)

if theme then
    print("✓ Theme generated successfully")
    print("Key theme colors:")
    print(string.format("  Background: #%02x%02x%02x", 
        math.floor(theme.bg_primary[1] * 255),
        math.floor(theme.bg_primary[2] * 255), 
        math.floor(theme.bg_primary[3] * 255)))
    print(string.format("  Primary:    #%02x%02x%02x", 
        math.floor(theme.accent_pink[1] * 255),
        math.floor(theme.accent_pink[2] * 255), 
        math.floor(theme.accent_pink[3] * 255)))
    print(string.format("  Text:       #%02x%02x%02x", 
        math.floor(theme.text_primary[1] * 255),
        math.floor(theme.text_primary[2] * 255), 
        math.floor(theme.text_primary[3] * 255)))
else
    print("✗ Theme generation failed")
end

-- Test 4: Debug output
print("\n" .. string.rep("=", 50))
HyprlandColors:debugColors()

print("=== Test Complete ===")
print("\nTo test in Rhythm:")
print("1. Launch: love gui")
print("2. Press F7 for debug info")
print("3. Press F5 to reload theme")
print("4. Press F6 to toggle themes")