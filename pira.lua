--[[
MIT License

Copyright (c) 2025 Eloi Nuage Hariot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

os.setlocale("C.UTF-8")

_G.pira = {}

pira.dependencies = {
    "curses",
    "socket"
}

local unpack = table.unpack or unpack

pira.get_dependencies = function()
    local dependencies = {}

    for _, dependency in ipairs(pira.dependencies) do
        table.insert(dependencies, require(dependency))
    end

    return unpack(dependencies)
end

pira.get_dependencies()

pira.modules = {
    "pira-graphics",
    "pira-keyboard",
    "pira-mouse",
    "pira-window",
    "pira-timer",
    "pira-run"
}

pira.get_modules = function()
    local modules = {}

    for _, module in ipairs(pira.modules) do
        table.insert(modules, require("pira." .. module))
    end

    return unpack(modules)
end

pira.graphics, pira.keyboard, pira.mouse, pira.window, pira.timer, pira.run = pira.get_modules()