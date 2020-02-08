" Plugins config

""""""""""""""
"  NERDTree  "
""""""""""""""

"Simple NERDTree
let NERDTreeShowBookmarks=1 "Show Bookmarks by default
nmap <f3> :NERDTreeTabsToggle<cr>
"let NERDTreeShowHidden=1 "Show hidden files by default
" Auto NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Prettify NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

""""""""""""""
"  Deoplete  "
""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#option({
            \ 'max_list' : 15,
            \ })

"""""""""""""""
"  UltiSnips  "
"""""""""""""""
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetsDir = '~/.config/nvim/config/plugins/UltiSnips/'
let g:UltiSnipsExpandTrigger = '<c-s>'

"""""""""""
"  A L E  "
"""""""""""
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {'scala': ['scalafmt']}

"""""""""""""""
"  LightLine  "
"""""""""""""""
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

"""""""""""
"  Emmet  "
"""""""""""
"Change leader
let g:user_emmet_leader_key='<C-y>'

""""""""""""""""""
"  EditorConfig  "
""""""""""""""""""
" Avoid using config on ssh and vim-fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""""""""""""""
"  Startify  "
""""""""""""""
" let g:startify_fortune_use_unicode = 1
" Using NERDTree and Startify
" autocmd VimEnter *
"             \   if !argc()
"             \ |   Startify
"             \ |   NERDTree
"             \ |   wincmd w
"             \ | endif
" let g:plug_window = 'tabnew'  " or maybe 'tabnew'

""""""""""""
"  Tagbar  "
""""""""""""
nmap <F4> :TagbarToggle<CR>

""""""""""""""""""
"  Vim-Markdown  "
""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

""""""""""""
"  vimtex  "
""""""""""""
let g:vimtex_compiler_method = 'arara'

"""""""""""""
"  Rainbow  "
"""""""""""""
let g:rainbow_active = 1

""""""""""""""""""""
"  vim-autoformat  "
""""""""""""""""""""
noremap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']

"""""""""""""""""""
"  VIM-Closetags  "
"""""""""""""""""""

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.js,*.vue'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

