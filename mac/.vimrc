" Vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugins
Bundle 'gmarik/vundle' 
Bundle 'Valloric/YouCompleteMe'
Bundle 'a.vim'
Bundle 'wincent/Command-T'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Mizuchi/STL-Syntax'
Bundle 'tomtom/tcomment_vim'
Bundle 'majutsushi/tagbar'
Bundle 'julialang/julia-vim'
Plugin 'c.vim'
Plugin 'taglist.vim'
Plugin 'brookhong/cscope.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'bling/vim-bufferline'
Plugin 'ervandew/supertab'
" Plugin 'YankRing.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'vimwiki'
Plugin 'shougo/neocomplete.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
" Mac vim settings (nitimalh)
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
" Optional:
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()                        " required
filetype plugin indent on                " required

                                         " Vim environment options
syntax on
set nowrap
set mouse=a
set expandtab
set number
set tabstop=4
set shiftwidth=4
set visualbell
set noerrorbells
set encoding=utf-8

set nocompatible                         " Use Vim defaults (much better!)
set backspace=indent,eol,start           " allow backspacing over everything in insert mode
set autoindent                           " always set autoindenting on
set copyindent                           " copy the previous indentation on autoindenting
set nobackup
set history=50                           " keep 50 lines of command line history
set ruler                                " show the cursor position all the time
set ignorecase                           " ignore case when searching
set smartcase                            " ignore case if search pattern is all lowercase,
                                         " case-sensitive otherwise
set path=$PWD/**
set ttyfast
set hidden
set shiftround                           " use multiple of shiftwidth when indenting with '<' and '>'

set history=1000                         " remember more commands and search history
set undolevels=1000                      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                " change the terminal's title
set visualbell                           " don't beep
set noerrorbells                         " don't beep
set nobackup
set noswapfile

set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F9>
"""""""""""""" Mappings
map <F2> :TlistToggle<CR>
map <F3> :!/opt/rational/clearcase/bin/cleartool diff -pred -opt -b -g % &<CR>
map <F4> :!/opt/rational/clearcase/bin/cleartool co -nc % &<CR>
map <F5> :NERDTreeToggle<CR>
map <F6> :mksession! ~/vim_session <cr> " Quick write session with F7
map <F7> :source ~/vim_session <cr>     " And load session with F8
nmap <F8> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR> :!cscope -b -i cscope.files -f cscope.out<CR> :cs reset<CR>

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nnoremap <Space>w :w<CR>

nnoremap ; :
nnoremap H gT
nnoremap L gt

" Vim airline tmuxline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"""""""""""" My cscope/vim key mappings
"
" The following maps all invoke one of the following cscope search types:
"
"   's'   symbol: find all references to the token under cursor
"   'g'   global: find global definition(s) of the token under cursor
"   'c'   calls:  find all calls to the function name under cursor
"   't'   text:   find all instances of the text under cursor
"   'e'   egrep:  egrep search for the word under cursor
"   'f'   file:   open the filename under cursor
"   'i'   includes: find files that include the filename under cursor
"   'd'   called: find functions that function under cursor calls
"
" Below are three sets of the maps: one set that just jumps to your
" search result, one that splits the existing vim window horizontally and
" diplays your search result in the new window, and one that does the same
" thing, but does a vertical split instead (vim 6 only).
"
" I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
" unlikely that you need their default mappings (CTRL-\'s default use is
" as part of CTRL-\ CTRL-N typemap, which basically just does the same
" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
" If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
" of these maps to use other keys.  One likely candidate is 'CTRL-_'
" (which also maps to CTRL-/, which is easier to type).  By default it is
" used to switch between Hebrew and English keyboard mode.
"
" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
" that searches over '#include <time.h>" return only references to
" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
" files that contain 'time.h' as part of their name).


" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
"

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""" key map timeouts
"
" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
"
set notimeout 
"
" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"
"set timeoutlen=4000
"
" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
"
"set ttimeout 
"
" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
"set ttimeoutlen=100

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

""""" END CSCOPE

set tags=$CC_BASE/tags

" Neovim
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" Tagbar settings
let g:tagbar_ctags_bin = '/usr/bin/ctags'

" Configuration parameters for taglist plugin
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40
let Tlist_Show_One_File = 1
let Tlist_Process_File_Always = 1
let Tlist_Auto_Update = 1
let Tlist_Highlight_Tag_On_BufEnter = 1

" Bufferline
"let g:bufferline_echo = 1
"let g:bufferline_modified = '+'
"let g:bufferline_inactive_highlight = 'StatusLineNC'
"let g:bufferline_active_highlight = 'StatusLine'

" incsearch settings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
set hlsearch
"endif

augroup cprog
  "Remove all cprog autocommands
  au!
  
  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.cpp,*.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,:// cinoptions=g0
augroup END

augroup gzip
" Remove all gzip autocommands
  au!
  " Enable editing of gzipped files
  " read: set binary mode before reading the file
  " uncompress text in buffer after reading
  " write: compress file after writing
  " append: uncompress file, append, compress file
  autocmd BufReadPre,FileReadPre *.gz set bin
  autocmd BufReadPost,FileReadPost   *.gz let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost *.gz '[,']!gunzip
  autocmd BufReadPost,FileReadPost *.gz set nobin
  autocmd BufReadPost,FileReadPost *.gz let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")

  autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
  autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r

  autocmd FileAppendPre          *.gz !gunzip <afile>
  autocmd FileAppendPre          *.gz !mv <afile>:r <afile>
  autocmd FileAppendPost         *.gz !mv <afile> <afile>:r
  autocmd FileAppendPost         *.gz !gzip <afile>:r
augroup END
" GVim / MacVim config


" YouCompleteMe options
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" NerdTree options
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeDirArrows=0

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
