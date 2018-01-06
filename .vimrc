" vim: set foldmethod=marker foldlevel=2 nomodeline:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                vimrc for mjyi                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""" General  {{{
set nocompatible
filetype plugin indent on
syntax on
let &fillchars="vert:|,fold: ,diff: "
set cursorline
set diffopt=filler,vertical
set tabstop=2
set shiftwidth=2
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

" }}}

"""  Plugins {{{

call plug#begin('~/.vim/plugged')
"   Look & feel
Plug 'morhetz/gruvbox'                                                "   color theme
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-startify'

"   Manipulate code
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'

"   Format Code
Plug 'junegunn/vim-easy-align'
Plug 'AndrewRadev/splitjoin.vim'                                      "   Struct split and join

"   Render Code
Plug 'junegunn/goyo.vim'
Plug 'suan/vim-instant-markdown',
      \ { 'do': 'npm -g install instant-markdown-d' }                 "   Instantly preview markdown
Plug 'tpope/vim-commentary'
Plug 'benizi/vim-automkdir'

"   Navigate files, buffers and panes with fzf. Require ag.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

"   Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"   Lint Code
Plug 'w0rp/ale'

"   Language
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }


"   Autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete engine
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim', {'for': 'vim'}                        " Vim
  Plug 'wellle/tmux-complete.vim'                               " tmux panes
  Plug 'thalesmello/webcomplete.vim', {'commit': '410e17'}      " chrome
  Plug 'mitsuse/autocomplete-swift'                             " Swift
  " Plug 'Shougo/deoplete-rct'                                    " Ruby
  " Plug 'zchee/deoplete-jedi'                                    " Python
  Plug 'zchee/deoplete-go', { 'do': 'make'}                     " Golang
endif
autocmd FileType c,cpp let b:deoplete_disable_auto_complete = 1

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --go-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }

"
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

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }


"Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

""Tool
Plug 'tweekmonster/startuptime.vim'

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
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
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

" let g:gruvbox_bold = 0
" let g:gruvbox_contrast_dark = 'soft'
set background=dark
let g:seoul256_background = 236
colorscheme seoul256

"" Statusline
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l:%c%V%) '
  let pct = ' %P'
  return '[%n] %F %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction
let &statusline = s:statusline_expr()
"" }}}

""" Startify  {{{
let g:startify_disable_at_vimenter = 1
nnoremap <F4> :Startify<cr>

"" }}}

""" NERDTree   {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F3> :TagbarToggle<cr>
let g:tagbar_width     = 40
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

"" }}}

""" Autocomplete {{{

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  deoplete                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt+=noselect
set completeopt+=noinsert
set completeopt-=preview
"" For Nvim
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3'

" Enable deoplete when InsertEnter. reduces almost 100+ms
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

let g:deoplete#auto_complete_delay=300

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.go = ['around']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"" tmuxcomplete
let g:tmuxcomplete#trigger = ''

" deoplete-go
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer=1

"" autocomplete_swift
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

"  neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#jumpable() ?
  \    "\<Plug>(neosnippet_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vim/snippets'

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               iCompleteMe                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:icm_min_num_of_chars_for_completion = 1
" let g:icm_auto_trigger = 0
" let g:icm_show_diagnostics_ui = 0
" let g:icm_key_invoke_completion = '<C-space>'
" let g:icm_key_detailed_diagnostics = '<leader>d'
" let g:icm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               YouCompleteMe                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = ''

"" }}}

""" FZF  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make :Ag not match file names, only file contents
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
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

""" ALE {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_sign_error = '>'
" let g:ale_sign_warning = '-'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 1000
let g:ale_linters = {
      \ 'go': ['golint', 'go vet', 'go build'],
      \ }

nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
"" }}}

""" vim-go {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vim-go                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:go_fmt_autosave = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_term_mode = "split"
let g:go_term_height = 15
let g:go_term_width = 10

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader><leader>b :<C-u>call <SID>build_go_files()<CR>
  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  " :GoCoverageToggle
  " autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  " :GoInfo
  " autocmd FileType go nmap <Leader>i <Plug>(go-info)
  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

"" }}}

""" Goyo  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  "Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  "Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
nnoremap <Leader>G :Goyo<CR>

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

