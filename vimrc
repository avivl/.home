set nocompatible
set rtp+=/Users/aviv/.vim/bundle/vundle
call vundle#rc("/Users/aviv/.vim/bundle/")
filetype plugin indent on   " Automatically detect file types.
syntax on   " Syntax highlighting
let mapleader = ','
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0 " No extra spaces between rows
set nu  " Line numbers on
set showmatch   " Show matching brackets/parenthesis
set incsearch   " Find as you type search
set hlsearch" Highlight search terms
set winminheight=0  " Windows can be 0 line high
set ignorecase  " Case insensitive search
set smartcase   " Case sensitive when uc present
set wildmenu" Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5" Lines to scroll when cursor leaves screen
set scrolloff=3 " Minimum lines to keep above and below cursor
set foldenable  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")
set clipboard=unnamed                                        " yank and paste with the system clipboard"
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving






highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
let g:CSApprox_hook_post = ['hi clear SignColumn']



"fix keys "
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>



Bundle 'gmarik/vundle'

" Go stuf go in here:)"
"An autocompletion daemon for the Go programming language"
Bundle 'Blackrush/vim-gocode'
"code-completion engine for Vim"
Bundle 'Valloric/YouCompleteMe'
"enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

Bundle 'rjohnsondev/vim-compiler-go'
au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go compiler golang
let g:gofmt_command = 'goimports'
autocmd BufWritePre *.go Fmt
let g:golang_goroot = "/usr/local/go/"
let g:golang_gopath =" /Users/aviv/gopath"
let $GOPATH="/Users/aviv/gopath"

Bundle 'marijnh/tern_for_vim'
"A tree explorer plugin for vim
Bundle 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" Toggle the NERD Tree on an off with F2
nmap <F2> :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

Bundle 'nathanaelkane/vim-indent-guides'

"My colors"
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized " Load a colorscheme
set background=dark
let g:solarized_hitrail=1
let g:solarized_menu=0

"Lean & mean status/tabline for vim that's light as air.
Bundle 'bling/vim-airline'
let g:airline_theme = 'solarized'
set ruler   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd " Show partial commands in status line and
set laststatus=2" Selected characters/lines in visual mode
set statusline=%<%f\ " Filename
set statusline+=%w%h%m%r " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]" Filetype
set statusline+=\ [%{getcwd()}]  " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
let g:airline#extensions#tabline#enabled = 1

"a Git wrapper so awesome, it should be illega"
Bundle 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

"Fuzzy file, buffer, mru, tag, etc finder
Bundle 'ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ag %s --nocolor -l -g'
let g:ctrlp_user_command = {
\ 'types': {
\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
\ 2: ['.hg', 'hg --cwd %s locate -I .'],
\ },
\ 'fallback': s:ctrlp_fallback
\ }
nmap <leader>l :CtrlPBuffer<CR>
nmap <Leader>; :CtrlP<CR>
let g:ctrlp_extensions = ['funky']
"Vim plugin for the Perl module / CLI script 'ack'"
Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
nmap <leader>a :Ack<space>
Bundle 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1
"surround.vim: quoting/parenthesizing made simple"
Bundle 'tpope/vim-surround'

Bundle 'vim-scripts/sessionman.vim'
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>
 
Bundle 'vim-scripts/Conque-GDB'
"numbers.vim is a vim plugin for better line numbers"
Bundle 'myusuf3/numbers.vim'

Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>tt :TagbarToggle<CR>
let g:tagbar_type_go = {
\ 'ctagstype' : 'go',
\ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
    \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
    \ 'r:constructor', 'f:functions' ],
\ 'sro' : '.',
\ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
\ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
\ 'ctagsbin'  : 'gotags',
\ 'ctagsargs' : '-sort -silent'
\ }
set tags=./tags;/,~/.vimtags
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

Bundle 'scrooloose/syntastic'

let g:BASH_TemplateOverriddenMsg= 'yes'
let g:BASH_AuthorName   = 'Aviv Laufer'
let g:BASH_Email       = 'avivi.laufer@gmail.com'
let g:BASH_Company      = ''"

Bundle 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
set undofile" So is persistent undo ...
set undolevels=1000 " Maximum number of changes that can be undone
set undoreload=10000" Maximum number lines to save for undo on a buffer reload



Bundle 'vim-scripts/yaml.vim'
Bundle 'YankRing.vim'
nmap <leader>y :YRShow<CR>
Bundle 'bash-support.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'uarun/vim-protobuf'



















"==============================Functions========================================
function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
            let common_dir = parent . '/.' . prefix


        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
" Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
