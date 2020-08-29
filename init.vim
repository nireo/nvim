call plug#begin('~/.vim/plugged')

""""""""""""""""" Non language specific
" Intellisense engine, with full language server protocal support (auto
" completion & auto imports)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""" NERDTree related plugins
Plug 'scrooloose/nerdtree'
" Highlight files with changes
Plug 'Xuyuanp/nerdtree-git-plugin'
" Show file icons next to files (vim font needs to be Nerd Font, https://github.com/ryanoasis/nerd-fonts)
Plug 'ryanoasis/vim-devicons'

" Show git indications for added, modified and removed files
Plug 'airblade/vim-gitgutter'

"FuzzyFileFinder is for quickly searching files in directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Improved comments
Plug 'scrooloose/nerdcommenter'

" Hex color highlighting in all files
Plug 'skammer/vim-css-color'

" Discord presence
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins'}

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'liuchengxu/space-vim-dark'
Plug 'jaredgorski/fogbell.vim'
Plug 'djjcast/mirodark'
Plug 'co1ncidence/mountaineer'
Plug 'lifepillar/vim-solarized8'
Plug 'romainl/Apprentice'

""""""""""""""""" Language specific
" C++
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'rhysd/vim-clang-format'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Javascript & typescript
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim' 

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

" Theme settings
if has('termguicolors') 
 set termguicolors
 endif
if !has('gui_running')
  set t_Co=256
endif

syntax enable
set background=dark
colorscheme solarized8

let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
let g:space_vim_dark_background = 233

" NerdTree settings
inoremap jk <ESC>
nmap <C-n> :NERDTreeFind<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nmap <F6> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusWithFlags = 1
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         

let g:NERDTreeIgnore = ['^node_modules$']

command! -nargs=0 Prettier :CocCommand prettier.formatFile

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" switch line numbers to relative, but also include the current selected line
" number
set number relativenumber

" Use Unicode supporting encoding
set encoding=utf-8

set smarttab
set cindent
set tabstop=4
set shiftwidth=4

" Replace tabs with spaces when saved
set expandtab

" Automatically insert tabs or spaces when you write code
set autoindent

" Highlight the current line
" set cursorline

" yank and copy to X clipboard
set clipboard+=unnamed

" Set maximum history record
set history=1000

" Faster redrawing
set ttyfast

set report=0
set linespace=0
set mousehide


" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Better splits
set splitright
set splitbelow

set hidden 
set updatetime=300
set timeoutlen=300
set shortmess+=c
set signcolumn=yes

" Disable swap files
set noswapfile

" The amount of lines above and below the cursor
set scrolloff=4

" Always show where the cursor is
set ruler

" Avoid wrapping a line in the middle of a word
set linebreak

" Enable mouse usage
set mouse=a

" Better search
set ignorecase
set incsearch
set gdefault
set smartcase


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]



" Go plugin settings settings
let g:go_def_mapping_enabled = 0
let g:go_highlight_functions = 1
let g:go_highlight_functions_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Fuzzy file finder
nnoremap <silent> <C-p> :Files<CR>

" Coc related stuff
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <F2> <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Clang settings
autocmd Filetype c, cpp, objc ClangFormatAutoEnable
" Format c, cpp, objc code on save
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,*.objc ClangFormat

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.html, PrettierAsync

" Add a new binding for the ESC-key since it is quite far away
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" Disable array keys for practice
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" add a save key binding instead of writing the command :w
nnoremap <C-s> :w<CR>
