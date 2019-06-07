" Open splits below and right
set splitbelow
set splitright

" Set font
set guifont=Go\ Mono:h14

" Don't blink cursor
set guicursor+=n-v-c:blinkon0

" hide scrollbars in MacVim
set guioptions=r

" Enable syntax highlighting
syntax on

" Color scheme
colorscheme molokai

" Color invisible characters
highlight NonText ctermfg=DarkGrey
highlight SpecialKey ctermfg=DarkGrey

" Show line numbers
set number
set relativenumber

" Highlight current line
set cursorline

" Search
set ignorecase
set incsearch

" Safety
set undofile
set noswapfile
set nobackup
set nowritebackup
set undodir=/tmp/.vim_undo

" Indentation
set wrap
set expandtab
set formatoptions=qrn1
set autoindent
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Show command
set showcmd

" STFU
set visualbell

" Color line numbers
highlight LineNr ctermfg=DarkGrey

" Highlight trailing whitespaces
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
match Todo /\s\+$/

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" write file contents automatically when calling :make
set autowrite

""""""""""""""""""""""""""""""""""""""""
" Shortcuts, commands
""""""""""""""""""""""""""""""""""""""""

" Leader is space
let mapleader="\<Space>"

" Quickly pressing jj exits insert mode
imap jj <Esc>

" Navigate wrapped lines quickly
nmap j gj
nmap k gk

" Navigate between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remove trailing whitespaces
nnoremap <Leader>w :%s/\s\+$//e<CR>

" Live it.
noremap <Up> :resize +2<CR>
noremap <Down> :resize -2<CR>
noremap <Left> :vertical resize -2<CR>
noremap <Right> :vertical resize +2<CR>

" Quick vimrc edit and source
nnoremap <Leader>vi :tabnew $MYVIMRC<CR>
nnoremap <Leader>so :source $MYVIMRC<CR>

" Quickly quit help files
autocmd Filetype help nnoremap <buffer> q :q<CR>
autocmd Filetype godoc nnoremap <buffer> q :q<CR>

" Edit files in same directory as the current file
nnoremap <Leader>ew :e <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>es :sp <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>ev :vsp <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>et :tabe <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" Repeat last macro instead of going to ex mode
nnoremap Q @@

""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""

" ripgrep
let g:rg_highlight=1

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete
map <Leader>gs :Gstatus<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gc :Gcommit -v<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gl :Glog<CR>
map <Leader>gw :Gwrite<CR>

" Markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 3
au BufRead,BufNewFile *.md setlocal textwidth=80

" Dispatch map
nnoremap <F9> :Dispatch<CR>

" fzf
nnoremap <C-P> :FZF<CR>
" nnoremap <C-B> :Buffers<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'molokai'

" ale
let g:ale_completion_enabled = 1
nnoremap <silent> <F2> :ALENextWrap<CR>

""""""""""""""""""""""""""""""""""""""""
" Filetype settings
""""""""""""""""""""""""""""""""""""""""

" Treat Podfiles like ruby
autocmd BufRead,BufNewFile Podfile set filetype=ruby

" indentation settings
autocmd Filetype swift setlocal ts=4 sts=4 sw=4
