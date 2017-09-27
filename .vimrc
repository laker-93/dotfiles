"Vundle settings - filetype has to be off initially. Can be turned on
"after installation of bundles
set nocompatible   " Disable vi-compatibility
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'easymotion/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'sjl/badwolf'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'jvirtanen/vim-octave'

call vundle#end()
filetype plugin indent on
"YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'
"let g:ycm_server_python_interpreter = 'python2'
"needed for nercommenter
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

"for solarized coloring
syntax enable
set background=dark
colorscheme solarized

"use system clipboard with tmux
set clipboard=unnamed

"for solarized running in terminal
if colors_name == 'solarized'
      if has('gui_macvim')
              set transparency=0
                endif

                  if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
                          let g:solarized_termcolors = &t_Co
                              let g:solarized_termtrans = 1
                                  colorscheme solarized
                                    endif

                                      call togglebg#map("<F2>")
                                  endif

"coding style
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set ignorecase
set smartcase
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

" Apply YCM FixIt
map <F9> :YcmCompleter FixIt<CR>

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

" Remove trailing whitespaces with :RmTrailSpaces
command RmTrailSpaces execute '%s/\s\+$//g'

"Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END 

" Use keywords from Octave syntax language file for autocomplete
  if has("autocmd") && exists("+omnifunc")
     autocmd Filetype octave
        \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif 
