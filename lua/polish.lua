-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set the colorscheme again so that 'g' variables for gruvbox-material get applied
vim.cmd("colorscheme gruvbox-material")

-- Set this here as astrocore no longer sets it for ssh connections
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard

-- Prevent indent of wrapped lines
vim.opt.breakindent = false

-- Disable search highlighting
vim.opt.hlsearch = false

-- Break wrapped line on the word instead of on any letter
vim.opt.linebreak = true

vim.opt.spelllang = "en_gb"

-- Disable persistent undo
vim.opt.undofile = false

-- Update terminal title
vim.opt.title = true

-- Show the command bar
vim.opt.cmdheight = 1

-- Hide the fold column
vim.opt.foldcolumn = "0"

-- Ignore node_modules when searching with vimgrep
vim.opt.wildignore:append("*/node_modules/*")

-- Set :grep to use ripgrep for searching
vim.opt.grepprg="rg --vimgrep -uu"
vim.opt.grepformat="%f:%l:%c:%m"

-- When scrolling, set number of lines that appear above and below the cursor
vim.opt.scrolloff = 6

--
-- Set key bindings
--

-- Save if modified
vim.keymap.set("n", "<C-s>", ":up<CR>")

-- j and k move up and down within long paragraphs
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Allow multiple pasting
vim.keymap.set("v", "p", '"_dP')

-- Make x delete without modifing registers
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_d')

-- Hop
vim.keymap.set("n", "s", "<cmd>HopWord<CR>")
vim.keymap.set("n", "S", "<cmd>HopLineStart<CR>")
vim.keymap.set("v", "s", "<cmd>HopWord<CR>")
vim.keymap.set("v", "S", "<cmd>HopLineStart<CR>")
vim.keymap.set("o", "gs", "<cmd>HopWord<CR>")

-- Remain in visual mode after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- use <Leader>gG to open quickfix list and Grep for a query
vim.keymap.set("n", "<Leader>gG", ":copen | :silent :grep! ")

-- use <Leader>gg to find and replace with GrugFar
vim.keymap.set("n", "<Leader>gg", "<cmd>GrugFar<CR>")

--
-- Autocommands
--
local my_acs = vim.api.nvim_create_augroup("my_acs", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  desc = "Clear unwanted format options",
  group = my_acs,
  callback = function()
    vim.o.formatoptions = vim.o.formatoptions:gsub("t", "")
    vim.o.formatoptions = vim.o.formatoptions:gsub("c", "")
    vim.o.formatoptions = vim.o.formatoptions:gsub("r", "")
    vim.o.formatoptions = vim.o.formatoptions:gsub("o", "")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable completions for text files",
  group = my_acs,
  pattern = "text",
  callback = function()
    require('cmp').setup.buffer { enabled = false } -- Disable completions
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable completions for markdown files",
  group = my_acs,
  pattern = "markdown",
  callback = function()
    require('cmp').setup.buffer { enabled = false } -- Disable completions
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable completions and enable spellcheck for mail files",
  group = my_acs,
  pattern = "mail",
  callback = function()
    require('cmp').setup.buffer { enabled = false } -- Disable completions
    vim.opt.spell = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Disable completions and enable spellcheck for gitcommit files",
  group = my_acs,
  pattern = "gitcommit",
  callback = function()
    require('cmp').setup.buffer { enabled = false } -- Disable completions
    vim.opt.spell = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Use width 4 tabs and auto format on save in Go files",
  group = my_acs,
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = false
    vim.opt_local.copyindent = true
    vim.opt_local.preserveindent = true
    vim.opt_local.softtabstop = 0

    -- vim.g.autoformat_enabled = true
  end
})

-- Set up custom filetypes
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})
-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
