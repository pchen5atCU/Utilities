" Just some additional settings without any plugin
" User should first load the example .vimrc according to 'vimtutor' program
"
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" command prompt or auto-complete
set wildmenu

" one tab = 4 characters
set tabstop=4 
" indent width
set shiftwidth=4
" when pressing tab, insert 4 spaces instead of a tab
set expandtab

" remap jk to <Esc> in insert mode
inoremap jk <Esc>
"to put swp and backup and undodir in a certain directory
"safely create this directory if it does not exist
if !isdirectory($HOME."/.vimdir")
	    call mkdir($HOME."/.vimdir", "p")
endif

set undodir=~/.vimdir//
set backupdir=~/.vimdir//
set directory=~/.vimdir//

"autocomplete
inoremap nn <c-n>
"inoremap mm <c-p>
"show line number
set number
"indent fold
set foldmethod=indent
"do not fold when starting 
set foldlevelstart=99
