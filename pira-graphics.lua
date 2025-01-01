local graphics = {
    rectangle = function(mode, x, y, w, h)
        if mode == "fill" then
            for col = 1, w do
                for row = 1, h do
                    screen:mvaddstr(math.floor(y) + col - 1, math.floor(x) + row - 1, "█")
                end
            end
        elseif mode == "line" then
            for col = 1, w, w - 1 do
                for row = 1, h, h - 1 do
                    screen:mvaddstr(math.floor(y) + col - 1, math.floor(x) + row - 1, "█")
                end
            end
        else
            error(mode .. " mode doesn't exists")
        end
    end,
    draw = function(char, x, y, w, h)
        for col = 1, w do
            for row = 1, h do
                screen:mvaddstr(math.floor(y) + col - 1, math.floor(x) + row - 1, char)
            end
        end
    end,
    print = function(text, x, y)
        screen:mvaddstr(math.floor(y), math.floor(x), text)
    end
}

return graphics