return {
  "akinsho/bufferline.nvim",
  dependencies = { 
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim"
  },
  version = "*",
  config = function()
    local mocha = require("catppuccin.palettes").get_palette "mocha"
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
          all = {
            fill = { bg = mocha.base },
          },
          mocha = {
            background = { fg = mocha.text },
          },
        },
      },
      options = {
        mode = "tabs",
        separator_style = "thin",
      },
    }
  end
}
