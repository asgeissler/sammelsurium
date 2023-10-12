" My vimrc config for the improved VI editor
"
" TODO on new installations: Install Vundle with
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Afterwards run ":VundleInstall" in vim to get the plugins installed
"
" Summary of config:
" - custom leader ','
" - Zotero citation manager
" - <leader>l for showing whitespace characters
" - Some handy plugins
" - Dracular/onehalf coloration
" - variety of goodies copy/pasted from other peoples vimrc's
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General required options
set nocompatible
filetype off


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Connect with the 'better-bibtex' plugin for zotero for inserting references
map <leader>zl :r!curl -s "http://localhost:23119/better-bibtex/cayw?format=biblatex"<CR>
map <leader>zp :r!curl -s "http://localhost:23119/better-bibtex/cayw?format=pandoc&brackets=T"<CR>
map <leader>zw :r!curl -s "http://localhost:23119/better-bibtex/cayw?format=scannable-cite"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins

" Start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Bundle 'gmarik/vundle'

filetype plugin indent on

"Autosaving
Bundle 'vim-scripts/vim-auto-save'
    let g:auto_save = 1

" Improve the Status line
Bundle 'itchyny/lightline.vim'
    set laststatus=2   " Always show the statusline
    set encoding=utf-8 " Necessary to show Unicode glyphs
    set noshowmode     " don't explicitly show mode
    let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" A simple file manager
Bundle 'scrooloose/nerdtree'
    " Toggle visibility of NERDtree
    map <leader>n :NERDTreeToggle<CR>


" Latex
Bundle 'lervag/vim-latex'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
set spelllang=en
set spell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General UI stuff

syntax enable

" Enable mouse only in insert mode
set mouse=n

" Automatically change working directory
set autochdir

" Custom leader
nmap , <leader>

" Fast saving
nmap <leader>w :w!<cr>

" Make shortcut
map <leader>m :make<CR>

" Custom coloring
" set background=dark
" Bundle 'dracula/vim', {'name': 'dracula'}
" colorscheme dracula
Bundle 'sonph/onehalf', { 'rtp': 'vim' }
set background=light
colorscheme onehalflight

 
" Show suspicious white-space
"set list
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:-
" Use <leader>l to toggle display of white-space
nmap <leader>l :set list!<CR>

" Quick Escape in interactive mode
imap jj <ESC>

" Search ignores case
set ignorecase

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentions

" Use spaces instead of tabs
set expandtab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Line break on 80 characters
set linebreak
set tw=80
" show 80th column
" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Word Count helper

function! WordCount()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WordCount call WordCount()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" helpers for quick commenting and un-commenting of code

" most code
map ,c :s/^/# /<CR>
map ,C :s/^[#] //<CR>

" html
"map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
"map ,> :s/^\(<!--\) \(.*\) \(-->\)$/\2/<CR>
