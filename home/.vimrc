if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" vim: set foldmethod=marker foldlevel=2 nomodeline:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vimrc for mjyi                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" General  {{{
set nocompatible
filetype plugin indent on
syntax on
let &fillchars="vert:|,fold: ,diff: "
set cursorline
set diffopt=filler,vertical
set tabstop=4
set shiftwidth=4
set expandtab smarttab
set hidden
set ignorecase smartcase
set lazyredraw
set list
set listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set noshowmode
set nostartofline
set noswapfile
set nrformats=hex
set number
set scrolloff=5
set shiftround
set shortmess=aIT
set showcmd
set showtabline=2
set sidescrolloff=3
set splitbelow
set splitright
set updatetime=100
set virtualedit=block
set hlsearch
set incsearch
set autoindent
set smartindent
set backspace=indent,eol,start
set laststatus=2

set completeopt+=noselect
set completeopt+=noinsert
set completeopt-=preview
"" For Nvim
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

""" Plugins {{{

call plug#begin('~/.vim/plugged')
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'suan/vim-instant-markdown',
      \ { 'do': 'npm -g install instant-markdown-d' }
Plug 'tpope/vim-commentary'
Plug 'duggiefresh/vim-easydir'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'w0rp/ale'

Plug 'Chiel92/vim-autoformat'

" For syntax 
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'


function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --rust-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
	\  if isdirectory(expand('<amatch>'))
	\|   call plug#load('nerdtree')
	\|   execute 'autocmd! nerd_loader'
	\| endif
augroup END

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'


call plug#end()
"" }}}

""" Mapping {{{

inoremap jk <Esc>
xnoremap jk <Esc>
cnoremap jk <C-c>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

"""" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

"""" Paste from system clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P

"""" Close buffer and window
nnoremap <silent> <Leader>cc :bd<CR>
nnoremap <silent> <Leader>CC :bd!<CR>
nnoremap <Leader>cw :close<CR>

" Save
inoremap <C-s>     <C-o>:update<cr><Esc>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>

" Quit
inoremap <C-q>     <esc>:q<cr>
nnoremap <C-q>     :q<cr>
vnoremap <C-q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" <Leader>c Close quickfix/location window
nnoremap <leader>c :cclose<bar>lclose<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

"  Change tab size
nnoremap <silent><Leader>cst :setlocal ts=4 sts=4 noet <bar> retab! <bar> setlocal ts=2 sts=2 et <bar> retab<CR>
" Remove all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"" }}}

""" colorscheme {{{

set background=dark
" let g:seoul256_background = 237
" colorscheme seoul256
colorscheme onedark

" let g:SnazzyTransparent = 1

" Enable true color 启用终端24位色
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"" }}}

""" lightline {{{
" \ 'separator': { 'left': '⮀', 'right': '' },
" \ 'subseparator': { 'left': '', 'right': '' },
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'fugitive' ], ['cwd'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], ["filetype"] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'V-LINE',
      \   "\<C-v>": 'V-BLOCK',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'S-LINE',
      \   "\<C-s>": 'S-BLOCK',
      \   't': '',
      \ },
      \ 'component': {
      \   'lineinfo': '⭡%3l:%-2v',
      \   'cwd': '%{fnamemodify(getcwd(), ":~")}',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel',
      \   'trailing': 'error',
      \ }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction


function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	\ fname == '__Tagbar__' ? g:lightline.fname :
	\ fname =~ '__Gundo\|NERD_tree' ? '' :
	\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
	\ &ft == 'unite' ? unite#get_status_string() :
	\ &ft == 'vimshell' ? vimshell#get_status_string() :
	\ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
	\ ('' != fname ? fname : '[No Name]') .
	\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠'  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
	\ fname == '__Gundo__' ? 'Gundo' :
	\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
	\ fname =~ 'NERD_tree' ? 'NERDTree' :
	\ &ft == 'unite' ? 'Unite' :
	\ &ft == 'vimfiler' ? 'VimFiler' :
	\ &ft == 'vimshell' ? 'VimShell' :
	\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

"""" lightline-bufferline
let g:lightline#bufferline#filename_modifier = ':~:.' " Show filename relative to current directory
let g:lightline#bufferline#unicode_symbols = 1        " Use fancy unicode symbols for various indicators
let g:lightline#bufferline#modified = ''             " Default pencil is too ugly
let g:lightline#bufferline#unnamed = '[No Name]'      " Default name when no buffer is opened
let g:lightline#bufferline#shorten_path = 1           " Don't compress ~/my/folder/name to ~/m/f/n

"" }}}

""" Startify  {{{
let g:startify_disable_at_vimenter = 1
nnoremap <F4> :Startify<cr>

"" }}}

""" NERDTree   {{{
map <F2> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '.DS_Store']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2

"" }}}

""" Tagbar {{{
nnoremap <F3> :TagbarToggle<cr>
let g:tagbar_width     = 40
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

"" }}}


""" YCM {{{

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" }}}


""" FZF  {{{
" Make :Ag not match file names, only file contents
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>F :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>A :Ag<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"" }}}


""" markdown  {{{
""" Use command `:InstantMarkdownPreview` to trigger preview
let g:instant_markdown_autostart = 0

"" }}}

""" EasyMotion {{{
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
	\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	\   'keymap': {
	\     "\<CR>": '<Over>(easymotion)'
	\   },
	\   'is_expr': 0
	\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
	\   'converters': [incsearch#config#fuzzyword#converter()],
	\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
	\   'keymap': {"\<CR>": '<Over>(easymotion)'},
	\   'is_expr': 0,
	\   'is_stay': 1
	\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

"" }}}

""" EasyAlign {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

""" 'Chiel92/vim-autoformat' {{{
noremap <F6> :Autoformat<CR>
"" }}}

"""  {{{ 
let g:polyglot_disabled = ['markdown']
"" }}}

