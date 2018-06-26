" Change tab for two spaces
set expandtab
set tabstop=2
set shiftwidth=2

" Set terminal colors
set termguicolors

" Set lines by default and show chars
set number
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" Set shell to bash to fix nerdtree-git bug in fish
set shell=bash

" Autocmd(s)
"Prettify JS
autocmd FileType javascript set formatprg=prettier\ --stdin
