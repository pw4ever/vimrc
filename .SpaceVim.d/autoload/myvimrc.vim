function! myvimrc#after() abort
    set incsearch hlsearch
    set ignorecase smartcase
    set nobackup writebackup
    set tabstop=4 expandtab
    set cindent shiftwidth=4
    set autowrite
    set wildmode=longest,list,full
    set wildmenu
endfunction
