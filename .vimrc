" Hack for speeding up vim load when using rvm
"let g:ruby_path = system('rvm use system')

"" Uses infect.gem to package install all these suckers
"=bundle tpope/vim-pathogen
""=bundle tpope/vim-sensible
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('bundle/{}')

" Erlang
"=bundle jimenezrick/vimerl

" Scala
"=bundle derekwyatt/vim-scala
"
" Lua
"=bundle vim-scripts/lua.vim
" Zencoding/emmet
"=bundle mattn/emmet-vim
"
" Purescript
"=bundle raichoo/purescript-vim
"
" Maybe
"
"=bundle troydm/easytree.vim
""=bundle jnwhiteh/vim-golang
"=bundle fatih/vim-go
autocmd BufRead,BufNewFile *.go set tabstop=4 shiftwidth=4 noexpandtab softtabstop=4
autocmd BufRead,BufNewFile *.go set lcs=tab:\ \ ,nbsp:_,extends:&,precedes:<
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
"""""""""
"=bundle godlygeek/tabular
"=bundle ledger/vim-ledger
"=bundle elazar/visSum.vim
"=bundle bogado/file-line
"=bundle scrooloose/nerdtree
"=bundle scrooloose/syntastic
"let g:syntastic_enable_ruby_checker = 0
"=bundle JazzCore/ctrlp-cmatcher after_install=( cd ctrlp-cmatcher && export CFLAGS=-Qunused-arguments && export CPPFLAGS=-Qunused-arguments && ./install.sh )
""=bundle mhinz/vim-startify
"=bundle terryma/vim-multiple-cursors
""=bundle tpope/timl
"=bundle kana/vim-textobj-user
"=bundle nelstrom/vim-textobj-rubyblock
"=bundle edsono/vim-matchit
"=bundle tpope/vim-dispatch
"=bundle tpope/gem-ctags
"=bundle vim-scripts/AutoTag
""=bundle xolox/vim-easytags
"=bundle xolox/vim-misc
"=bundle t9md/vim-ruby-xmpfilter
"=bundle lukerandall/haskellmode-vim
""=bundle eagletmt/ghcmod-vim
let g:haddock_browser="/Applications/Google Chrome.app"
"=bundle Shougo/vimproc.vim after_install=( cd vimproc.vim && make )

"""""""""""""""""""""""""""""""""""""""
"=bundle terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
"=bundle skalnik/vim-vroom
""=bundle christoomey/vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""
"
" Clojure Plugins
"=bundle guns/vim-clojure-static
"=bundle tpope/vim-classpath
"=bundle tpope/vim-dispatch
"=bundle tpope/vim-fireplace
"=bundle tpope/vim-leiningen
"=bundle tpope/vim-projectionist
" For specclj
" https://github.com/guns/vim-clojure-static/pull/45/files
augroup CustomEvents
  autocmd!
  autocmd FileType clojure setlocal lispwords+=describe,it,context,around,should=,should-not,should,should-be,with
augroup END

"Keeping
"=bundle AndrewRadev/switch.vim
""=bundle Valloric/YouCompleteMe after_install=( cd YouCompleteMe && git submodule update --init --recursive && ./install.sh )
" "=bundle airblade/vim-gitgutter
"=bundle ap/vim-css-color
"=bundle bling/vim-airline
"=bundle elixir-lang/vim-elixir
"=bundle epeli/slimux
"=bundle ervandew/supertab
"=bundle Raimondi/delimitMate
"=bundle honza/vim-snippets
"=bundle jeffkreeftmeijer/vim-numbertoggle
"=bundle jpalardy/vim-slime
"=bundle kchmck/vim-coffee-script
"=bundle ctrlpvim/ctrlp.vim
"=bundle mattn/ctrlp-mark
"=bundle mattn/ctrlp-register
"=bundle mattn/gist-vim
"=bundle mattn/webapi-vim
"=bundle rking/ag.vim
let g:ag_mapping_message=0
"=bundle rking/vim-detailed
"=bundle rking/vim-ruby-refactoring
"=bundle sjl/gundo.vim
"=bundle slim-template/vim-slim
"=bundle tpope/vim-abolish
"=bundle tpope/vim-commentary
"=bundle tpope/vim-endwise
"=bundle tpope/vim-eunuch
"=bundle tpope/vim-fugitive
"=bundle tpope/vim-git
"=bundle tpope/vim-haml
"=bundle tpope/vim-markdown
"=bundle tpope/vim-ragtag
"=bundle tpope/vim-rails
"=bundle tpope/vim-repeat
"=bundle tpope/vim-rsi
"=bundle tpope/vim-surround
"=bundle tpope/vim-unimpaired
"=bundle tpope/vim-vinegar
"=bundle vim-ruby/vim-ruby
"=bundle vim-scripts/ZoomWin
"=bundle wting/rust.vim
"=bundle SirVer/ultisnips

call pathogen#helptags()
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set Leader key
let mapleader = ","

"Since we mapped , as leader, let's map ',' default backwards ;
nnoremap \ ,
map <Space> <Leader>

" Use jk to escape
inoremap jk <ESC>

" Save marks and leaders for X files, currently 100, including Globals
set viminfo='100,f1

" Basic standards of sanity
set encoding=utf-8
set t_Co=256
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmode=longest,list
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set winwidth=80
set nowrap  " Line wrapping off
" Preserve large pastes
set pastetoggle=<F2>

nnoremap <leader>cl :close<CR>
set smartindent
set tabstop=2
set guioptions-=T
filetype on  " Automatically detect file types.

" nnoremap <Leader>g :GundoToggle<CR>

" XML Linting
nnoremap <Leader>xm :%!xmllint --format -<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Improved history commands
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
"
" Fix forward searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" set gdefault " defaults the // subs to global
set incsearch
set hlsearch
nnoremap <Leader><space> :noh<cr>

" Remap F1 to escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap Leader w to open and switch to vertical split
nnoremap <Leader>w <C-w>v<C-w>l

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

""""""""""""""""
" syntax enable
set cf  " Enable error files & error jumping.
" Necessary when using Vim in Tmux
if $TMUX == ''
    set clipboard+=unnamed
endif
set autowrite  " Writes on make/shell commands
set autoread
set ruler  " Ruler on
set nu  " Line numbers on
" Time to wait after ESC and LEADER, 250 is awful
set timeoutlen=700  " Time to wait after ESC (default causes an annoying)

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~.... disable this as
" it's distracting for screencasts
" set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
" set lcs=tab:\|_,
" Courtesy of @alindeman
set listchars+=trail:💔

set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" Set font
set guifont=Source\ Code\ Pro:h13
" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Ruby autocomplete setup
" Credit:
" http://www.cuberick.com/2008/10/ruby-autocomplete-in-vim.html
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Hooray for integration with standard Ctrl-V -C -X etc
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"Statusline config
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer
" }
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
" let g:airline_section_b = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'
" let g:airline_section_y = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
let g:airline_section_y = ''
let g:airline_section_a = ''
" let g:airline_section_y = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}'
let g:airline_theme = 'murmur'

" let g:airline_section_b = '%{system("branch-name | cut -c 1-20 | tr -d "\n")}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#syntastic#get_warnings(),0)}%{airline#util#wrap(airline#extensions#whitespace#check(),0)}'
""
"
let g:airline#extensions#default#section_truncate_width = {
      \ 'a' : 20,
      \ 'b' : 10,
      \ 'x' : 60,
      \ 'y' : 88,
      \ 'z' : 45,
      \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test functions from gary bernhardt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! MapCR()
"  nnoremap <cr> :call RunTestFile()<cr>
"endfunction
" call MapCR()
nnoremap <leader>t :call RunTestFile()<cr>
nnoremap <leader>a :call RunTests('')<cr>
"nnoremap <leader>c :w\|:!script/features<cr>
"nnoremap <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        " First choice: project-specific test script
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        " Fall back to the .test-commands pipe if available, assuming someone
        " is reading the other side and running the commands
        elseif filewritable(".test-commands")
          let cmd = 'rspec --color --format progress --require "~/lib/vim_rspec_formatter" --format VimFormatter --out tmp/quickfix'
          exec ":!echo " . cmd . " " . a:filename . " > .test-commands"

          " Write an empty string to block until the command completes
          sleep 100m " milliseconds
          :!echo > .test-commands
          redraw!
        " Fall back to a blocking test run with Bundler
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        " Fall back to a normal blocking test run
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always strip trailing whitespace
" Courtesy of MarkSim: https://github.com/marksim/.dotfiles/blob/master/.vimrc#L120-L130
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,haml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Old config (disable arrow keys)
" map <Left> <nop>
" map <Right> <nop>
" map <Up> <nop>
" map <Down> <nop>
"""" EXPERIMENTAL
map <Left> <C-O>
map <Right> <C-I>
"""" Stable
map <Up> :bnext<cr>
map <Down> :bprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
nnoremap <Leader>, :b#<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maps ctrl L to hash rocket
imap <c-h> <space>=><space>

" Maps ctrl k to stabby lambda
imap <c-l> <space>-><space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear search buffer when hitting return (also from Gary Bernhardt)
:nnoremap <CR> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Start at last location in file
augroup vimrcEx
  " Clear all autocommand groups
  autocmd!
  autocmd FileType text setlocal textwidth=78
  autocmd FileType text set wrap linebreak nolist et
  " autocmd For markdown style
  " autocmd FileType md,markdown set wrap nolist et

  " Jump to last cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line('$') |
    \   exe "normal g`\"" |
    \ endif

  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
augroup END

" make tab completion for files/buffers work like bash
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Promote Variable to Rspec Let
function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <Leader>u :PromoteToLet<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Slime tmux settings
let g:slime_target = "tmux"

" Slimux settings
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>d :SlimuxShellLast<CR>

" For jumplist... since tab is clobbered
" go back
nnoremap g, <C-O>
" go forward
nnoremap g. <C-I>
"nnoremap <C-k> <C-i>

" Shortcut '%%' to enter PWD on commandline
cnoremap <expr> %%  getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Command to create non-existant directory after trying to save file as such
" :!mkdir -p %:h
" Save file using sudo when session started as normal user
" :w !sudo tee % > /dev/null
"
" Shortcuts for vim-fugitive
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>

" From Ben Orenstein
" map ZX <esc>:wq<CR>
" Override standard VIM save and exit command (ZZ)
" map <Leader>z <esc>:w<CR>

set noswapfile
" This folder is automatically created in zph's .zshrc
set backupdir=~/tmp/vim
set directory=~/tmp/vim " Don't clutter my dirs up with swp and tmp files
" EXPERIMENTAL
" Set persistent undo for vim using tempdir
set undodir=~/tmp/vim
set undofile
" Get rid of the delay when hitting esc!
set noesckeys

" command! Qall qall
" Disable Ex mode
map Q <Nop>
" Remap Q to a useful command
command! Q q " Bind :Q to :q
nnoremap Q :q

" Disable K looking stuff up ie instant manual lookups
map K <Nop>
nnoremap K :r!


" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap
au BufNewFile,BufRead *.txt setlocal lbr

"function! IncludeRCodeTools()
  " For rcodetools
  " plain annotations
  " map <silent> <F10> !xmpfilter -a<cr>
  " nmap <silent> <F10> V<F10>
  " imap <silent> <F10> <ESC><F10>a

  " " Test::Unit assertions; use -s to generate RSpec expectations instead
  " map <silent> <S-F10> !xmpfilter -u<cr>
  " nmap <silent> <S-F10> V<S-F10>
  " imap <silent> <S-F10> <ESC><S-F10>a

  " " Annotate the full buffer
  " " I actually prefer ggVG to %; it's a sort of poor man's visual bell 
  " nmap <silent> <F11> mzggVG!xmpfilter -a<cr>'z
  " imap <silent> <F11> <ESC><F11>

  " " assertions
  " nmap <silent> <S-F11> mzggVG!xmpfilter -u<cr>'z
  " imap <silent> <S-F11> <ESC><S-F11>a

  " " Add # => markers
  " vmap <silent> <F12> !xmpfilter -m<cr>
  " nmap <silent> <F12> V<F12>
  " imap <silent> <F12> <ESC><F12>a

  " " Remove # => markers
  " vmap <silent> <S-F12> ms:call RemoveRubyEval()<CR>
  " nmap <silent> <S-F12> V<S-F12>
  " imap <silent> <S-F12> <ESC><S-F12>a

  " function! RemoveRubyEval() range
  "   let begv = a:firstline
  "   let endv = a:lastline
  "   normal Hmt
  "   set lz
  "   execute ":" . begv . "," . endv . 's/\s*# \(=>\|!!\).*$//e'
  "   normal 'tzt`s
  "   set nolz
  "   redraw
  " endfunction
" endfunction

" command! IncludeRCodeTools call IncludeRCodeTools()
" " execute ":IncludeRCodeTools"
" " autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass execute ":IncludeRCodeTools"

  let g:xmpfilter_cmd = "seeing_is_believing"

  " auto insert mark at appropriate spot.
  autocmd FileType ruby nmap <buffer> <F6> <Plug>(seeing_is_believing-run)
  autocmd FileType ruby xmap <buffer> <F6> <Plug>(seeing_is_believing-run)
  autocmd FileType ruby imap <buffer> <F6> <Plug>(seeing_is_believing-run)

  autocmd FileType ruby nmap <buffer> <F7> <Plug>(seeing_is_believing-mark)
  autocmd FileType ruby xmap <buffer> <F7> <Plug>(seeing_is_believing-mark)
  autocmd FileType ruby imap <buffer> <F7> <Plug>(seeing_is_believing-mark)

  autocmd FileType ruby nmap <buffer> <F8> <Plug>(seeing_is_believing-clean)
  autocmd FileType ruby xmap <buffer> <F8> <Plug>(seeing_is_believing-clean)
  autocmd FileType ruby imap <buffer> <F8> <Plug>(seeing_is_believing-clean)

  " xmpfilter compatible
  autocmd FileType ruby nmap <buffer> <F9> <Plug>(seeing_is_believing-run_-x)
  autocmd FileType ruby xmap <buffer> <F9> <Plug>(seeing_is_believing-run_-x)
  autocmd FileType ruby imap <buffer> <F9> <Plug>(seeing_is_believing-run_-x)


" For folding
function! FoldingOn()
  nnoremap <Space> za
  set foldmethod=indent
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set foldmethod=syntax et
  " Set all folds to open
  " execute "normal zR"
endfunction

command! FoldingOn call FoldingOn()

" nnoremap <Leader><Leader>f :FoldingOn<CR>

" Reminders of commands b/c of infreq. use
" command	effect
" zi	switch folding on or off
" za	toggle current fold open/closed
" zc	close current fold
" zR	open all folds
" zM	close all folds
" zv	expand folds to reveal cursor

"Tabular mappings
"http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" if exists(":Tabularize")
"   nmap <Leader>a= :Tabularize /=<CR>
"   vmap <Leader>a= :Tabularize /=<CR>
"   nmap <Leader>a: :Tabularize /:\zs<CR>
"   vmap <Leader>a: :Tabularize /:\zs<CR>
" endif

" Use leader-b for Easy Buffer Access
"TODO : write function to open MRU instead of 'files' if pwd is ~/
imap <Leader>b <ESC>:CtrlPBuffer<CR>
nmap <Leader>b :CtrlPBuffer<CR>
imap <Leader>mr <ESC>:CtrlPMRUFiles<CR>
nmap <Leader>mr :CtrlPMRUFiles<CR>
imap <Leader>p <ESC>:CtrlPMixed<CR>
nmap <Leader>p :CtrlPMixed<CR>
let g:ctrlp_max_depth = 10

" Custom CtrlP Config
" Multiple VCS's:
let g:ctrlp_extensions = ['tag', 'mark', 'register']
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(exe|so|dll)$|\.exe$\|\.so$\|\.dat$',
  \ }
" Avoid holding shift to hit colon
" To repeat a F or T movement double tap semicolon
map ; :
noremap ;; ;

" Open Marked.app
" only works on OSX with Marked.app installed
imap <Leader>m <ESC>:!open -a Marked.app "%"<CR><CR>
nmap <Leader>m :!open -a Marked.app "%"<CR><CR>

" Run current file in ruby
imap <Leader>rr <ESC>:!ruby %<CR>
nmap <Leader>rr :!ruby %<CR>

" nmap <Leader>st :%s/\n/ /g<CR>
" nmap <Leader>sh :%!fmt -n 100<CR>
" nmap <Leader>shh <Leader>st<Leader>sh
" vnoremap <Leader>sh :!fmt -n 100<CR>
" nmap <Leader>sm :%!fmt -n 75<CR>
" vnoremap <Leader>sm :!fmt -n 75<CR>

" Courtesy of rking's ruby-pry.vim
" …also, Insert Mode as bpry<space>
iabbr bpry require'pry';binding.pry
" And pry-remote
iabbr bpryr require'pry-remote';binding.pry_remote


if executable('pry')
  imap <Leader>pi <ESC>:call PryToggle()<CR>
  nmap <Leader>pi :call PryToggle()<CR>

  fu! PryToggle()
      let @a = "require 'pry'; binding.pry"
      let wordsFromLine = getline('.')
      if @a ==? wordsFromLine
        :normal dd
      else
        :normal o"ap
      endif
  endfu
  " Courtesy of rking's ruby-pry.vim
  " …also, Insert Mode as bpry<space>
  iabbr bpry require'pry';binding.pry
  " And admit that the typos happen:
  iabbr bpry require'pry';binding.pry
  " And pry-remote
  iabbr bpryr require'pry-remote';binding.pry_remote

  " Add the pry debug line with \bp (or <Space>bp, if you did: map <Space> <Leader> )
  " map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
  " Alias for one-handed operation:
  " map <Leader><Leader>p <Leader>bp

  " Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
  map <f3> :wa<cr>:call system('kill-pry-rescue')<cr>

  " Nab lines from ~/.pry_history (respects "count")
  nmap <Leader>ph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
  " ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.
endif

if executable('rubocop')
  " RuboCop from Anywhere
  nmap <Leader>ru :RuboCop<CR>
  imap <Leader>ru <ESC>:RuboCop<CR>

  nmap <Leader>rua :!rubocop<CR>
  imap <Leader>rua <ESC>:rubocop<CR>
endif

" " Ctags Shortcuts
set tags=$HOME/.vimtags,%:p,$HOME

" " main mapping, go to first matching tag
map <Leader>tt <C-]>
" move forward and back through matching tags
map <Leader>tp :tprevious<CR>
map <Leader>tn :tnext<CR>
" Easytags - turn off highlighting
autocmd FileType * let b:easytags_auto_highlight = 0
" let b:easytags_auto_highlight = 0

" TODO
" use _ as 2nd leader to prefixing commands
map - <Leader><Leader>

" Proper linewrap behavior
"http://vimcasts.org/episodes/soft-wrapping-text/
command! -nargs=* Wrap set wrap linebreak nolist
" nnoremap <Leader><Leader>wr :Wrap<CR>

" Easy Save shortcut
map <Leader>j :write<CR>

" Set ft=text for prose editing
map <Leader>text :set ft=text<CR>

" Settings for path
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" http://vim.wikia.com/wiki/Change_to_the_directory_of_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Filetype shortcut
map <Leader>ft :set ft=

" ZenCoding Shortcut
vmap <Leader>z <C-Y>,
nmap <Leader>z <C-Y>,
imap <Leader>z <ESC><C-Y>,a

" Tidy Html and XML
:command Thtml :%!tidy -q -i --show-errors 0
:command Txml  :%!tidy -q -i --show-errors 0 -xml

" Hex Vim
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" Hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Async Test Running courtesy of Gary Bernhardt
" must start ~/bin/run_test.sh
map <Leader>at :w\| :silent !echo bundle exec ruby spec/lib/rubocop/runner_spec.rb > test-commands<cr>
"
"
" nnoremap <leader><leader>r :w\| :!rspec spec<cr>
map <leader>q :q
command Rake :!rake

" let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Disable easytags warning
let g:easytags_updatetime_warn = 0

" let g:ycm_filetype_specific_completion_to_disable = { 'ruby' : 1 }
" for floobits
" let g:ycm_allow_changing_updatetime = 0

" Trick for saving vim sessions
" https://ajayfromiiit.wordpress.com/2009/10/15/vim-sessions/
" ie- :mksession vim_session_name.vim and restart with- vim -S
" vim_session_name.vim
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos

" Elixir
" open iex with current file compiled
" :!iex %
" command! Iex :!iex %<cr>
nnoremap <leader>e :!elixir %<CR>
nnoremap <leader>ee :!iex -r % -S mix<CR>

" So as to not conflict with multi-cursors
" let g:NumberToggleTrigger="<F5>"

" HACK: to reset multi-cursor mappings to default b/c of numbertoggle
" TODO: not working
" overwriting them
"" Default mapping
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='<C-m>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'

" Coffeescript
nnoremap <leader>cr :w\|:CoffeeRun<cr>

" project specific vimrcs
" ie in root of project have a .vimrc
set exrc
set secure

" Commit_massage
nnoremap <leader>com :normal gg<cr>:r!commit_message<cr>:normal ggddA<cr>
" Pipe request to waiting window on test-commands.sh loop
"o:w\|:silent !echo "bundle exec m -l 92 spec/routes/routes_spec.rb" > test-commands
":nnoremap <leader>ra :w\|:silent !echo "bundle exec m -l 92 %" > test-commands<CR>
"
" Redraw screen via :redraw or C-l
au BufRead,BufNewFile *.jar,*.war,*.ear,*.sar,*.rar set filetype=zip
augroup gzip
  autocmd!
  autocmd BufReadPre,FileReadPre *.gz set bin
  autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost   *.gz set nobin
  autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
  autocmd FileAppendPre      *.gz !gunzip <afile>
  autocmd FileAppendPre      *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost     *.gz !mv <afile> <afile>:r
  autocmd FileAppendPost     *.gz !gzip <afile>:r
augroup END

au BufRead,BufNewFile *.gem set filetype=gz

" For old vim-commentary muscle memory
xmap \\ gcc

function! CoverageAutoSourcing()
  if filereadable("coverage.vim")
    autocmd BufWritePost *.rb :silent so coverage.vim
  endif
endfunction
command! CoverageAutoSourcing call CoverageAutoSourcing()
nnoremap <Leader>cv :CoverageAutoSourcing<CR>

if executable('sack')
  function! Sack()
    let l:sack_output = substitute(join(readfile($HOME."/.sack_shortcuts"), "\n"), $HOME, "~", "g")
""  let l:sack_output = substitute(l:sack_output, $HOME, "~", 'g')
    let &efm='%f|%l col %c|%m'
    " :set errorformat="%f>%l:%c:%t:%n:%m"
    cexpr l:sack_output
    copen
    " Taken from Ack.vim bindings for consistency and awesomeness
    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
    exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
    exec "nnoremap <silent> <buffer> o <CR>"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> h <C-W><CR><C-W>K"
    exec "nnoremap <silent> <buffer> H <C-W><CR><C-W>K<C-W>b"
    exec "nnoremap <silent> <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t"
    exec "nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J"
  endfunction
  command! Sack call Sack()
  nnoremap <Leader>sa :Sack<CR>
endif

" Vim resizing of splits
" Resize windows quickly
" reset with <c-w>=
" http://tom-clements.com/blog/2011/12/29/vim-my-vimrc-highlights/
" nmap <c-w>l :vertical res +20<cr>
" nmap <c-w>h :vertical res -20<cr>
" nmap <c-w>j :res +20<cr>
" nmap <c-w>k :res -20<cr>
nnoremap :vs :vsplit<cr><c-w>l
nnoremap :hs :split<cr><c-w>j
nnoremap :ts :tabnew<CR>
nnoremap :tn :tabnew<CR>
nnoremap :bd :bd<CR>
nnoremap :X :x

" hi CursorLine   cterm=NONE ctermbg=lightblue guibg=lightblue
set nocursorline

if executable('html2slim')
  function! HTMLtoSlim()
    :r system("pbpaste | html2slim")<CR>
  endfunction
  command! HTMLtoSlim call HTMLtoSlim()
endif

nnoremap <Leader>gg :GitGutterDisable<CR>
" The Silver Searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = {
    \ 'fallback': 'ag %s -l --nocolor -g ""'
    \ }

  "ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  nnoremap <Leader>a :Ag!<SPACE>
  nnoremap <Leader>aa :Ag! <cword><CR>
endif

" Needed for editing crontab
autocmd FileType crontab set nobackup nowritebackup

nnoremap <Leader>ss :Switch<CR>

" Don't bother about checking whether Escape is being used as a means to enter
" " a Meta-key combination, just register Escape immediately
set noesckeys
"
" " Don't bother drawing the screen while executing macros or other automated
" or
" " scripted processes, just draw the screen as it is when the operation
" " completes
set lazyredraw
"
" " Improve redrawing smoothness by assuming that my terminal is reasonably
" " fast
set ttyfast
"
" " Never use any kind of bell, visual or not
" set visualbell t_vb=
"
" " Require less than one second between keys for mappings to work correctly
set timeout
set timeoutlen=1000

" " Require less than a twentieth of a second between keys for key codes to
" work
" " correctly; I don't use Escape as a meta key anyway
set ttimeout
set ttimeoutlen=50"

" Yank from cursor to end of line
nnoremap Y y$

" Insert newline
map <leader><Enter> o<ESC>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" noremap <leader>ss :call StripWhitespace ()<CR>

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

set lcs=tab:›\ ,nbsp:_,extends:&,precedes:<
set listchars+=trail:💔
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" resize current buffer by +/- 5
nnoremap <C-left> :vertical resize +3<cr>
nnoremap <C-down> :resize +3<cr>
nnoremap <C-up> :resize -3<cr>
nnoremap <C-right> :vertical resize -3<cr>"

nnoremap <leader>rs :rubydo $_.gsub! %r{
vnoremap <leader>rs :rubydo $_.gsub! %r{

" Close quickfix pane from any other pane
nnoremap <leader>cc :cclose
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>sh :GitGutterStageHunk<CR>
nnoremap <leader>rh :GitGutterRevertHunk<CR>
nnoremap <leader>gt :GitGutterToggle<CR>

let g:NumberToggleTrigger="<F8>"


" function! Rs(val)
" ruby << EOF
" vim_arg = ::VIM::evaluate('a:val').to_s

" def gs(param)
"   prior, new = param.split(',', 2)
"   $_.gsub(/#{prior}/, new)
" end
" EOF
" endfunction

" function! Rs(val)
" ruby << EOF
" def gs(a:val)
"   prior, new = string.split(',', 2)
"   $_.gsub(/#{prior}/, new)
" end

" # class Garnet
" #   def initialize(s)
" #     @buffer = VIM::Buffer.current
" #     vimputs(s)
" #   end
" #   def vimputs(s)
" #     @buffer.append(@buffer.count,s)
" #   end
" # end
" # gem = Garnet.new("pretty")
" EOF
" endfunction
autocmd BufNewFile,BufRead *.json set ft=javascript " use this instead of vim-json

" Make those debugger statements painfully obvious
au BufEnter,BufWritePost *.rb syn match error contained "\<binding.pry\>"
au BufEnter,BufWritePost *.rb syn match error contained "\<debugger\>"
au BufEnter,BufWritePost *.coffee syn match error contained "console.log"
au BufEnter,BufWritePost *.js syn match error contained "console.log"
au BufEnter,BufWritePost *.coffee syn match error contained "console.log"

nnoremap <leader>l :silent! \| :redraw!<cr>
nnoremap <leader>v :!bundle exec approvals verify -d vimdiff -a<cr>
nnoremap <silent> <C-W>z :wincmd z<Bar>cclose<Bar>lclose<CR>
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
nnoremap <leader>n :NERDTreeToggle<CR>
set colorcolumn=81
nnoremap <leader>fm :silent :!gofmt -w %<cr>

nnoremap :qq :qa!<CR>

" Don't try to highlight lines longer than 800 characters. Prevent horrible
" slowness
set synmaxcol=800
" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Cool trick from sjl
" set undodir=~/.vim/tmp/undo//     " undo files
" set backupdir=~/.vim/tmp/backup// " backups
" set directory=~/.vim/tmp/swap//   " swap files

" " Make those folders automatically if they don't already exist.
" if !isdirectory(expand(&undodir))
"     call mkdir(expand(&undodir), "p")
" endif
" if !isdirectory(expand(&backupdir))
"     call mkdir(expand(&backupdir), "p")
" endif
" if !isdirectory(expand(&directory))
"     call mkdir(expand(&directory), "p")
" endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" colorscheme Tomorrow-Night-Bright
colo detailed

" Create Parent Directories
"-----------------------------------------------------------------------------
" Create directories if the parent directory for a
" file doesn't exist.
" from: http://stackoverflow.com/a/4294176/108857
function! s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Extra vimrcs with direnv
if exists("$EXTRA_VIM")
  for path in split($EXTRA_VIM, ':')
    exec "source ".path
  endfor
endif
