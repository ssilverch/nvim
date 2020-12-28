"===
"=== Auto load for first time uses
"===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	 \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter = PlugInstall --sync | source $MYVIMRC
endif

"===
"=== Create a _machine_specific.vim file to adjust machine specific stuff,
"like python interpreter location
"===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

"==================
"===Editor Setup===
"==================

"===
"===System
"===
"set clipboard=unnamed
let &t_ut=''
set autochdir

"===
"=== Editor behavior
"===
set number
set relativenumber
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:.
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80
set updatetime=1000
set virtualedit=block

" Cursor shape
"let &t_SI = "\<Esc>50;CursorShape=1\x7"
"let &t_SR = "\<Esc>50;CursorShape=0\x7"
"let &t_EI = "\<Esc>50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"===
"===Terminal Behavior
"===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0 = '#000000'
let g:terminal_color_1 = '#FF5555'
let g:terminal_color_2 = '#50FA7B'
let g:terminal_color_3 = '#F1FA8C'
let g:terminal_color_4 = '#BD93F9'
let g:terminal_color_5 = '#FF79C6'
let g:terminal_color_6 = '#8BE9FD'
let g:terminal_color_7 = '#BFBFBF'
let g:terminal_color_8 = '#4D4D4D'
let g:terminal_color_9 = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

"===
"=== Basic Mapping
"===
"Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
map ; :

" Save & quit
map Q :q<CR>
map S :w<CR>


"Open the vimrc file anytime
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

"Open Startify
map <LEADER>st :Startify<CR>

" Make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
noremap < <<
noremap > >>

"Search
map <LEADER><CR> :nohlsearch<CR>

"Adjacent duplicate words
map <LEADER>dw /\(\<\w\+\)\_s*\1

" Space to Tab
 nnoremap <LEADER>tt :%s/ /\t/g
 vnoremap <LEADER>tt :%s/ /\t\g

" Folding
map <silent> <LEADER>o za

" Open up lazygit
noremap \g :Git
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

noremap <silent> H 5h
noremap <silent> J 5j
noremap <silent> K 5k
noremap <silent> L 5l

"Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" source ~/.config/nvim/cursor.vim
"===
"=== Insert Mode Cursor Movement
"===
inoremap <C-a> <ESC>A

"===
"=== Command Mode Cursor Movement
"===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

"===
"===Window management
"===
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

"Disbling the default s key
noremap s <nop>

" split the screens to up(horizontal), down(horizontal),
" left(vertical),right(vertical)
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

"Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

"Place the two screens up and down
noremap sh <C-w>t<C-w>K
"Place the two screens side by side
noremap sv <C-w>b<C-w>H

"Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

"Press <space> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

"===
"=== Tab management
"===
"Create a new tab with tk
map tk :table<CR>
" Move around tabs with th and tl
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmh and tml
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

"===
"=== Markdown Settings
"===
"source ~/.config/nvim/snippets.vim
"source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell

"===
"=== Other useful stuff
"===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>1x$p

"Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>

"Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>

"Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>

"Press ' to change case (instead of ~)
"map ` ~

nmap <C-c> zz

"Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

"Call figlet
map tx :r !figlet

" find and replace
noremap \s :%s//g<left><left>

" set wrap
noremap <LEADER>sw :set wrap<CR>

" Press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -15
    :term ./%<
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!".g:mkdp_browser." % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device
    CocCommand flutter.dev.openDevlog
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc

"===
"===Install Plugins with Vim-Plug
"===
call plug#begin('~/.config/nvim/plugged')

Plug 'chrisbra/Colorizer'

" Pretty Dress
Plug 'vim-airline/vim-airline'
"Plug 'theniceboy/eleline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
"Plug 'theniceboy/vim-deus'
Plug 'liuchengxu/space-vim-theme'

" Status line
"Plug 'theniceboy/eleline.vim'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

"File nabigation
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'francoiscabrol/ranger.vim'
"Plug 'kevinhwang91/rnvimr'
"Plug 'airblade/vim-rooter'
"Plug 'pechorin/any-jump.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Auto Complete
Plug 'neoclide/coc.nvim',{'branch':'release'}
"Plug 'davidhalter/jedi-vim'

" Undo Tree
Plug 'mbbill/undotree/'

"Other visual enhancement
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'

"Git
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore',{'for':['gitignore','vim-plug']}
Plug 'fszymanski/fzf-gitignore',{'do':':UpdateRemotePlugins'}
"Plug 'airblade/vim-gitgutter'
"Plug 'cohama/agit.vim'

" Autoformat
" Plug 'Chiel92/vim-autoformat'
"
"  CSharp
"  Plug 'OmniSharp/omnisharp-vim'
"  Plug 'ctrlpvim/ctrlp.vim', {'for': ['cs', 'vim-plug']}

"HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
"Plug 'othree/html5.vim'
"Plug 'alvan/vim-closetag'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV',{'for':['php','vim-plug']}
Plug 'gko/vim-coloresque',{'for':['vim-plug','php','html','javascript','css','less']}
Plug 'pangloss/vim-javascript',{'for':['javascript','vim-plug']}
"Plug 'yuezk/vim-js',{'for':['vim-plug', 'php',
"'html','javascript','css','less']}
Plug 'mattn/emmet-vim'
"Plug 'HerringtonDarkholme/yats.vim'

" Go
Plug 'fatih/vim-go' , {'for': ['go', 'vim-plug'], 'tag': '*'}

" Python
Plug 'vim-scripts/indentpython.vim', {'for' :['python','vim-plug']}
"Plug 'Vimjas/vim-python-pep8-indent', {'for':['python','vim-plug']}
Plug 'numirias/semshi',{'do':':UpdateRemotePlugins'}
Plug 'tweekmonster/braceless.vim'

" Flutter
Plug 'dart-lang/dart-vim-plugin'

" Swift
Plug 'keith/swift.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode',{'on':'TableModeToggle'}
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }

" For general writing
Plug 'reedes/vim-wordy'
Plug 'ron89/thesaurus_query.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'gcmt/wildfire.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'brooth/far.vim',{'on':['F','Far','Fardo']}
Plug 'tmhedberg/SimpylFold'
Plug 'AndrewRadev/switch.vim'
Plug 'ryanoasis/vim-devicons'

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

let g:colorizer_syntax = 1

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

"===
"=== Dress up my vim
"===
set termguicolors "enable true colors support
let g:space_vim_transp_bg = 1
"set bcakground=dark
"colorscheme space_vim_theme


"==============Start of Plugin Settings============
"

"===
"===Airline
"===
let g:airline_theme='dracula'
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffer = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'Nor',
      \ 'i'  : 'Ins',
      \ 'R'  : 'Rpl',
      \ 'c'  : 'Cmd',
      \ 'v'  : 'Vis',
      \ 'V'  : 'Vli',
      \ '' : 'Vbl',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
let g:airline_powerline_fonts = 1


" ===
" === SimpyFold
" ===
let g:SimpyFold_docstring_preview = 1

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "H"
let NERDTreeMapUpdirKeepOpen = "h"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "L"
let NERDTreeMapActivateNode = "l"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapOpenInTabSilent = "O"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "rt"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
    "

"" ===
" === NCM2
" ===
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>": "\<CR>")
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"let ncm2#popup_delay = 5
"let g:ncm2#matcher = "substrfuzzy"
"let g:ncm2_jedi#python_version = 3
"let g:ncm2#match_highlight = 'bold'
"let g:jedi#auto_initialization = 1
"let g:jedi#completion_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#smart_auto_mapping = 0
"let g:jedi#popup_on_dot = 1
"let g:jedi#completion_command = ""
"let g:jedi#show_call_signatures = "1"


" ===
" === coc
" ===
" fix the most annoying bug that coc has
let g:coc_global_extensions = [
 \ 'coc-actions',
 \ 'coc-css',
 \ 'coc-diagnostic',
 \ 'coc-explorer',
 \ 'coc-flutter-tools',
 \ 'coc-gitignore',
 \ 'coc-html',
 \ 'coc-json',
 \ 'coc-lists',
 \ 'coc-prettier',
 \ 'coc-pyright',
 \ 'coc-python', 
 \ 'coc-snippets',
 \ 'coc-sourcekit',
 \ 'coc-stylelint',
 \ 'coc-syntax',
 \ 'coc-tasks',
 \ 'coc-todolist',
 \ 'coc-translator',
 \ 'coc-tslint-plugin',
 \ 'coc-tsserver',
 \ 'coc-vimlsp',
 \ 'coc-yaml',
 \ 'coc-yank']

""autocmd WinEnter * call timer_start(1000, { tid -> execute('unmap if')})
"silent! autocmd BufEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! autocmd WinEnter * silent! call silent! timer_start(600, { tid -> execute('unmap if')})
"silent! au BufEnter * silent! unmap if
"au TextChangedI * GitGutter
" Installing plugins
"let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-snippets', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore']
" use <tab> for trigger completion and navigate to the next complete item
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction
"inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
    call CocActionAsync('highlight')
  if(index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>

""Open up coc-commands
"nnoremap <c-c>:CocCommand<CR>
""Text Objects
"xmap kf <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap kf <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tc:CocCommand explorer<CR>
"" coc-translator
"nmap ts <Plug>(coc-translator -p)
"" Remap for do codeAction of selected region
"function! s:cocActionsOpenFromSelected(type) abort
"   execute 'CocCommand actions.open ' . a:type
"endfunction
"xmap <silent><leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
"nmap <silent><leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"" coctodolist
"nnoremap <leader>tn:CocCommand todolist.create<CR>
"nnoremap <leader>tl :CocList todolist<CR>
"nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
"" coc-tasks
"noremap <silent><leader> ts :CocList tasks<CR>
"" coc-snippets
"imap <C-l> <Plug>(coc-snippets-expand)
"vmap <C-e> <Plug>(coc-snippets-select)
"let g:coc_snippet_next = '<c-e'
"let g:coc_snippet_prev = '<c-n>'
"imap <C-e> <Plug>(coc-snippets-expand-jump)
"let g:snips_author = 'silver'
"
"nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
"nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" ===
" === indentLine
" ===
let g:indentLine_char = '│'
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#333333'
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === some error checking
" ===
" I ain't need no ale!


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === FZF
" ===
map <C-p> :FZF<CR>


" ===
" === vim-signature
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
map L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1


" ==
" == vim-multiple-cursor
" ==
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<c-k>'
let g:multi_cursor_select_all_word_key = '<a-k>'
let g:multi_cursor_start_key           = 'g<c-k>'
let g:multi_cursor_select_all_key      = 'g<a-k>'
let g:multi_cursor_next_key            = '<c-k>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


" ==
" == thesaurus_query
" ==
map <LEADER>th :ThesaurusQueryLookupCurrentWord<CR>


" Startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]


" ===
" === Far.vim
" ===
nnoremap <silent> <LEADER>f :F  %<left><left>

" ===
" === vim-calc
" ===
map <LEADER>a :call Calc()<CR>
" Testing
"if !empty(glob('~/Github/vim-calc/vim-calc.vim'))
  "source ~/Github/vim-calc/vim-calc.vim
"endif


" ===
" === emmet
" ===
let g:user_emmet_leader_key='<C-f>'


" ===
" === Bullets.vim
" ===
let g:bullets_set_mappings = 0


" ===
" === Vista.vim
" ===
map <silent> T :Vista!!<CR>
map <silent> <C-t> :Vista finder<CR>
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']


" ===
" === Ranger.vim
" ===
nnoremap R :Ranger<CR>


" ===
" === fzf-gitignore
" ===
map <LEADER>gi <Plug>(fzf-gitignore)



" ===================== End of Plugin Settings =====================

" Open the _machine_specific.vim file if it has just been created
"if has_machine_specific_file == 0
"  exec "e ~/.config/nvim/_machine_specific.vim"
"endif

