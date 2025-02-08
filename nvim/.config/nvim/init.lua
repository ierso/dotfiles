-- Load all configuration files
require("cory.config.options")
require("cory.config.keymaps")
require("cory.config.lazy")  -- This should be loaded after keymaps for leader key
require("cory.config.autocmds")
