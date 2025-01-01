local curses, socket = pira.get_dependencies()

local event = {
    quit = function()
        curses.endwin()
        pira.status = false
    end,
}

return event