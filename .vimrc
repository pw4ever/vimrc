" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
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
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" Customization
colorscheme evening
set hlsearch
set nobackup
set writebackup
set spell
set spelllang=en_us
set number
set path+=~

" Room for "fold" indicator
set foldcolumn=1
set foldmethod=syntax

" proper tab
set tabstop=4
set expandtab

set cindent shiftwidth=2

" set viminfo='1000,f1,<500,:100,@100,/100,%
set viminfo='50,:100,f1,s100

"cd .

set guioptions+=afimgtTL

set autowrite

set completeopt=longest,menuone

" Special arrangement with Cscope should be made
if filereadable("cscope.out")
    set noautochdir
elseif $CSCOPE_DB != ""
    set noautochdir
else
    set autochdir
endif

" Plugins
let s:my_plugins = glob($HOME . "/.vim/extras/*", 0, 1)
for s:i in s:my_plugins
    if isdirectory(s:i)
        let &runtimepath.= "," . s:i
    endif
endfor

" rebuild doc tag every time without throwing exceptions
try
    execute "helptags" $HOME . "/.vim/doc"
catch
endtry

" key customization
map <F11> <Esc><Esc>:Tlist<CR>
map <F12> <Esc>:make<CR>
map <C-M-n> <Esc>:bn<CR><Esc>
map <C-M-p> <Esc>:bp<CR><Esc>
map <M-.> <Esc>:cn<CR>
map <M-,> <Esc>:cp<CR>

" Latex-Suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" Slimv Superior Lisp Interaction Mode for Vim
"let g:slimv_keybindings=2
"let g:paredit_mode=1
"let g:slimv_lisp="/usr/bin/sbcl"
"let g:slimv_python="/usr/bin/python2"
"let g:slimv_browser_cmd="/usr/bin/firefox"
"let g:slimv_menu=1
"let g:slimv_package=1
"let g:slimv_repl_open=1
"let g:slimv_repl_split=1
"let g:slimv_repl_wrap=1

" expand the path to include my hacking project
"let s:my_arch = "x86"
"let s:arch = exists("s:my_arch") ? s:my_arch : substitute(system("uname -m"), "\n", "", "g")
"let s:hacking_include_list= [
"            \    "/project/linux/include/",
"            \    "/project/linux/arch/" . s:arch . "/include/",
"            \    "/project/qemu/include/",
"            \    "/project/xen/xen/include/",
"            \    ]
"for s:i in s:hacking_include_list
"    let s:i = $HOME . s:i
"    if isdirectory(s:i)
"        let &path.= ',' . s:i
"    endif
"endfor 

" csupport Customization
" |csupport-custom-glob-vars|
"let g:C_CplusCompiler='clang'
let g:C_CFlags='-std=gnu99 -Wall -g -O0 -c'
let g:C_CplusCFlags='-std=c++11 -Wall -g -O0 -c'

"execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"let g:jedi#autocompletion_command="<tab>"
