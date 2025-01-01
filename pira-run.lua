local curses, socket = pira.get_dependencies()

local error = function(error)
    curses.endwin ()
    print("Caught an error:")
    print(debug.traceback(error, 2))
    os.exit(2)
end

local init = function()
    _G.screen = curses.initscr()

    curses.cbreak()
    curses.echo(false)
    curses.nl(false)
    curses.curs_set(0)

    pira.status = true

    if type(pira.load) == "function" then pira.load() end

    local last_time = pira.timer.get_time()
    local dt
    local current_time

    while pira.status == true do
        if type(pira.draw) == "function" then pira.draw() end
        screen:refresh()

        current_time = pira.timer.get_time()
        dt = current_time - last_time
        last_time = current_time

        pira.timer.sleep(1 / 60)

        pira.input = curses.getch()
        if type(pira.update) == "function" then pira.update(dt) end
        screen:clear()
    end
end

local run = function()
    xpcall(init, error)
end

return run