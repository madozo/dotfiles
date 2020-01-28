" VUNDLE Config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"vim :PluginInstall
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rhysd/vim-clang-format'
Plugin 'lifepillar/vim-solarized8'
"Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf' 
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'itchyny/lightline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Vim config-----------------------------------------------
"  
let mapleader = ","
syntax enable
:set number
:set relativenumber
set ruler
set hlsearch
set incsearch
set list
set listchars=
set listchars+=tab:░\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
"set laststatus=2

" Learn the fucking hotkeys
nnoremap <Left> :echo "Use 'h' instead of 'Left'!"<CR>
nnoremap <Right> :echo "Use 'l' instead of 'Right'!"<CR>
nnoremap <Up> :echo "Use 'k' instead of 'Up'!"<CR>
nnoremap <Down> :echo "Use 'j' instead of 'Down'!"<CR>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
vnoremap <Left> <NOP>
vnoremap <Right> <NOP>
vnoremap <Up> <NOP>
vnoremap <Down> <NOP>

" ShortCuts -----------------------------------------------
nmap <F6> :NERDTreeToggle<CR>
nmap <C-B> :YcmCompleter GoToDefinition<CR>
nmap <C-U> :YcmCompleter GoToReferences<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-F> :Ag<CR>
"nnoremap <cr> : nohlsearch<cr>

" YouCompleteMe --------------------------------------------
let g:ycm_semantic_triggers = { 'cpp': [ 're!.' ] }
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" vim-clang-format ----------------------------------------
let g:clang_format#detect_style_file = 1
let g:clang_format#enable_fallback_style = 0
let g:clang_format#auto_format = 1
" hack for tmux 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" solarized color scheme
set termguicolors
set background=dark
colorscheme solarized8
" vim cpp highlighing
"let g:cpp_class_scope_highlight = 1
"let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
" Conque
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 
"lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gitbranch#name'
        \ },
        \ }
