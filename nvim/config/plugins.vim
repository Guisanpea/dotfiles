" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Git related
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-github-dashboard'
Plug 'airblade/vim-gitgutter'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs' "Make NERDTree work on all tabs
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Cool icons in NerdTree

" Theming
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'chriskempson/base16-vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'junegunn/goyo.vim' "Distraction free mode
Plug 'itchyny/lightline.vim' "Powerline
Plug 'ryanoasis/vim-devicons' "Icons for files in NERDTree

" Style
Plug 'chrisbra/Colorizer' "Show colors in their color

" Syntax
Plug 'mboughaba/i3config.vim'
Plug 'sheerun/vim-polyglot' "Indentation and syntax for many languages
Plug 'posva/vim-vue' " Self explaining

" System interaction
Plug 'tpope/vim-eunuch' "Offers many system actions on vim

" Utilities
Plug 'chrisbra/NrrwRgn' "Opens selection on a new windows/buffer
Plug 'wesQ3/vim-windowswap' "Easy swap of windows
Plug 'editorconfig/editorconfig-vim' "Define styles for each type
Plug 'mhinz/vim-startify' "Fancy startup screen

" Fast coding
Plug 'jiangmiao/auto-pairs' "Automatic close of pairs ({[
Plug 'alvan/vim-closetag' "Automatic tag close
Plug 'aperezdc/vim-template' "Template for files
Plug 'terryma/vim-multiple-cursors' "Self explaining
Plug 'tpope/vim-surround' "Change surroundings like tags at same time
Plug 'mattn/emmet-vim'

" Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " Fuzzy finder

" Code
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'apalmer1377/factorus' " Refactoring
Plug 'w0rp/ale' " Asynchronous linting
Plug 'tpope/vim-commentary' "Simple comments
Plug 'ludovicchabant/vim-gutentags' "Tags for files
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' "Snippets

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'yarn install' }

" PHP
Plug 'stanangeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'

" Latex and markdown
Plug 'vim-latex/vim-latex'
Plug 'suan/vim-instant-markdown'
Plug 'godlygeek/tabular' " Needed for plasticboy
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()
" Finished plug part

" Plugins config

"Simple NERDTree
let NERDTreeShowBookmarks=1 "Show Bookmarks by default
nmap <f3> :NERDTreeTabsToggle<cr>
let NERDTreeShowHidden=1 "Show hidden files by default
" Auto NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Prettify NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
" inoremap <expr><tab> pumvisible() ? ""\<c-n>" : ""\<tab>"
" inoremap <expr><s-tab> pumvisible() ? """\<c-p>" : """\<s-tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" UltiSnips
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.config/nvim/config/plugins/UltiSnips/'

" ALE
let g:ale_sign_column_always = 1
let g:ale_sign_error = '⚑'
let g:ale_sign_warning = '⚐'

" LightLine
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"Not neccesary on Lightline
set noshowmode

" EditorConfig
" Avoid using config on ssh and vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Vim-closetag

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
