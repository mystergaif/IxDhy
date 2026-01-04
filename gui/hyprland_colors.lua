-- Hyprland Color Palette Integration for Rhythm Music Player
-- This module reads Hyprland color configuration and provides theme colors

local HyprlandColors = {}

-- Default Hyprland color scheme (fallback)
HyprlandColors.default_colors = {
    -- Background colors
    background = {0.08, 0.08, 0.12, 1.0},
    surface = {0.12, 0.12, 0.18, 1.0},
    surface_variant = {0.15, 0.15, 0.22, 1.0},
    
    -- Text colors
    on_background = {0.95, 0.95, 0.98, 1.0},
    on_surface = {0.90, 0.90, 0.95, 1.0},
    on_surface_variant = {0.70, 0.70, 0.80, 1.0},
    
    -- Accent colors
    primary = {0.95, 0.35, 0.65, 1.0},
    secondary = {0.65, 0.35, 0.95, 1.0},
    tertiary = {0.35, 0.65, 0.95, 1.0},
    
    -- State colors
    error = {0.95, 0.25, 0.25, 1.0},
    warning = {0.95, 0.65, 0.25, 1.0},
    success = {0.25, 0.95, 0.45, 1.0},
    
    -- Special colors
    outline = {0.35, 0.35, 0.45, 1.0},
    shadow = {0.0, 0.0, 0.0, 0.4}
}

-- Hyprland color variable mappings (expanded for universal support)
HyprlandColors.hyprland_mappings = {
    -- Standard terminal colors (0-15)
    ["$color0"] = "background", ["$color8"] = "surface",
    ["$color1"] = "error", ["$color9"] = "error",
    ["$color2"] = "success", ["$color10"] = "success", 
    ["$color3"] = "warning", ["$color11"] = "warning",
    ["$color4"] = "primary", ["$color12"] = "primary",
    ["$color5"] = "secondary", ["$color13"] = "secondary",
    ["$color6"] = "tertiary", ["$color14"] = "tertiary",
    ["$color7"] = "on_surface", ["$color15"] = "on_background",
    
    -- Common variables
    ["$background"] = "background", ["$bg"] = "background",
    ["$foreground"] = "on_background", ["$fg"] = "on_background",
    
    -- Catppuccin theme variables
    ["$rosewater"] = "tertiary", ["$flamingo"] = "error",
    ["$pink"] = "primary", ["$mauve"] = "secondary", 
    ["$red"] = "error", ["$maroon"] = "error",
    ["$peach"] = "warning", ["$yellow"] = "warning",
    ["$green"] = "success", ["$teal"] = "tertiary",
    ["$sky"] = "tertiary", ["$sapphire"] = "primary",
    ["$blue"] = "primary", ["$lavender"] = "secondary",
    ["$text"] = "on_background", ["$subtext1"] = "on_surface",
    ["$subtext0"] = "on_surface_variant", ["$overlay2"] = "outline",
    ["$overlay1"] = "surface_variant", ["$overlay0"] = "surface",
    ["$surface2"] = "surface_variant", ["$surface1"] = "surface",
    ["$surface0"] = "surface", ["$base"] = "background",
    ["$mantle"] = "background", ["$crust"] = "background",
    
    -- Tokyo Night theme variables
    ["$tokyonight_bg"] = "background", ["$tokyonight_fg"] = "on_background",
    ["$tokyonight_black"] = "background", ["$tokyonight_red"] = "error",
    ["$tokyonight_green"] = "success", ["$tokyonight_yellow"] = "warning",
    ["$tokyonight_blue"] = "primary", ["$tokyonight_magenta"] = "secondary",
    ["$tokyonight_cyan"] = "tertiary", ["$tokyonight_white"] = "on_background",
    
    -- Gruvbox theme variables
    ["$gruvbox_bg"] = "background", ["$gruvbox_fg"] = "on_background",
    ["$gruvbox_red"] = "error", ["$gruvbox_green"] = "success",
    ["$gruvbox_yellow"] = "warning", ["$gruvbox_blue"] = "primary",
    ["$gruvbox_purple"] = "secondary", ["$gruvbox_aqua"] = "tertiary",
    ["$gruvbox_orange"] = "warning", ["$gruvbox_gray"] = "outline",
    
    -- Nord theme variables
    ["$nord0"] = "background", ["$nord1"] = "surface",
    ["$nord2"] = "surface_variant", ["$nord3"] = "outline",
    ["$nord4"] = "on_surface_variant", ["$nord5"] = "on_surface",
    ["$nord6"] = "on_background", ["$nord7"] = "error",
    ["$nord8"] = "warning", ["$nord9"] = "success",
    ["$nord10"] = "tertiary", ["$nord11"] = "primary",
    ["$nord12"] = "secondary", ["$nord13"] = "secondary",
    ["$nord14"] = "tertiary", ["$nord15"] = "primary",
    
    -- Wallust variables
    ["$wallust_color0"] = "background", ["$wallust_color1"] = "error",
    ["$wallust_color2"] = "success", ["$wallust_color3"] = "warning",
    ["$wallust_color4"] = "primary", ["$wallust_color5"] = "secondary",
    ["$wallust_color6"] = "tertiary", ["$wallust_color7"] = "on_surface",
    ["$wallust_color8"] = "surface", ["$wallust_color9"] = "error",
    ["$wallust_color10"] = "success", ["$wallust_color11"] = "warning",
    ["$wallust_color12"] = "primary", ["$wallust_color13"] = "secondary",
    ["$wallust_color14"] = "tertiary", ["$wallust_color15"] = "on_background",
    ["$wallust_background"] = "background", ["$wallust_foreground"] = "on_background",
    
    -- Pywal variables
    ["$wal_color0"] = "background", ["$wal_color1"] = "error",
    ["$wal_color2"] = "success", ["$wal_color3"] = "warning",
    ["$wal_color4"] = "primary", ["$wal_color5"] = "secondary",
    ["$wal_color6"] = "tertiary", ["$wal_color7"] = "on_surface",
    ["$wal_color8"] = "surface", ["$wal_color9"] = "error",
    ["$wal_color10"] = "success", ["$wal_color11"] = "warning",
    ["$wal_color12"] = "primary", ["$wal_color13"] = "secondary",
    ["$wal_color14"] = "tertiary", ["$wal_color15"] = "on_background",
    
    -- Generic/custom variables
    ["$primary"] = "primary", ["$secondary"] = "secondary",
    ["$tertiary"] = "tertiary", ["$accent"] = "primary",
    ["$highlight"] = "primary", ["$selection"] = "primary",
    ["$border"] = "outline", ["$shadow"] = "shadow",
    ["$surface"] = "surface", ["$elevated"] = "surface_variant",
    ["$panel"] = "surface", ["$sidebar"] = "surface_variant",
    ["$header"] = "surface_variant", ["$footer"] = "surface",
    
    -- Rofi/theme manager variables
    ["$active"] = "primary", ["$urgent"] = "error",
    ["$normal"] = "on_surface", ["$selected"] = "primary",
    ["$alternate"] = "surface_variant"
}

-- Convert hex color to LÖVE2D color format
function HyprlandColors:hexToColor(hex)
    if not hex or type(hex) ~= "string" then
        return nil
    end
    
    -- Remove # if present
    hex = hex:gsub("#", "")
    
    -- Handle different hex formats
    if #hex == 3 then
        -- Short format: #RGB -> #RRGGBB
        hex = hex:gsub("(.)", "%1%1")
    elseif #hex == 6 then
        -- Standard format: #RRGGBB
    elseif #hex == 8 then
        -- With alpha: #RRGGBBAA
    else
        return nil
    end
    
    local r = tonumber(hex:sub(1, 2), 16) or 0
    local g = tonumber(hex:sub(3, 4), 16) or 0  
    local b = tonumber(hex:sub(5, 6), 16) or 0
    local a = 255
    
    if #hex == 8 then
        a = tonumber(hex:sub(7, 8), 16) or 255
    end
    
    return {r / 255, g / 255, b / 255, a / 255}
end

-- Parse Hyprland color configuration
function HyprlandColors:parseHyprlandConfig(config_content)
    local colors = {}
    
    if not config_content then
        return colors
    end
    
    -- Parse color variable definitions
    for line in config_content:gmatch("[^\r\n]+") do
        line = line:gsub("^%s+", ""):gsub("%s+$", "") -- trim whitespace
        
        -- Skip comments and empty lines
        if line:match("^#") or line == "" then
            goto continue
        end
        
        -- Match color variable definitions: $variable = value
        local var, value = line:match("^%$([%w_]+)%s*=%s*(.+)$")
        if var and value then
            -- Clean up the value
            value = value:gsub("^%s+", ""):gsub("%s+$", "")
            value = value:gsub(";.*$", "") -- remove comments
            
            -- Handle different value formats
            local color = nil
            
            -- Hex color (#RRGGBB or #RGB)
            if value:match("^#?[0-9a-fA-F]+$") then
                color = self:hexToColor(value)
            -- RGB function: rgb(RRGGBB) - wallust format
            elseif value:match("^rgb%s*%(") then
                local hex = value:match("rgb%s*%(%s*([0-9a-fA-F]+)%s*%)")
                if hex then
                    color = self:hexToColor("#" .. hex)
                end
            -- RGBA function: rgba(r, g, b, a)
            elseif value:match("^rgba?%s*%(.*,") then
                local r, g, b, a = value:match("rgba?%s*%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*,?%s*([%d%.]*)")
                if r and g and b then
                    r, g, b = tonumber(r) or 0, tonumber(g) or 0, tonumber(b) or 0
                    a = tonumber(a) or 1
                    if a <= 1 then
                        -- Alpha as decimal
                        color = {r / 255, g / 255, b / 255, a}
                    else
                        -- Alpha as 0-255
                        color = {r / 255, g / 255, b / 255, a / 255}
                    end
                end
            -- Reference to another variable
            elseif value:match("^%$") then
                colors["$" .. var] = value -- Store reference for later resolution
            end
            
            if color then
                colors["$" .. var] = color
                print(string.format("Parsed color: $%s = #%02x%02x%02x", var,
                    math.floor(color[1] * 255), 
                    math.floor(color[2] * 255), 
                    math.floor(color[3] * 255)))
            end
        end
        
        ::continue::
    end
    
    -- Resolve variable references
    local max_iterations = 10
    local iteration = 0
    local resolved_any = true
    
    while resolved_any and iteration < max_iterations do
        resolved_any = false
        iteration = iteration + 1
        
        for var, value in pairs(colors) do
            if type(value) == "string" and value:match("^%$") then
                local referenced_color = colors[value]
                if referenced_color and type(referenced_color) == "table" then
                    colors[var] = referenced_color
                    resolved_any = true
                end
            end
        end
    end
    
    return colors
end

-- Read Hyprland configuration files
function HyprlandColors:readHyprlandColors()
    local colors = {}
    
    -- Common Hyprland config locations
    local config_paths = {
        -- Main Hyprland config
        os.getenv("HOME") .. "/.config/hypr/hyprland.conf",
        
        -- Separate color files
        os.getenv("HOME") .. "/.config/hypr/colors.conf", 
        os.getenv("HOME") .. "/.config/hypr/theme.conf",
        os.getenv("HOME") .. "/.config/hypr/mocha.conf",
        
        -- Wallust integration (PRIORITY - most common)
        os.getenv("HOME") .. "/.cache/wallust/colors-hyprland.conf",
        os.getenv("HOME") .. "/.config/hypr/wallust/wallust-hyprland.conf",
        os.getenv("HOME") .. "/.config/wallust/hyprland.conf",
        
        -- Pywal integration  
        os.getenv("HOME") .. "/.cache/wal/colors-hyprland.conf",
        os.getenv("HOME") .. "/.config/hypr/pywal.conf",
        
        -- Catppuccin themes
        os.getenv("HOME") .. "/.config/hypr/catppuccin-mocha.conf",
        os.getenv("HOME") .. "/.config/hypr/catppuccin-macchiato.conf",
        os.getenv("HOME") .. "/.config/hypr/catppuccin-frappe.conf",
        os.getenv("HOME") .. "/.config/hypr/catppuccin-latte.conf",
        
        -- Other theme managers
        os.getenv("HOME") .. "/.config/hypr/nwg-look.conf",
        os.getenv("HOME") .. "/.config/hypr/themix.conf",
        
        -- System-wide configs
        "/etc/hypr/hyprland.conf",
        "/usr/share/hypr/colors.conf"
    }
    
    -- Try to read from each config file
    for _, path in ipairs(config_paths) do
        local file = io.open(path, "r")
        if file then
            local content = file:read("*all")
            file:close()
            
            print("Reading Hyprland colors from:", path)
            local parsed_colors = self:parseHyprlandConfig(content)
            
            -- Merge colors (later files override earlier ones)
            for var, color in pairs(parsed_colors) do
                colors[var] = color
            end
        end
    end
    
    -- Try to read from XDG cache (pywal, wallust, etc.)
    local cache_paths = {
        os.getenv("HOME") .. "/.cache/wal/colors",
        os.getenv("HOME") .. "/.cache/wallust/colors",
        os.getenv("HOME") .. "/.cache/material-colors/colors",
        os.getenv("XDG_CACHE_HOME") and (os.getenv("XDG_CACHE_HOME") .. "/wal/colors") or nil
    }
    
    for _, path in ipairs(cache_paths) do
        if path then
            local file = io.open(path, "r")
            if file then
                print("Reading colors from cache:", path)
                local line_num = 0
                for line in file:lines() do
                    line_num = line_num + 1
                    line = line:gsub("^%s+", ""):gsub("%s+$", "")
                    if line ~= "" and not line:match("^#") then
                        local color = self:hexToColor(line)
                        if color then
                            colors["$color" .. (line_num - 1)] = color
                        end
                    end
                end
                file:close()
            end
        end
    end
    
    -- Try to get colors from environment variables (set by theme managers)
    local env_vars = {
        -- Pywal
        "color0", "color1", "color2", "color3", "color4", "color5", "color6", "color7",
        "color8", "color9", "color10", "color11", "color12", "color13", "color14", "color15",
        "background", "foreground",
        
        -- Wallust
        "wallust_color0", "wallust_color1", "wallust_color2", "wallust_color3",
        "wallust_color4", "wallust_color5", "wallust_color6", "wallust_color7",
        "wallust_background", "wallust_foreground",
        
        -- Hyprland specific
        "HYPR_COLOR0", "HYPR_COLOR1", "HYPR_COLOR2", "HYPR_COLOR3",
        "HYPR_COLOR4", "HYPR_COLOR5", "HYPR_COLOR6", "HYPR_COLOR7",
        "HYPR_BACKGROUND", "HYPR_FOREGROUND"
    }
    
    for _, var in ipairs(env_vars) do
        local env_value = os.getenv(var)
        if env_value then
            local color = self:hexToColor(env_value)
            if color then
                colors["$" .. var:lower()] = color
                print("Loaded color from environment:", var, "->", env_value)
            end
        end
    end
    
    -- Try to read from common theme files
    local theme_files = {
        -- GTK themes that might have color info
        os.getenv("HOME") .. "/.themes/current/colors",
        os.getenv("HOME") .. "/.local/share/themes/current/colors",
        
        -- Qt themes
        os.getenv("HOME") .. "/.config/qt5ct/colors/current.conf",
        os.getenv("HOME") .. "/.config/qt6ct/colors/current.conf",
        
        -- Rofi themes (often contain color definitions)
        os.getenv("HOME") .. "/.config/rofi/colors.rasi",
        os.getenv("HOME") .. "/.config/rofi/theme.rasi"
    }
    
    for _, path in ipairs(theme_files) do
        local file = io.open(path, "r")
        if file then
            local content = file:read("*all")
            file:close()
            
            -- Try to extract colors from different formats
            self:parseThemeFile(content, colors, path)
        end
    end
    
    return colors
end

-- Parse different theme file formats
function HyprlandColors:parseThemeFile(content, colors, filepath)
    if not content then return end
    
    -- Rofi format: * { color: #hex; }
    for color_name, hex_value in content:gmatch("([%w_%-]+)%s*:%s*(#[0-9a-fA-F]+)") do
        local color = self:hexToColor(hex_value)
        if color then
            colors["$" .. color_name:lower()] = color
        end
    end
    
    -- CSS format: --color: #hex;
    for color_name, hex_value in content:gmatch("%-%-([%w_%-]+)%s*:%s*(#[0-9a-fA-F]+)") do
        local color = self:hexToColor(hex_value)
        if color then
            colors["$" .. color_name:lower()] = color
        end
    end
    
    -- Simple format: color=#hex
    for color_name, hex_value in content:gmatch("([%w_]+)%s*=%s*(#[0-9a-fA-F]+)") do
        local color = self:hexToColor(hex_value)
        if color then
            colors["$" .. color_name:lower()] = color
        end
    end
end

-- Generate Rhythm theme from Hyprland colors
function HyprlandColors:generateTheme(hyprland_colors)
    local theme = {}
    
    -- Start with default colors
    for key, color in pairs(self.default_colors) do
        theme[key] = {color[1], color[2], color[3], color[4]}
    end
    
    -- Override with Hyprland colors where available
    for hypr_var, theme_key in pairs(self.hyprland_mappings) do
        local hypr_color = hyprland_colors[hypr_var]
        if hypr_color and type(hypr_color) == "table" then
            theme[theme_key] = {hypr_color[1], hypr_color[2], hypr_color[3], hypr_color[4]}
        end
    end
    
    -- Generate Rhythm-specific theme structure
    local rhythm_theme = {
        -- Background colors
        bg_primary = theme.background,
        bg_secondary = self:lighten(theme.background, 0.05),
        bg_elevated = self:lighten(theme.background, 0.08),
        bg_surface = theme.surface,
        background = theme.background,
        
        -- Text colors  
        text_primary = theme.on_background,
        text_secondary = theme.on_surface_variant,
        text_muted = self:darken(theme.on_surface_variant, 0.2),
        text_disabled = self:darken(theme.on_surface_variant, 0.4),
        
        -- Accent colors
        accent_pink = theme.primary,
        accent_purple = theme.secondary, 
        accent_blue = theme.tertiary,
        accent_cyan = self:blend(theme.tertiary, theme.success, 0.5),
        accent_orange = theme.warning,
        
        -- Progress colors
        progress_bg = self:darken(theme.surface, 0.1),
        progress_fill = theme.primary,
        
        -- Button colors
        button_normal = self:lighten(theme.surface, 0.05),
        button_hover = self:lighten(theme.surface, 0.1),
        button_active = self:lighten(theme.surface, 0.15),
        button_primary = theme.primary,
        
        -- Glass effect colors
        glass = {theme.surface[1], theme.surface[2], theme.surface[3], 0.90},
        glass_border = {theme.outline[1], theme.outline[2], theme.outline[3], 0.30},
        
        -- Shadow colors
        shadow = theme.shadow,
        shadow_strong = {theme.shadow[1], theme.shadow[2], theme.shadow[3], 0.60},
        
        -- Gradient colors for visualizer
        gradient_main = {
            theme.primary,
            theme.secondary
        },
        gradient_wave = {
            theme.warning,
            theme.primary,
            theme.secondary, 
            theme.tertiary,
            theme.success
        }
    }
    
    return rhythm_theme
end

-- Color manipulation utilities
function HyprlandColors:lighten(color, amount)
    return {
        math.min(1.0, color[1] + amount),
        math.min(1.0, color[2] + amount), 
        math.min(1.0, color[3] + amount),
        color[4]
    }
end

function HyprlandColors:darken(color, amount)
    return {
        math.max(0.0, color[1] - amount),
        math.max(0.0, color[2] - amount),
        math.max(0.0, color[3] - amount), 
        color[4]
    }
end

function HyprlandColors:blend(color1, color2, ratio)
    return {
        color1[1] * (1 - ratio) + color2[1] * ratio,
        color1[2] * (1 - ratio) + color2[2] * ratio,
        color1[3] * (1 - ratio) + color2[3] * ratio,
        color1[4] * (1 - ratio) + color2[4] * ratio
    }
end

-- Main function to load Hyprland theme
function HyprlandColors:loadTheme()
    print("Loading theme colors...")
    
    local hyprland_colors = self:readHyprlandColors()
    local colors_found = 0
    local sources_found = {}
    
    for var, color in pairs(hyprland_colors) do
        if type(color) == "table" then
            colors_found = colors_found + 1
            print(string.format("  %s: #%02x%02x%02x", var, 
                math.floor(color[1] * 255), 
                math.floor(color[2] * 255), 
                math.floor(color[3] * 255)))
        end
    end
    
    if colors_found > 0 then
        print(string.format("Successfully loaded %d colors from theme files", colors_found))
        return self:generateTheme(hyprland_colors)
    else
        print("No theme colors found, using default theme")
        return self:generateTheme({})
    end
end

-- Debug function to show all found colors and sources
function HyprlandColors:debugColors()
    print("\n=== Theme Color Debug Information ===")
    
    local is_running, compositor = self:isHyprlandRunning()
    print(string.format("Compositor: %s (%s)", compositor, is_running and "running" or "not running"))
    
    local colors = self:readHyprlandColors()
    local color_count = 0
    
    print("\nFound colors:")
    for var, color in pairs(colors) do
        if type(color) == "table" then
            color_count = color_count + 1
            print(string.format("  %-20s = #%02x%02x%02x (%.2f, %.2f, %.2f, %.2f)", 
                var,
                math.floor(color[1] * 255), 
                math.floor(color[2] * 255), 
                math.floor(color[3] * 255),
                color[1], color[2], color[3], color[4]))
        end
    end
    
    print(string.format("\nTotal colors found: %d", color_count))
    
    -- Show which mappings will be used
    print("\nColor mappings that will be applied:")
    local mapped_count = 0
    for hypr_var, theme_key in pairs(self.hyprland_mappings) do
        if colors[hypr_var] then
            mapped_count = mapped_count + 1
            print(string.format("  %s -> %s", hypr_var, theme_key))
        end
    end
    
    print(string.format("Total mappings applied: %d", mapped_count))
    print("=====================================\n")
    
    return color_count > 0
end

-- Check if Hyprland or compatible compositor is running
function HyprlandColors:isHyprlandRunning()
    -- Check for Hyprland
    local handle = io.popen("pgrep -x Hyprland 2>/dev/null")
    if handle then
        local result = handle:read("*a")
        handle:close()
        if result and result:match("%d+") then
            return true, "Hyprland"
        end
    end
    
    -- Check for other Wayland compositors that might use similar configs
    local compositors = {"sway", "river", "wayfire", "labwc", "dwl"}
    for _, comp in ipairs(compositors) do
        local handle = io.popen("pgrep -x " .. comp .. " 2>/dev/null")
        if handle then
            local result = handle:read("*a")
            handle:close()
            if result and result:match("%d+") then
                return true, comp
            end
        end
    end
    
    -- Check if we're in a Wayland session (might have theme files anyway)
    local wayland_display = os.getenv("WAYLAND_DISPLAY")
    if wayland_display then
        return true, "Wayland"
    end
    
    return false, "None"
end

-- Auto-detect and load appropriate theme
function HyprlandColors:autoLoadTheme()
    local is_running, compositor = self:isHyprlandRunning()
    
    if is_running then
        print(string.format("%s detected, loading theme", compositor))
        return self:loadTheme()
    else
        -- Even if no compositor is detected, try to load theme files
        -- (user might have theme files from previous sessions)
        print("No Wayland compositor detected, checking for existing theme files")
        local theme = self:loadTheme()
        
        -- Count how many colors we found
        local color_count = 0
        for _, _ in pairs(self:readHyprlandColors()) do
            color_count = color_count + 1
        end
        
        if color_count > 0 then
            print(string.format("Found %d theme colors, using theme", color_count))
            return theme
        else
            print("No theme colors found, using default theme")
            return self:generateTheme({})
        end
    end
end

return HyprlandColors