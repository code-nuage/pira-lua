local curses, socket = pira.get_dependencies()

local timer = {
    get_time = function()
        return socket.gettime()
    end,
    get_delta_time = function()
        
    end,
    sleep = function(time)
        socket.sleep(time)
    end,
}

return timer