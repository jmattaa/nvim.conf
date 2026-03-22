-- TODO!!!!!!!! NOW WE WRITE THE THEME FILE EVERY TIME NEOVIM IS OPENED
-- COULD I DO SOMETHING BETTER???????????????/
-- rn it works

local M = {}

local function buildpalette()
    local function get(i, fallback)
        return vim.g["terminal_color_" .. i] or fallback
    end

    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

    local function hex(n)
        if type(n) == "number" then
            return string.format("#%06x", n)
        end
        return n
    end

    return {
        bg = hex(normal.bg) or "#000000",
        fg = hex(normal.fg) or "#ffffff",

        ansi = {
            get(0, "#000000"), get(1, "#ff0000"), get(2, "#00ff00"),
            get(3, "#ffff00"), get(4, "#0000ff"), get(5, "#ff00ff"),
            get(6, "#00ffff"), get(7, "#ffffff"), get(8, "#808080"),
            get(9, "#ff0000"), get(10, "#00ff00"), get(11, "#ffff00"),
            get(12, "#0000ff"), get(13, "#ff00ff"), get(14, "#00ffff"),
            get(15, "#ffffff"),
        }
    }
end

M.setcolor = function(name)
    vim.cmd.colorscheme(name)

    local p = buildpalette()
    local file = io.open(os.getenv("HOME") .. "/.config/ghostty/theme", "w")
    if not file then
        vim.notify("Failed to open ghosttu theme file")
    end

    -- for the syntax highlighting in neovim
    file:write("# vim: ft=ghostty\n\n")

    for i, col in ipairs(p.ansi) do
        -- i - cuz it's 1 indexed 😭
        file:write("palette = " .. i - 1 .. "=" .. col .. "\n")
    end

    file:write("background = " .. p.bg .. "\n")
    file:write("foreground = " .. p.fg .. "\n")
    file:write("cursor-color = " .. p.fg .. "\n")
    file:write("cursor-text = " .. p.bg .. "\n")

    -- I'm just flipping bg and fg idk if ts is good
    file:write("selection-background = " .. p.fg .. "\n")
    file:write("selection-foreground = " .. p.bg .. "\n")

    file:close()
end

return M
