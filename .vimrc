filetype plugin indent on    " required
syntax enable 
set guifont=Fira\ Code:h12
" hack to enable python3 rather than python2
if has('python3')
endif

" Plugins
call plug#begin('~/.vim/plugged')
noremap <F1> <Esc>:tabprev <CR>
vnoremap <F1> <Esc>:tabprev <CR>

Plug 'sbdchd/neoformat'
Plug 'tanvirtin/monokai.nvim'
let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': g:opambin . '/ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }
let g:neoformat_enabled_ocaml = ['ocamlformat']

let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_try_formatprg = 1
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" also see https://github.com/clangd/coc-clangd for clangd support
" for haskell: https://www.reddit.com/r/vim/comments/k3ar3i/cocvim_haskelllanguageserver_starter_tutorial_2020/
try
    nmap <silent> [c :call CocAction('diagnosticNext')<cr>
    nmap <silent> ]c :call CocAction('diagnosticPrevious')<cr>
endtry
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
let g:loaded_sql_completion = 0
let g:omni_sql_no_default_maps = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'jakobkogler/Algorithm-DataStructures'

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
let g:livepreview_previewer = 'zathura'

Plug 'godlygeek/csapprox'
let g:CSApprox_hook_post = [
            \ 'highlight Normal            ctermbg=NONE',
            \ 'highlight LineNr            ctermbg=NONE',
            \ 'highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green',
            \ 'highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red',
            \ 'highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow',
            \ 'highlight SignColumn        ctermbg=NONE',
            \ 'highlight CursorLine        ctermbg=NONE cterm=underline',
            \ 'highlight Folded            ctermbg=NONE cterm=bold',
            \ 'highlight FoldColumn        ctermbg=NONE cterm=bold',
            \ 'highlight NonText           ctermbg=NONE',
            \ 'highlight clear LineNr'
            \]

Plug 'powerline/powerline'
let g:Powerline_symbols = 'fancy'

set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8

Plug 'preservim/nerdcommenter'

Plug 'alx741/vim-rustfmt'

call plug#end()

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'dense-analysis/ale'

Plugin 'morhetz/gruvbox'

Plugin 'Chiel92/vim-autoformat'

Plugin 'VundleVim/Vundle.vim'

Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_no_function_highlight = 1

" Plugin 'NavneelSinghal/vim-cpp-auto-include'
" autocmd BufWritePre /path/to/workspace/**.cpp :ruby CppAutoInclude::process

Plugin 'rhysd/vim-clang-format'

Plugin 'iamcco/markdown-preview.nvim'
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

Plugin 'udalov/kotlin-vim'
" https://github.com/iamcco/markdown-preview.nvim/issues/43

Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required


" Autocmds

imap jk <Esc>
"autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd BufNewFile ~/Desktop/cp/workspace/**.cpp 0r ~/.vim/templates/template.cpp
autocmd BufNewFile,BufRead *.kt set filetype=kotlin
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

command W w !sudo tee % > /dev/null

fu Template()
    let tempfile = "/home/sundaram/Desktop/cpp/template.cpp"
    silent :execute "!cp " . tempfile . " " . expand("%")
    edit!
    execute "normal \<c-L>"
endf
command -nargs=? T :call Template("<args>")
command -nargs=? Temp :call Template("<args>")
fu Template1()
    let tempfile = "/home/sundaram/Desktop/cpp/template2.cpp"
    silent :execute "!cp " . tempfile . " " . expand("%")
    edit!
    execute "normal \<c-L>"
endf
command T1 :call Template1()
command Tempw :call Template1()
" map <F12> :call Template() <cr>
" Basic

let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

let indentvalue=4

set noshowcmd noruler
set history=500
set autoread
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler
set number
set relativenumber
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set nocursorline
set nocursorcolumn
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
let &shiftwidth=indentvalue
let &tabstop=indentvalue
set lbr
set tw=200
set autoindent
set smartindent
set wrap
set viminfo=
set bg=dark
set t_Co=256
set switchbuf=useopen,usetab,newtab
set stal=2
set laststatus=2
set clipboard+=unnamedplus
set mouse=a
set mousemodel=popup
set ttimeout
set ttimeoutlen=1
set ttyfast

" Appearance

try
colorscheme gruvbox
let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark='light'
let g:gruvbox_invert_tabline=1
catch
endtry

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    set guifont=JetBrains\ Mono\ 12
endif

" Keymappings


let mapleader = ","
nmap <leader>w :w!<cr>
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-n> :NERDTreeToggle<CR>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
map 0 ^
noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Devil_yodeler -O2 -o %< % && ./%< < inp<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Devil_yodeler -O2 -o "%<" "%" && "./%<" < inp<CR>
noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
inoremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp<CR>
inoremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>

" for setting up inkscape-figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

ca Hash w !cpp -dD -P -fpreprocessed \| tr -d '[:space:]' \
 \| md5sum \| cut -c-6

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

" debugging stuff: to run in vim, run :Termdebug <executable_name>, and :help terminal-debug for help (use Ctrl+W twice to switch between windows)
packadd termdebug
let g:termdebug_popup = 0
let g:termdebug_wide = 163

set rtp^="~/.opam/default/share/ocp-indent/vim"
