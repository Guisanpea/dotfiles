" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Git related
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-github-dashboard'

" File explorer
Plug 'scrooloose/nerdtree'  
Plug 'Xuyuanp/nerdtree-git-plugin'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'yarn install' }

" Theming
Plug 'morhetz/gruvbox'

" Latex
Plug 'vim-latex/vim-latex'

" Utilities
Plug 'chrisbra/NrrwRgn' "Opens selection on a new windows/buffer
Plug 'wesQ3/vim-windowswap' "Easy swap of windows
Plug 'w0rp/ale' " Asynchronous linting

" Code
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete

" Initialize plugin system
call plug#end()
" Finished plug part

" Plugins config

" Use deoplete.
let g:deoplete#enable_at_startup = 1

