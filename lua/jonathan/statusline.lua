local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "VISUAL LINE",
    [""] = "VISUAL BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT LINE",
    [""] = "SELECT BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "VISUAL REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MOAR",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
    local current_mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#Normal#"
    if current_mode == "n" then
        mode_color = "%#Normal#"
    elseif current_mode == "i" or current_mode == "ic" then
        mode_color = "%#MoreMsg#"
    elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
        mode_color = "%#Constant#"
    elseif current_mode == "R" then
        mode_color = "%#Number#"
    elseif current_mode == "c" then
        mode_color = "%#Identifier#"
    elseif current_mode == "t" then
        mode_color = "%#Identifier#"
    end
    return mode_color
end

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
    if fpath == "" or fpath == "." then
        return " "
    end

    return string.format(" %%<%s/", fpath)
end

local function filename()
    local fname = vim.fn.expand "%:t"
    if fname == "" then
        return ""
    end
    return fname .. " "
end

local function absfilepath()
    return "%F"
end

local function filetype()
    return string.format(" %s ", vim.bo.filetype)
end

local function lineinfo()
    if vim.bo.filetype == "alpha" then
        return ""
    end
    return " %P %l:%c "
end

local function lsp()
    local count = {}
    local levels = {
        errors = "Error",
        warnings = "Warn",
        info = "Info",
        hints = "Hint",
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ""
    local warnings = ""
    local hints = ""
    local info = ""

    if count["errors"] ~= 0 then
        errors = "%#DiagnosticError#  " .. count["errors"]
    end
    if count["warnings"] ~= 0 then
        warnings = "%#DiagnosticWarn#   " .. count["warnings"]
    end
    if count["hints"] ~= 0 then
        hints = "%#DiagnosticInfo#  " .. count["hints"]
    end
    if count["info"] ~= 0 then
        info = "%#DiagnosticInfo#  " .. count["info"]
    end
    return errors .. warnings .. hints .. info .. " %#Normal#"
end

Statusline = {}

Statusline.active = function()
    return table.concat {
        "%#Normal#",
        update_mode_colors(),
        mode(),
        lsp(),
        "%#Constant#",
        filepath(),
        filename(),
        "%#Normal#",
        "%=",
        filetype(),
        "%#Identifier#",
        lineinfo(),
        "%#String#",
    }
end

Statusline.explorer = function()
    return table.concat {
        "%#Normal#",
        "%=",
        absfilepath(),
        "%=",
    }
end

vim.api.nvim_exec([[
    augroup Statusline
    au!
    au FileType netrw setlocal statusline=%!v:lua.Statusline.explorer()
    au BufEnter * setlocal statusline=%!v:lua.Statusline.active()
    au BufWinEnter * setlocal statusline=%!v:lua.Statusline.active()
    augroup END
]], false)

vim.opt.laststatus = 3
