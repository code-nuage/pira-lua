local curses, socket = pira.get_dependencies()

local keyboard = {
    is_down = function(key)
        if pira.input == key then
            return true
        end
    end
}

return keyboard