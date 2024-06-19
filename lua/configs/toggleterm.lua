local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new {
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
}

function _lazygit_toggle()
  lazygit:toggle()
end

-- Lazygit toggle
-- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua LazygitToggle()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Toggle Lazygit" })


