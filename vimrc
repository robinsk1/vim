let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'rking/ag.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'wincent/command-t'
Plug 'scrooloose/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-multiple-cursors'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'oplatek/Conque-Shell'
Plug 'tpope/vim-endwise'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
call plug#end()

"execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on
colorscheme Tomorrow-Night

let mapleader=","
let g:rspec_command = "Dispatch bundle exec rspec %"
let g:rspec_runner = "os_x_iterm2"
let g:delimitMate_expand_space = 1 " Turns on/off the expansion of <Space>
let g:delimitMate_expand_cr = 1    " Turns on/off the expansion of <CR>
let g:ctrlp_map = '<leader>,'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:NERDTreeShowHidden = 1

set guifont=Menlo\ Regular:h18
set lines=35 columns=150
set number
set hidden
set history=100
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set noshowmode
set laststatus=2
set splitbelow
set splitright
set incsearch           " Incremental search
set hlsearch            " Highlight search match
set ignorecase          " Do case insensitive matching
set smartcase           " do not ignore if search pattern has CAPS
set ttimeoutlen=50      " fast Esc to normal mode
set noswapfile
set nocp
set mouse=a

"autocmd BufRead,BufNewFile *.ui set filetype=ruby
" nerdtree
" Ctrl-P to Display the file browser tree
nmap <C-p> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>n :NERDTreeFind<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" nerdcommenter
" ,/ to invert comment on the current line/selection
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <leader>fl :Flay<CR>
nnoremap <leader>zs :ConqueTermVSplit zsh<CR>
nnoremap <C-a> <esc>ggVG<CR>
nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

" ,f for global git search for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" see the changes you make to vimrc without having to close & open
nmap <leader>ss :source ~/.vimrc<cr>
nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>b :CtrlPBuff<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>
nmap <leader>g :silent Ggrep<space>
nmap <leader>lc :lclose<cr> 
"map <leader>t :call RunCurrentSpecFile()<CR>
"map <leader>s :call RunNearestSpec()<CR>
"map <leader>l :call RunLastSpec()<CR>
"map <leader>a :call RunAllSpecs()<CR>

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

command! Difft windo diffthis
command! Diffo windo diffoff
