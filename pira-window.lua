local window = {
    get_width = function()
        local win_w, _ = screen:getmaxyx()
        return win_w
    end,
    get_height = function()
        local _, win_h = screen:getmaxyx()
        return win_h
    end
}

return window