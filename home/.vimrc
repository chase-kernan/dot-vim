runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax on
filetype plugin indent on

set autoindent            " always set autoindenting on
set backspace=2           " allow backspacing over everything in insert mode
set cindent               " c code indenting
set diffopt=filler        " keep files synced 
set expandtab             " Get rid of tabs altogether and replace with spaces
set foldcolumn=2          " set a column incase we need it
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden
set guioptions-=m         " Remove menu from the gui
set guioptions-=T         " Remove toolbar
set hidden                " hide buffers instead of closing
set history=5000          " keep 5000 lines of command line history
set ignorecase            " Do case insensitive matching
set incsearch             " Incremental search
set laststatus=2          " always have status bar
set linebreak             " This displays long lines as wrapped at word boundries
set matchtime=2           " Time to flash the brack with showmatch
set nobackup              " Don't keep a backup file
set nocompatible          " Use Vim defaults (much better!)
set nofen                 " disable folds
set notimeout             " i like to be pokey
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms
set ruler                 " the ruler on the bottom is useful
set scrolloff=1           " dont let the curser get too close to the edge
set shiftwidth=4          " Set indention level to be the same as softtabstop
set showcmd               " Show (partial) command in status line.
set showmatch             " Show matching brackets.
set softtabstop=4         " Why are tabs so big?  This fixes it
set textwidth=0           " Don't wrap words by default
set textwidth=80          " This wraps a line with a break when you reach 80 chars
set virtualedit=block     " let blocks be in virutal edit mode
set wildmenu              " This is used with wildmode(full) to cycle options

set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-   " useful for cscope in quickfix
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set tags+=./.tags;/,./tags;/                 " set ctags
set whichwrap+=<,>,[,],h,l,~                 " arrow keys can wrap in normal and insert modes
set wildmode=list:longest,full

set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

set noswapfile
set wrapmargin=80

"When editing a file, make screen display the name of the file you are editing
function! SetTitle()
  if $TERM =~ "^screen"
    let l:title = 'vi: ' . expand('%:t')        
    
    if (l:title != 'vi: __Tag_List__')
      let l:truncTitle = strpart(l:title, 0, 15)
      silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\\"'     
    endif
  endif
endfunction

" Run it every time we change buffers
autocmd BufEnter,BufFilePost * call SetTitle()

runtime macros/matchit.vim

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set number

let mapleader = ","
nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>o o<esc>k
nnoremap <silent> <Leader>O O<esc>j
nnoremap <silent> <Leader>w <c-w><c-w>

nmap <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a

nnoremap <silent> <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <silent> <Leader>sn :call RunNearestSpec()<CR>
nnoremap <silent> <Leader>sf :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

if has("unix")
  nmap <Leader>e :e <C-R>=expand("%:p:h") . "/"<CR>
else
  nmap <Leader>,e :e <C-R>=expand("%:p:h") . "\\"<CR>
endif

let g:airline_powerline_fonts = 1

" let g:SuperTabDefaultCompletionType = "context"

let g:ctrlp_working_path_mode = ''
