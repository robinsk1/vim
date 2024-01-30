" Plugins (vim-plug) https://github.com/junegunn/vim-plug
"
" Automatic installation.
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"let g:ale_disable_lsp = 1

call plug#begin('~/.vim/bundle')
" ruby
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
" visuals
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
" lint
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maximbaz/lightline-ale'
Plug 'ruanyl/vim-gh-line'
Plug 'scrooloose/syntastic'
" js
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
" search
Plug 'rking/ag.vim'
"Plug 'wincent/command-t'
Plug 'ctrlpvim/ctrlp.vim'
" git
Plug 'tpope/vim-fugitive'
" nerdtree
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
" formatting
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" rspec
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-dispatch'
" other
Plug 'oplatek/Conque-Shell'
call plug#end()

syntax on
filetype plugin indent on
colorscheme Tomorrow-Night

set encoding=utf-8
set autoread
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

set wildmenu                    " better file/command completion
set wildmode=list:longest
set wildignore+=*.o,*.obj,*.png,*.jpg,*.gif,tags
set wildignore+=bundle/**,vendor/bundle/**,vendor/cache/**,vendor/gems/**
set wildignore+=log/**,tmp/**,*.scssc,*.sassc,*sass-cache*,coverage/**

set nobackup
set nowritebackup

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" coc.nvim
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

let mapleader=","

let g:ale_sign_column_always = 1
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_enable_hover = 0
let g:ale_hover_to_floating_preview = 0
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 'current'
let g:ale_lint_on_text_changed = 'never'

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
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

let g:NERDTreeShowHidden = 1


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" autocmd BufRead,BufNewFile *.ui set filetype=ruby
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
nmap <leader>s :source ~/.vimrc<cr>
nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>b :CtrlPBuff<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>
nmap <leader>g :silent Ggrep<space>
nmap <leader>lc :lclose<cr> 

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']

command! Difft windo diffthis
command! Diffo windo diffoff
