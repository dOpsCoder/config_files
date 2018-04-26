
set nocompatible              " be iMproved, required
set hidden
set ignorecase
set smartcase
set autoread
set mouse=a
set autoread
au FocusGained,BufEnter * :silent! !
filetype off                  " required

set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pseewald/nerdtree-tagbar-combined'
Plug 'python-mode/python-mode'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'
"Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
Plug 'honza/vim-snippets'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/bin/fzf' | Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-markdown'
Plug 'wesQ3/vim-windowswap'
Plug 'tpope/vim-git'
Plug 'nvie/vim-flake8'
Plug 'tfnico/vim-gradle'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'carakan/new-railscasts-theme'
"Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'tweekmonster/nvim-checkhealth'
Plug 'saltstack/salt-vim'
"Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'

"Golang stuff
Plug 'fatih/vim-go'
Plug 'neovim/go-client'
call plug#end()

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"neovim-python
"let g:python_host_prog = '/home/amalik/.vim/nvim_venv/nvim27/bin/python'
"let g:python_host_prog = '/home/amalik/.vim/nvim_venv/nvim35/bin/python'
let g:python_host_prog = '/export/apps/python/2.7/bin/python'
let g:python3_host_prog = '/export/apps/python/3.5/bin/python3'


let g:deoplete#enable_at_startup = 0
autocmd FileType go  g:deoplete#enable_at_startup = 1


"nerdtree
"nnoremap <leader>n  :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"colorscheme
colorscheme seoul256
set background=dark
let g:gruvbox_italic=1

"filetype indent
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on


syntax on
set modeline
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set number
set nocompatible
set laststatus=2
set backspace=2

"Search as you type
set incsearch

set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color


set termencoding=utf-8

"airline
let g:Airline_symbols = 'fancy'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


set completeopt=menu

"pymode
let g:pymode_rope = 1
let g:pymode_warnings = 1
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_options_max_line_length = 160
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope_autoimport = 1
let g:pymode_rope_goto_definition_cmd = 'e'

let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }



"statusline
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" Markdown stuff
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:instant_markdown_autostart = 0


let g:tagbar_width = 50
let g:tagbar_autofocus = 1

"cursurline highlight
highlight Pmenu cterm=bold ctermbg=White ctermfg=Black guibg=White guifg=Black

set cursorline
"hi CursorLine cterm=NONE ctermbg=black guibg=black


"fzf: List of buffers using fzf, prone to crash tmux
nnoremap <leader>b  :Buffers<CR>








autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

command Diff execute 'w !git diff  % -'
nnoremap <leader>d :Diff<CR>


au BufNewFile,BufRead *.src setf xml
au BufNewFile,BufRead *.xml setf xml

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')
nnoremap <silent> <Leader>bd :Bclose<CR>
nmap <leader>t :TagbarToggle<CR>
"
map <C-x>   :Bclose<CR>
vnoremap . :norm.<CR>


" fzf commands
map <C-T>   :FZF<CR>
map <M-,>   :Buffers<CR>

" map flake8 to F3
autocmd FileType python map <buffer> <leader>fl :call flake8#Flake8()<CR>
"autocmd FileType python call SetPythonOptions()
"function! SetPythonOptions()
"    :call tagbar#autoopen(0)
"endfunction

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically


"lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \  'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ]
      \ }
      \ }

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
