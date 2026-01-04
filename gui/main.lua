local GameState = require("game_state")

function love.load(args)
    -- Parse command line arguments
    local music_path = nil
    
    -- Check for music directory argument
    if args and #args > 0 then
        for i, arg in ipairs(args) do
            -- Skip LÖVE2D internal arguments
            if not arg:match("^%-") and arg ~= "." and arg ~= "gui" then
                music_path = arg
                print("Music path from command line:", music_path)
                break
            end
        end
    end
    
    -- Set environment variable for GameState to use
    if music_path then
        -- Expand relative paths to absolute
        if not music_path:match("^/") and not music_path:match("^~") then
            local current_dir = love.filesystem.getWorkingDirectory()
            music_path = current_dir .. "/" .. music_path
        end
        
        -- Expand ~ to home directory
        if music_path:match("^~") then
            local home = os.getenv("HOME") or "/home/" .. (os.getenv("USER") or "user")
            music_path = music_path:gsub("^~", home)
        end
        
        os.execute("export RHYTHM_MUSIC_PATH='" .. music_path .. "'")
        -- Also set it directly for this session
        _G.RHYTHM_MUSIC_PATH = music_path
        print("Set music path:", music_path)
    end

    love.window.setTitle("Rhythm")
    love.window.setMode(800, 600, {
        resizable = true,
        minwidth = 600,
        minheight = 400,
        vsync = true
    })

    local success, iconData = pcall(love.image.newImageData, "assets/logo/logo.png")
    if success then
        love.window.setIcon(iconData)
        print("App icon set successfully")
    else
        print("Warning: Could not load app icon from assets/logo/logo.png:", iconData)
    end

    GameState:init()

    print("rhythm gui initialized")
end

function love.update(dt)

    GameState:update(dt)
end

function love.draw()

    love.graphics.clear(GameState.theme.background)

    GameState:draw()
end

function love.keypressed(key, scancode, isrepeat)

    GameState:keypressed(key, scancode, isrepeat)

    if key == "escape" then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button, istouch, presses)

    GameState:mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)

    GameState:mousereleased(x, y, button, istouch, presses)
end

function love.mousemoved(x, y, dx, dy, istouch)

    GameState:mousemoved(x, y, dx, dy, istouch)
end

function love.resize(w, h)

    GameState:resize(w, h)
end

function love.filedropped(file)

    print("File dropped:", file:getFilename())
    GameState:handleDroppedFile(file)
end

function love.directorydropped(path)

    print("Directory dropped:", path)
    GameState:handleDroppedDirectory(path)
end

function love.quit()

    GameState:cleanup()
    print("rhythm gui shutting down")
end