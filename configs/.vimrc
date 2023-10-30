" Plugin Management
call plug#begin()
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Visuals
syntax enable
set number
set relativenumber
set ruler

" highlight options
set textwidth=80
let &colorcolumn=join(range(81,999),",")

" tabs
set shiftwidth=2 " spaces per tab (when shifting)
set tabstop=2    " spaces per tab
set expandtab    " always use spaces instead of tabs
set smarttab     " <tab>

