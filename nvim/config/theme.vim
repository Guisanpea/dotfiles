"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Non theme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox Specific
" colo gruvbox
" set background=dark
" let g:gruvbox_contrast_ligth = 'hard'

" set background=light
colorscheme forest-night

" Show white chars in lighter color than text  (I think that the group NonText is exclusive to neovim)
hi NonText ctermfg=grey guifg=#bbbbbb
