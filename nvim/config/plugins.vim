" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Git related
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs' "Make NERDTree work on all tabs
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Cool icons in NerdTree

" File movement
Plug 'justinmk/vim-sneak'

" Theming
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dylanaraps/wal.vim' " Using pywal
Plug 'junegunn/goyo.vim' " Distraction free mode
Plug 'itchyny/lightline.vim' " Powerline
Plug 'ryanoasis/vim-devicons' " Icons for files in NERDTree
Plug 'sainnhe/vim-color-forest-night'

" Style
Plug 'chrisbra/Colorizer' "Show colors in their color

" Syntax
Plug 'posva/vim-vue' " Self explaining
Plug 'arteymix/vim-ocl'
Plug 'luochen1990/rainbow' "Rainbow parentheses
Plug 'HerringtonDarkholme/yats.vim' "Typescript

" System interaction
Plug 'tpope/vim-eunuch' "Offers many system actions on vim

" Utilities
Plug 'chrisbra/NrrwRgn' "Opens selection on a new windows/buffer
Plug 'editorconfig/editorconfig-vim' "Define styles for each type
" Disabled because of unwanted right windows Plug 'mhinz/vim-startify' "Fancy startup screen
Plug 'Yggdroot/indentLine' "Show lines with indentation
Plug 'metakirby5/codi.vim' " Hackers scratchpad

" Fast coding
Plug 'jiangmiao/auto-pairs' "Automatic close of pairs ({[
Plug 'alvan/vim-closetag' "Automatic tag close
Plug 'terryma/vim-multiple-cursors' "Self explaining
Plug 'tpope/vim-surround' "Change surroundings like tags at same time
Plug 'mattn/emmet-vim' "Fast tab extending for html-like

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy finder

" Code
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'w0rp/ale' " Asynchronous linting
Plug 'tpope/vim-commentary' "Simple comments
Plug 'ludovicchabant/vim-gutentags' "Tags for files
Plug 'majutsushi/tagbar' " Tags browser
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' "Snippets
Plug 'Chiel92/vim-autoformat' "Auto file formatting
Plug 'janko-m/vim-test' "Simple testing

" Language Servers
Plug 'natebosch/vim-lsc'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" Scala
Plug 'derekwyatt/vim-scala'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'yarn install' }

" PHP
Plug 'stanangeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'adoy/vim-php-refactoring-toolbox'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Initialize plugin system
call plug#end()
" Finished plug part
