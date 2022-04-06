if &compatible
	set nocompatible
endif

set shell=bash
set modelines=0
set conceallevel=0
set encoding=utf-8
set tabstop=4
set shiftwidth=4
au BufNewFile,BufRead,BufEnter,VimEnter *.css set tabstop=2
au BufNewFile,BufRead,BufEnter,VimEnter *.css set shiftwidth=2
set softtabstop=0
set scrolloff=5
set matchpairs+=<:>
set number relativenumber ruler hidden noshowmode visualbell
set wrap linebreak expandtab incsearch ignorecase smartcase showmatch
set completeopt=menuone,noinsert,noselect
set background=dark
set termguicolors
set t_Co=256
set ttyfast
set mouse=a
syntax on

luafile ~/.config/nvim/nvim-tree-conf.lua
luafile ~/.config/nvim/cmp-conf.lua
luafile ~/.config/nvim/plugins.lua
source ~/.config/nvim/keybinds.vim
au BufNewFile,BufRead *.duml set ft=yaml
au BufNewFile,BufRead *.tmux.conf set ft=tmux
au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})

" Signify config
set updatetime=85
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Colorscheme
let g:material_style = 'oceanic'
colorscheme material

" Nvim-LSP diagnostic colors
" hi LspDiagnosticsDefaultHint        ctermfg=Magenta guifg=#cc32cc
" hi LspDiagnosticsDefaultError       ctermfg=Red     guifg=#cc1624
" hi LspDiagnosticsDefaultWarning     ctermfg=Yellow  guifg=#cc991b
" hi LspDiagnosticsDefaultInformation ctermfg=Blue    guifg=#0c74ce

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap ;s :call SynStack()<CR>

" Barbar tabline config
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.tabpages = v:false
