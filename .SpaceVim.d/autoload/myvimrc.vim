function! myvimrc#after() abort
    set incsearch hlsearch
    set ignorecase smartcase
    set nobackup writebackup
    set wildmode=longest,list,full
    set wildmenu
endfunction
