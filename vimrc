syntax on

" Use this pattern to capitalize first character only.
"    s#\v(\w)(\S*)#\u\1\L\2#g

" Used when in vscode or intellij to auto load changes.
set autoread

set mouse=a

" Disable bells.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set leader to space. I like the default '\'.
let mapleader = " "

set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set nowrap
set smartcase
set incsearch
set wildmenu
set showmatch
set spelllang=en_us

" The split will be below the current window (including terminal) or to the
" right. It defaults left and top otherwise.
set splitbelow
set splitright

" Highlight search. Do ':noh' to reset it.
set hlsearch

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" For the lightline plugin.
set laststatus=2
set noshowmode

" ===========================================================================
"  Need to load the vim plugin manager. https://github.com/junegunn/vim-plug.
"
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"   Then reload .vimrc (:source ~/.vimrc)
"   :PlugInstall to install plugins.
" ===========================================================================
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
"Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

" My favorite scheme.
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox
set background=dark

" Lets the global command derive the root location. Really for file finds.
if executable('rg')
    let g:rg_derive_root='true'
endif

" I always have trouble spelling this. Key fumbles I guess.
iab teh the
iab hte the
iab THe The
iab tihs this
iab THis This

" make tab in v mode ident code
vmap <tab> >gv
vmap <S-tab> <gv

" Use the ctrl-mouse to block select. Then either I or A for insert appendr,
" or C for change.
noremap   <C-LeftMouse>  <4-LeftMouse>
inoremap  <C-LeftMouse>  <4-LeftMouse>
onoremap  <C-LeftMouse>  <C-C><4-LeftMouse>
noremap   <C-LeftDrag>   <LeftDrag>
inoremap  <C-LeftDrag>   <LeftDrag>
onoremap  <C-LeftDrag>   <C-C><LeftDrag>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Formatting plugin. Including the vscode mapping c-s-i.
" MHELP: <F3> or \f or <C-S-i> = auto format
noremap <F3> :Autoformat<CR>
nnoremap <silent> <leader>f :Autoformat<CR>
nnoremap <C-S-i> :Autoformat<CR>

"vnoremap <silent> <leader>f :Autoformat<CR>
" But we like file nerd better than netrw
" MHELP: <leader> nt = nerd tree
noremap <silent> <leader>nt :NERDTreeToggle <CR>

" Move between buffers.
" MHELP: <leader> b = buffer next
"noremap <leader>b :bnext<CR>

" Close the current buffer
" MHELP: <leader> bd = delete current buffer (:bd or :bw)
"nnoremap <leader>bd :bd<CR>:tabclose<CR>gT

" Toggle between no numbers → absolute → relative with absolute on cursor line:
" MHELP: <leader> r or \r = toggle line numbers
nnoremap <leader>r :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<CR>

" Toggle showing tab chars. or (:set list || :set nolist)
" MHELP: <leader> tab = toggle showing tab chars.
nnoremap <Leader><tab> :set invlist<CR>

" MHELP: <leader> l = clears highlight search
nnoremap <leader>l :nohl<CR>
nnoremap <leader>cc :nohl<CR>

" MHELP: <leader> tips = clears highlight search
nnoremap <leader>tips :vsplit ~/.vim/vim_notes.txt<CR>

" MHELP: <leader> m or \m = shows my mappings
let mhelp = systemlist("grep -e 'MHELP[:]' ~/.vimrc| sed -e 's/\" MHELP[:] //'")
let mhelp_settings = #{close: 'button', border: [], padding: [0,1,0,1], maxheight: 10,}
nnoremap <leader>m :call popup_create(mhelp, mhelp_settings)<CR>

