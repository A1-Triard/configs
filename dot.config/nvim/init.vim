set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'rust-lang/rust.vim'
call plug#end()

syntax enable
filetype plugin indent on
autocmd FileType fstab set shiftwidth=8 softtabstop=8
autocmd FileType toml set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType c set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType asm set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType cpp set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType sh set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType zsh set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType lua set shiftwidth=4 softtabstop=4 expandtab
autocmd FileType yaml set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType markdown set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType fortran set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType python set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html set shiftwidth=2 softtabstop=2 expandtab
highlight Visual cterm=inverse
set guicursor=a:blinkon0
set title
set number relativenumber

command E :set spell spelllang=en
command R :set spell spelllang=ru,en
