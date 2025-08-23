require("config.options")
require("config.keybinds")
require("config.lazy")

-- require the module
local code_runner = require("utils.code_runner")

-- run your code
vim.keymap.set("n", "<leader>r", code_runner.run_code, { desc = "Run current file" })
