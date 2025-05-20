vim.opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.cmd [[ colorscheme vim ]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = "fstab",
    callback = function()
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "toml",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "asm",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "zsh",
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
	vim.opt_local.expandtab = true
    end
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "xml",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
	vim.opt_local.expandtab = true
    end
})

vim.opt.colorcolumn = "113"

vim.opt.guicursor = "a:blinkon0"
vim.opt.number = true
vim.opt.relativenumber = true

if vim.env.TERM == "xterm-256color" then
    vim.opt.title = true
end

vim.api.nvim_create_user_command('E', function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
end, {})

vim.api.nvim_create_user_command('R', function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "ru,en"
end, {})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "rust-lang/rust.vim", lazy = false }
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
