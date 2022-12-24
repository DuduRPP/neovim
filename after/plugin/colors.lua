function ColorMyPencils(color)
    if (color == "tokyonight" or color == "") then
        require("tokyonight").setup({
            style = "night",
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            }
        })
        vim.cmd[[colorscheme tokyonight]]
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
        vim.cmd(":hi LineNr guifg=#6690b7")
    else
        color = color or "catppuccin"
        vim.cmd.colorscheme(color)  -- set the colorscheme
    end
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils("")
