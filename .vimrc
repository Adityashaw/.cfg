
" Change <Leader> Key to , (comma)
let mapleader = ","

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Match opening and closing tags 
runtime macros/matchit.vim

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

"Enable mouse usage in all modes
set mouse=a

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Wrap to previous/next line when using left, right cursor
set whichwrap+=<,>,[,]

" Backspace wraps to previous line
set backspace=indent,eol,start

" Split panes to the right
set splitright

" Load indentation rules and plugins according to the detected filetype.
set autoindent

if has("autocmd")
    filetype plugin indent on
endif

let g:netrw_winsize = 20

"*******************************************
" Plugin Customizations below
"*******************************************

" Auto-Completion using ALE
"let g:ale_completion_enabled = 1

" ALE should NOT lint when opening a file
"let g:ale_lint_on_enter = 0

" ALE Lint on text changed
let g:ale_lint_on_text_changed = 0

" ALE should Lint when Esc is pressed
let g:ale_lint_on_insert_leave = 1

" ALE Lint should delay a bit
let g:ale_lint_delay = 400

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" To remove $ at end of lines due to thaerkh's vim-indentguides
" set listchars=""

" Configs for vim-indent-plugins
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 3
let g:indent_guides_enable_on_vim_startup = 1

" Pressing tab should scroll auto-complete from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" Allow Italics in spacegray
let g:spacegray_use_italics = 1


" Trigger configuration for UtilSnips. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Prevent first item of auto-completion from being auto-selected
set completeopt=menu,menuone,popup,noinsert

" Let ALE know to what Linter to use for various programming languages
let g:ale_linters = {'cpp': ['cc'],
                    \ 'javascript': ['eslint'],
                    \ 'java': ['eclipselsp'],
                    \ 'python': ['flake8']
                    \ }

let g:ale_python_pyls_config = {
\  'pyls': {
\    'plugins': {
\      'jedi_completion': {
\        'lint_on_change': v:false
\      },
\      'pycodestyle': {
\        'enabled': v:false
\      },
\      'flake8': {
\        'enabled': v:true
\      },
\      'pyflakes': {
\        'enabled': v:false
\      }
\    }
\  },
\}

"Path to Eclipse LSP for ALE
"let g:ale_java_eclipselsp_path = '/home/adi/eclipse.jdt.ls'
"let g:ale_java_eclipselsp_executable = '/usr/bin/jdtls'
"let g:ale_java_eclipselsp_config_path = '/home/adi/.jdtls'

" Show errors on Statusline
let g:airline#extensions#ale#enabled = 1

" Make airline's section_x wider
"let g:airline_section_x = '%-0.10{airline-predefined-parts#filetype()}'

" Increase airline's section_x truncate width
"let g:airline#extensions#default#section_truncate_width = {
"    \ 'x': 50
"    \ }

" Bring x in left array
"let g:airline#extensions#default#layout = [
"            \ [ 'a', 'b', 'c', 'x' ],
"            \ [ 'y', 'z', 'error', 'warning']
"            \ ]


" Use Quickfix List instead of LocList
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 5

"Start Deoplete
let g:deoplete#enable_at_startup = 1

"Use ALE as the completion source for all code
call deoplete#custom#source('ale', 'rank', 999)

" Coc requires these
"set hidden "it was causing me nightmares
"set nobackup
"set nowritebackup
"set cmdheight=2
"set updatetime=300
"set shortmess+=c
"set signcolumn=yes

"************************
" Visual Optons
"************************

" Set line  numbers
set number

" Make tab to look like 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " converts tabs into spaces

" Syntax Highlighting
syntax on

set showmatch " Show matching brackets.

" Let vim know that a dark background is in use
set background=dark

" Color Scheme set up
set termguicolors
colorscheme spacegray

"***************************
" Button ReMapping
"***************************

" Press leader (, coma) w to save file to disk
inoremap <leader>w <Esc>:update<cr>gi
nnoremap <leader>w <Esc>:update<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" In insert mode too go to tab by number
inoremap <leader>1 <Esc>1gtgi
inoremap <leader>2 <Esc>2gtgi
inoremap <leader>3 <Esc>3gtgi
inoremap <leader>4 <Esc>4gtgi
inoremap <leader>5 <Esc>5gtgi
inoremap <leader>6 <Esc>6gtgi
inoremap <leader>7 <Esc>7gtgi
inoremap <leader>8 <Esc>8gtgi
inoremap <leader>9 <Esc>9gtgi
inoremap <leader>0 <Esc>:tablast<cr>gi

" All window commands in insert mode
" By default, <C-w> deletes word under cursor
" Changing that
inoremap <C-w> <C-o><C-w>



