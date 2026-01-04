# 🎨 Hyprland & Wallust Integration Guide

Rhythm Music Player теперь поддерживает автоматическую синхронизацию с цветовыми темами Hyprland и Wallust!

## ✅ Что работает

- **Автоматическое обнаружение Hyprland** - определяет запущенный композитор
- **Интеграция с Wallust** - читает цвета из `~/.cache/wallust/colors-hyprland.conf`
- **Поддержка RGB формата** - парсит `rgb(RRGGBB)` формат wallust
- **Множественные источники** - сканирует все популярные пути конфигурации
- **Graceful fallback** - использует красивую тему по умолчанию если цвета не найдены

## 🎯 Поддерживаемые источники цветов

### Wallust (приоритет)
```bash
~/.cache/wallust/colors-hyprland.conf  # Основной файл wallust
~/.config/hypr/wallust/wallust-hyprland.conf
```

### Hyprland конфигурация
```bash
~/.config/hypr/hyprland.conf
~/.config/hypr/colors.conf
~/.config/hypr/theme.conf
```

### Pywal
```bash
~/.cache/wal/colors-hyprland.conf
~/.cache/wal/colors
```

### Популярные темы
```bash
~/.config/hypr/catppuccin-*.conf
~/.config/hypr/gruvbox.conf
~/.config/hypr/nord.conf
```

## 🚀 Как использовать

### 1. С Wallust (рекомендуется)
```bash
# Установите wallust
cargo install wallust

# Сгенерируйте цвета из обоев
wallust run /path/to/your/wallpaper.jpg

# Запустите Rhythm - цвета применятся автоматически
love gui
```

### 2. С ручной конфигурацией Hyprland
Добавьте в `~/.config/hypr/hyprland.conf`:
```bash
# Catppuccin Mocha
$base = #1e1e2e
$text = #cdd6f4
$pink = #f5c2e7
$mauve = #cba6f7
$blue = #89b4fa

# Или стандартные цвета терминала
$color0 = #1e1e2e    # background
$color1 = #f38ba8    # red
$color4 = #89b4fa    # blue
$color15 = #cdd6f4   # foreground
```

### 3. Тестирование интеграции
```bash
# Проверка без GUI
cd gui && lua test_theme.lua

# Полный тест с wallust
./test_wallust_integration.sh

# В GUI - нажмите F7 для отладочной информации
```

## 🎨 Поддерживаемые форматы цветов

### Hex формат
```bash
$color1 = #ff0000
$background = #1e1e2e
```

### RGB формат (Wallust)
```bash
$background = rgb(1E1E2E)
$foreground = rgb(CDD6F4)
```

### RGBA формат
```bash
$primary = rgba(245, 194, 231, 1.0)
$secondary = rgba(203, 166, 247, 0.8)
```

## 🔍 Отладка

### Проверка статуса
```bash
# Проверить обнаружение композитора
cd gui && lua -e "
local HyprlandColors = require('hyprland_colors')
local running, compositor = HyprlandColors:isHyprlandRunning()
print('Compositor:', compositor, running and '(running)' or '(not running)')
"

# Проверить найденные цвета
cd gui && lua test_theme.lua
```

### В GUI
- **F7** - показать отладочную информацию о теме
- Консольный вывод покажет найденные цвета при запуске

### Логи при запуске
```
Hyprland detected, loading theme
Reading Hyprland colors from: ~/.cache/wallust/colors-hyprland.conf
Parsed color: $background = #21231e
Parsed color: $foreground = #dbdec1
...
Successfully loaded 18 colors from theme files
```

## 🛠️ Устранение неполадок

### Цвета не загружаются
1. **Проверьте файлы конфигурации:**
   ```bash
   ls -la ~/.cache/wallust/colors-hyprland.conf
   ls -la ~/.config/hypr/hyprland.conf
   ```

2. **Проверьте формат цветов:**
   ```bash
   head ~/.cache/wallust/colors-hyprland.conf
   ```

3. **Запустите отладку:**
   ```bash
   cd gui && lua test_theme.lua
   ```

### Wallust не генерирует файлы
1. **Проверьте конфигурацию wallust:**
   ```bash
   cat ~/.config/wallust/wallust.toml
   ```

2. **Убедитесь что шаблон включен:**
   ```toml
   [templates]
   hyprland = { template = 'hyprland', target = '~/.cache/wallust/colors-hyprland.conf' }
   ```

### GUI не запускается
1. **Проверьте зависимости:**
   ```bash
   which love  # LÖVE2D должен быть установлен
   ```

2. **Запустите из правильной директории:**
   ```bash
   cd gui && love .
   ```

## 📊 Статистика интеграции

При успешной интеграции вы увидите:
- ✅ Compositor detection: DETECTED (Hyprland)
- ✅ Colors found: 18
- ✅ Mappings applied: 18
- ✅ Theme generation: SUCCESS

## 🎵 Результат

После успешной интеграции:
- **Фон** приложения соответствует вашей теме
- **Акцентные цвета** синхронизированы с wallust
- **Визуализатор** использует цвета из вашей палитры
- **Весь интерфейс** гармонично вписывается в вашу рабочую среду

Точно так же, как это работает с cava! 🎶