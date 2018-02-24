"==============================================================================
" Author: James Klein [http://www.jamesmklein.com]
"==============================================================================

" make sure vim-plug is installed so plugins can be installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" after adding new plugins write, source, and run :PlugInstall
" highlight all and :sort to sort
call plug#begin('~/.vim/plugged') " Specify a directory for plugins

" Make sure you use single quotes
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " find or install fzf
Plug 'AndrewRadev/vim-eco'                          " .eco syntax highlighting
Plug 'airblade/vim-gitgutter'                       " show git changes in gutter
Plug 'calebsmith/vim-lambdify'                      " conceal js functions with lambda
Plug 'christoomey/vim-run-interactive'              " allow interactive shell
Plug 'christoomey/vim-tmux-navigator'               " allow ctrl+hjkl to navigate between vim and tmus
Plug 'christoomey/vim-tmux-runner'                  " allows sending commands to tmux from vim
Plug 'easymotion/vim-easymotion'                    " vim motions on speed
Plug 'henrik/vim-indexed-search'                    " display search count
Plug 'itchyny/lightline.vim'                        " vim status bar coloring
Plug 'jbgutierrez/vim-partial'                      " extract haml partials
Plug 'jgdavey/vim-blockle'                          " toggle ruby do and {} blocks
Plug 'jiangmiao/auto-pairs'                         " open and close brackets
Plug 'kana/vim-textobj-user'                        " dependency of nelstrom/vim-textobj-rubyblock
Plug 'kchmck/vim-coffee-script'                     " syntax for coffeescript
Plug 'leafgarland/typescript-vim'                   " syntax for typescript
Plug 'majutsushi/tagbar'                            " tagbar panel for file structure
Plug 'maksimr/vim-jsbeautify'                       " format js and html pages
Plug 'mattn/emmet-vim'                              " html and css editing
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.6' }   " color scheme
Plug 'nelstrom/vim-textobj-rubyblock'               " provide ruby text objects
Plug 'nelstrom/vim-visual-star-search'              " * to serach current word
Plug 'onemanstartup/vim-slim'                       " syntax for slim. Use this over the official slim-template/vim-slim plugin for way better speed. See https://github.com/slim-template/vim-slim/issues/19#issuecomment-50607474
Plug 'posva/vim-vue'                                " syntax highlighting for vueJS
Plug 'ryanoasis/vim-devicons'                       " font icon integration
Plug 'szw/vim-tags'                                 " generate tag files on save
Plug 'thoughtbot/vim-rspec'                         " allow tests running from vim
Plug 'tpope/vim-bundler'                            " support helpers for bundler
Plug 'tpope/vim-fugitive'                           " git interactions
Plug 'tpope/vim-rails'                              " directory navigation and syntax for rails
Plug 'tpope/vim-repeat'                             " allow . repeat on plugin commands
Plug 'tpope/vim-rhubarb'                            " :Gbrowse to get GH url
Plug 'tpope/vim-surround'                           " add paren and quote helpers
Plug 'vim-ruby/vim-ruby'                            " support for running ruby
Plug 'vim-scripts/tComment'                         " comment with `gc`
Plug 'w0rp/ale'                                     " async linter

call plug#end() " Initialize plugin system

let mapleader=" "                     " set leader key to space
" TODO: see if there is a way to speed up colorscheme loading
colorscheme jellybeans                " set color scheme

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set clipboard=unnamed          " copy to the system clipboard
set encoding=utf8              " set to show fonts and glyphs
set expandtab                  " set spaces for tab
set guifont=FuraMono\ Nerd\ Font\ Regular:h12 lsp=2
set hidden                     " Allow buffer change w/o saving
set history=1000		           " keep 1000 lines of command line history
set ignorecase smartcase       " search case insensitive, until first capital used
set incsearch		               " do incremental searching
set lazyredraw                 " Don't update while executing macros
set nobackup 		               " do not keep a backup file. Set for unandpw.txt
set nocompatible               " Use Vim settings, rather than Vi settings
set noswapfile                 " Turn off swap (.swp) files
set nowritebackup	             " don't make backup when overwriting file
set number                     " display line numbers
set numberwidth=5              " give space between relative and static line numbers
set ruler		                   " show the cursor position all the time
set scrolloff=5                " prevent hitting the bottom of the screen
set shell=/bin/zsh             " set vi internal shell to zsh
set shiftwidth=2               " use spaces for indenting with '>'
set showcmd		                 " display incomplete commands
set tabstop=2                  " set tab size to 2
set tags=tags;/                " check the current folder for tags file and keep going up
set undofile		               " keep an undo file (undo changes after closing)
set synmaxcol=256              " stop syntax highlighting on long lines

" ### EasyMotion Config ###
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature

map <Leader> <Plug>(easymotion-prefix)

" Jump to anywhere with `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" give a choice to which char to perform a verb on if there is more than one
" on that line. ie. dfn = delete find 'n' and will highlight all n's
" TODO get this for backward search too
omap f <plug>(easymotion-bd-fl)
omap t <plug>(easymotion-bd-tl)
" verb to a full line such as `dl` to delete to line
omap l <plug>(easymotion-bd-jk)

" applies a verb to the motion with a 1 char search. ie. `dmt` will delete
" until the selected 't'
map m <plug>(easymotion-s)
vmap m <plug>(easymotion-s)

" ### ALE async linting config ###
nmap <silent> [r <Plug>(ale_previous_wrap)
nmap <silent> ]r <Plug>(ale_next_wrap)

" Linting on all changes felt too aggressive. The below settings calls lint on
" certain events, either when I stop interacting or when entering / leaving
" insert mode
set updatetime=1000
" TODO: fix this on personal machine
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertLeave * call ale#Lint()
autocmd TextChanged * call ale#Lint()

let g:ale_lint_delay = 1000
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
" disable ale highlighting on errors (still get the column indicator)
let g:ale_set_highlights = 0

" ### Status bar and light line ###
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'relativepath' ] ],
      \   'right': [ [ 'neomake', 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ],
      \ },
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'mode': 'LightlineMode',
      \   'neomake': 'LightLineNeomake',
      \ },
      \ 'component_expand': {
      \   'neomake': 'LightLineNeomake',
      \ },
      \ 'component_type': {
      \   'neomake': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineNeomake()
    if !exists('*neomake#statusline#LoclistCounts')
        return ''
    endif

    " Count all the errors, warnings
    let total = 0

    for v in values(neomake#statusline#LoclistCounts())
        let total += v
    endfor

    for v in items(neomake#statusline#QflistCounts())
        let total += v
    endfor

    if total == 0
        return ''
    endif

    return 'line '.getloclist(0)[0].lnum. ', 1 of '.total
  endif
endfunction

runtime macros/matchit.vim " use % to switch between if/else/end

" map Enter to insert a new line without entering insert mode
map <CR> o<Esc>
" Don't use Ex mode, use Q for formatting
map Q gq
" leader + i inserts binding.pry
map <Leader>i orequire "pry"; binding.pry<ESC>0
" leader + d inserts debugger;
map <Leader>db odebugger;<ESC>
" insert a frozen string literal tag above the current line
map <Leader>r ggO# frozen_string_literal: true<ESC><cr>D<C-o>
" reindent the entire file
map <leader>= mzgg=G`z
" create parent directories. Good for new files in new dir
map <Leader>mk :call mkdir(expand('%:h'), 'p')<ESC>
" close all other tabs and splits but this one
map <leader>cl :only \| tabo<esc>

" map 0 to go to first char on line
nmap 0 ^
" reload vimrc with leader+so
nmap <leader>so :source $MYVIMRC<cr>
" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :tabe $MYVIMRC<cr>
" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
" Move up and down by visible lines if current line is wrapped
" NOTE: this messes with with jumping up and down relative line numbers
nmap j gj
nmap k gk
" Edit the db/schema.rb Rails file in a split
nmap <leader>sc :vsp db/schema.rb<cr>
" Show tagbar
nmap <Leader>] :TagbarToggle<CR>

" save
inoremap <C-p> <esc>:w<cr>
noremap <C-p> <esc>:w<cr>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" copy current relative file path to system clipboard
nnoremap <leader>cf :let @+ = expand("%")<cr>

" change all single ' to double " in current file
nmap <leader>" :%s/\'/\"/g<cr><C-@><Esc>
" change all double " to single ' in current file
nmap <leader>' :%s/\"/\'/g<cr><C-@><Esc>
" show the current file on github
nmap <leader>br :Gbrowse<cr>
" git blame
nmap <leader>bl :Gblame<cr>

" ctrl+space exits out of search and everything
nnoremap <C-@> <Esc>:noh<CR>
vnoremap <C-@> <Esc>gV
onoremap <C-@> <Esc>
cnoremap <C-@> <C-c>
inoremap <C-@> <Esc>

" RSpec.vim mappings
let g:rspec_command = "VtrSendCommand! bin/rspec {spec}"
let g:rspec_runner = "os_x_iterm"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ### fzf fuzzy find ###
nnoremap <leader>f :Files<cr>
nnoremap <leader>dc :Files app/controllers<cr>
nnoremap <leader>dm :Files app/models<cr>
nnoremap <leader>dv :Files app/views<cr>
nnoremap <leader>ds :Files spec/<cr>

" Search only the files that have not yet been committed
command! Fzfc call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --modified'}))
noremap <Leader>g :Fzfc<cr>

let g:fzf_files_options =
      \ '--reverse ' .
      \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" Don't use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" enable mouse
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END

  " trim trailing whitespace on save
  autocmd BufWritePre * %s/\s\+$//e
  " Bind `q` to close the buffer for help files
  autocmd Filetype help nnoremap <buffer> q :q<CR>
  " rebalance vim panes when window resizes
  autocmd VimResized * :wincmd =
  " force syntax highlighting for vue files
  " https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
  autocmd FileType vue syntax sync fromstart
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Prevent that the langmap option applies to characters that result from a
" mapping.  If unset (default), this may break plugins (but it's backward
" compatible).
if has('langmap') && exists('+langnoremap')
  set langnoremap
endif

" highlight lines over 80 chars
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable("ag")
  let g:ackprg = 'ag --vimgrep'
  nnoremap \ :Ag<SPACE>
endif

" Zoom / Restore window with <ctrl>+a
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
