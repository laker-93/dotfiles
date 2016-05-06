"Vundle settings - filetype has to be off initially. Can be turned on
"after installation of bundles
set nocompatible   " Disable vi-compatibility
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'easymotion/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'sjl/badwolf'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'

"needed for nercommenter
filetype plugin on
"re map arrow keys to nothing
no <down> ddp
no <right> <Nop>
no <up> ddkP
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

"coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey

"stuff for c and c++
"Vim has a gf command (and related, <C-W><C-F> to open in new tab) which open
"file whose name is under or after the cursor. This feature is extremely
"useful for browsing header files.
"
"By default, Vim searches file in working directory. However, most projects
"have separated directory for include files. Thus, you should set Vim’s path
"option to contain a comma-separated list of directories to look for the file.
let &path.="src/include,/usr/include/A,"

"quick maps - leader is '\'
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i

map <left> :NERDTreeTabsToggle<CR>

"Re map some navigation commands to auto center on argument
nmap G Gzz
nmap n nzz
nmap } }zz
nmap N Nzz
nmap { {zz

"navigation like Firefox.

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l>   :tabnext<CR>
map <C-t>     :tabnew<CR>

"Navigational commands within directories
nnoremap <leader>pwd :redir @* <bar> echo expand('%:p') <bar> redir END <CR>

" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
nmap g<C-O> o<ESC>k
" gO to create a new line below cursor in normal mode
nmap gO O<ESC>j


syntax on
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols = 'fancy'
set t_Co=256
set laststatus=2 
set fillchars+=stl:\ ,stlnc:\
set relativenumber
set number


"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"vertical line indentation
let g:indentLine_colour_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
