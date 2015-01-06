set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
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



" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
     \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>


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


Bundle 'chase/vim-ansible-yaml'
Bundle 'gmarik/vundle'
Bundle 'oblitum/rainbow'
Bundle 'tpope/vim-dispatch'
let g:rainbow_active = 1
au FileType c,cpp,objc,objcpp,go call rainbow#load()
" Go stuf go in here:)"
au BufRead,BufNewFile *.go set filetype=go
autocmd BufWritePost *.go call UpdateGoTags()


"vim-go"
Bundle 'fatih/vim-go.git'

au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

Bundle 'ervandew/supertab'
"code-completion engine for Vim"
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/snippets'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

function! ResCur()
            if line("'\"") <= line("$")
                normal! g`"
                return 1
            endif
        endfunction

        augroup resCur
            autocmd!
            autocmd BufWinEnter * call ResCur()
        augroup END


function! UpdateGoTags()
	let gotags = 'find . -name "*.go" |xargs gotags --sort=true --silent=true>>tags'
	call system(gotags)
endfunction

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
Bundle 'airblade/vim-gitgutter'


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
let g:syntastic_python_checkers = ['flake8', 'pep257']
let g:syntastic_go_checkers = ['go', 'golint', 'govet']

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
Bundle 'tpope/vim-markdown'
Bundle 'hsanson/vim-android'
Bundle 'moll/vim-node'



"Google styles"
au BufNewFile,BufRead c,cpp,cc,objc,*.mm call SetupForCLang()
" Configuration for C-like languages.
function! SetupForCLang()
    " Highlight lines longer than 80 characters.
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    " Alternately, uncomment these lines to wrap at 80 characters.
    " setlocal textwidth=80
    " setlocal wrap

    " Use 2 spaces for indentation.
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal expandtab

    " Configure auto-indentation formatting.
    setlocal cindent
    setlocal cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4
    setlocal indentexpr=GoogleCppIndent()
    let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

    " Uncomment these lines to map F5 to the CEF style checker. Change the path to match your system.
    " map! <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
    " map  <F5> <Esc>:!python ~/code/chromium/src/cef/tools/check_style.py %:p 2> lint.out<CR>:cfile lint.out<CR>:silent !rm lint.out<CR>:redraw!<CR>:cc<CR>
endfunction
" From https://github.com/vim-scripts/google.vim/blob/master/indent/google.vim
function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction






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

" Call YCM GoTo or vim-go GoTo depending on file type. 
function! GoToDef()
    if &ft == 'go'
        call go#def#Jump()
    else
        execute 'YcmCompleter GoTo'
    endif
endfunction
nnoremap <leader>] :call GoToDef()<CR>
