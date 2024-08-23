"" '"'  for things like headers and thinks to by shown by parsers
"" '""' comment that will be ignored by parsers

""" GENERAL OPTIONS

set nocompatible                    " disable compatibility to old-time vi
set tabstop=2                       " number of columns occupied by a tab character
set shiftwidth=2                    " width for autoindents
set softtabstop=2                   " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                       " convert tabs to white space
set smarttab
set history=1000                    " remember commands
set autoindent                      " indent a new line the same amount as the line just typed
colo zellner                        " set colorscheme
set scrolloff=10                    " Vertical center cursor
set number                          " add line numbers
set relativenumber                  " number relative to cursor
set hlsearch                        " highlight search matches
set incsearch                       " Incremental search
set undodir=~/.vim/undo_dir         " undo storage path
set undofile                        " store undo of all edits
"" set spell spelllang=en,el           " select spell languages
set spelllang=en_us,el              " select spell languages
"" set spelllang=en_gb,el              " select spell languages
set showmatch                       " show matching brackets
set iskeyword-=_                    " underscore can separate words
syntax    on                        " highlight syntax
set nofoldenable                    " Disable folding at start
set timeoutlen=700                  " timer for whichkey
set clipboard=unnamedplus           " use clipboard of the OS
set keymap=greek_utf-8              " ctrl+f, ctrl+6, ctrl+^ change language
set iminsert=0                      " start always with English language
set imsearch=-1                     " not sure for language probably
set mouse=nicr                      " Mouse scrolls
set ignorecase                      " case insensitive matching
set smartcase                       " case sensitive matching if a capital letters used
set cursorline                      " highlight current line
filetype plugin indent on           " auto-indenting depending on file type
set t_Co=256                        " set terminal colors

filetype plugin on
syntax on

"" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
"" highlight trailing whitespace in red
"" have this highlighting not appear whilst you are typing in insert mode
"" have the highlighting of whitespace apply when you open new buffers
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=17 guibg=#00005f
"" match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" Open file at previous location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"" Numbering scheme
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Dissable arrows
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>


"" gvim option
" set guioptions-=m  "menu bar
set guioptions-=T  "hide toolbar
set guioptions-=r  "hide scrollbar



"" filetype  off                  "  required
"" highlight CursorLine cterm=NONE ctermbg=Blue ctermfg=white


""" PLUGINS INSTALL

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  "" let Vundle manage Vundle
  Plugin 'VundleVim/Vundle.vim'
  "" just a colorshceme
  Plugin 'morhetz/gruvbox'
  "" Show registers '"' or '@' in normal mode and <CTRL-R> in insert mode
  Plugin 'junegunn/vim-peekaboo'
  "" Showing key bindings, configure it
  Plugin 'liuchengxu/vim-which-key'

  Plugin 'rhysd/vim-grammarous'
  Plugin 'dpelle/vim-LanguageTool'

  "" Automatically causes vim to reload files which have been written on disk but not modified in the buffer since the last write from vim
  Plugin 'djoshea/vim-autoread'
  "" diff two separate blocks of text with :Linediff
  Plugin 'AndrewRadev/linediff.vim'
  "" view and arrange csv files
  Plugin 'chrisbra/csv.vim'
  "" file browser
  Plugin 'scrooloose/nerdtree'
  "" structure and tags
  Plugin 'preservim/tagbar'
  "" multiple cursors
  Plugin 'mg979/vim-visual-multi'
  "; "" diff dirs
  "; Plugin 'will133/vim-dirdiff'
  "" diff dirs better??
  Plugin 'ZSaberLv0/ZFVimDirDiff'
  Plugin 'ZSaberLv0/ZFVimJob' " required
  Plugin 'ZSaberLv0/ZFVimIgnore' " optional, but recommended for auto ignore setup
  Plugin 'ZSaberLv0/ZFVimBackup' " optional, but recommended for auto backup
  "" Pretty
  Plugin 'vim-airline/vim-airline'
  "" Toggle comments
  Plugin 'tpope/vim-commentary'
  "" Show colors on variables
  Plugin 'chrisbra/Colorizer'
  "" Sent text for REPL evaluation
  Plugin 'jpalardy/vim-slime'
  "" Julia support
  Plugin 'JuliaEditorSupport/julia-vim'
  "" R IDE
  Plugin 'jalvesaq/Nvim-R'
  "" code completion source for code embedded in other documents
  Plugin 'jmbuhr/otter.nvim'
  "" misc for md and r
  Plugin 'vim-pandoc/vim-rmarkdown'
  Plugin 'vim-pandoc/vim-pandoc-syntax'
  "" Plugin 'quarto-dev/quarto-vim'
  Plugin 'quarto-dev/quarto-nvim'
  "" async lint engine
  Plugin 'w0rp/ale'
  Plugin 'neovim/nvim-lspconfig'
  " For R completion
  Plugin 'ncm2/ncm2'
  Plugin 'roxma/nvim-yarp'
  Plugin 'gaalcaras/ncm-R'
  " Invoke autocomplete with tab ?
  Plugin 'ervandew/supertab'
  " More autocomplete options?
  " Plugin 'girishji/vimcomplete'
  " Color for current line
  Plugin 'miyakogi/conoline.vim'

  " a color scheme
  Plugin 'romainl/Apprentice'

  Plugin 'ycm-core/YouCompleteMe'

  Plugin 'vimwiki/vimwiki'


  " " markdown folding
  " Plugin 'shushcat/vim-minimd'
  " " Undo tree to test
  Plugin 'mbbill/undotree'

  "
  Plugin 'vim-voom/VOoM'

  "
  Plugin 'junegunn/fzf.vim'
  Plugin 'junegunn/fzf'

  """ fixes
  if !has('nvim')
      Plugin 'roxma/vim-hug-neovim-rpc'
  endif

call vundle#end()            " required
filetype plugin indent on    " required





" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

"" R script settings
"" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1
" Needed to have #include work in cpp code
" let R_commented_lines = 1
" let R_close_term = 1
" let R_external_term = 1 
" let R_external_term = 'urxvt' 
" make '__' to '<-'
let R_assign = 2

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

let g:gruvbox_guisp_fallback = "bg"
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
set background=dark
" colorscheme gruvbox
" colorscheme default
" colorscheme desert
colorscheme lunaperche

" set voom for Rmd
let voom_ft_modes = {'markdown': 'pandoc', 'rmd': 'pandoc'}
" au BufRead,BufNewFile *.md,*.Rmd,*.qmd command! Toc Voom
au BufRead,BufNewFile *.Rmd,*.qmd command! Toc Voom



""" FUNCTIONS

"" Fill rest of line with characters up to 80
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

"" Fill line for R scripts comments up to 80
function! RFillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 79 | endif
    " strip trailing spaces and others first
    .s/[[:space:]-#]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=('  '.repeat(a:str, reps))/
    endif
endfunction

"" Find max line lenght
function MaxLine()
    let maxcol = 0
    let lnum = 1
    while lnum <= line("$")
        call cursor(lnum, 0)
        if col("$") > maxcol
            " let maxcol = col("$")
            let maxcol = virtcol("$")
            let maxline = lnum
        endif
        let lnum += 1
    endwhile
    echo maxline ":"  maxcol - 1 
endfunction
" https://stackoverflow.com/questions/9394408/pad-all-lines-with-spaces-to-a-fixed-width-in-vim-or-using-sed-awk-etc
" :'<.'>w !wc -L
" :%s/$/\=repeat(' ',64-virtcol('$'))



""" SPECIAL OPTIONS


"" LanguageTool
" let g:languagetool_jar='/home/athan/.vim/bundle/LanguageTool-5.9/languagetool-commandline.jar'
let g:languagetool_jar='/home/athan/.vim/bundle/vim-grammarous/misc/LanguageTool-5.9/languagetool-commandline.jar'

"" Grammarous
let g:grammarous#jar_url = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
" let g:grammarous#languagetool_cmd='java -jar ~/.vim/bundle/LanguageTool-5.9/languagetool-commandline.jar'

"" vim diff options
if &diff
    set diffopt=filler,context:1000000  "" filler is default and inserts empty lines for sync
    colorscheme apprentice
    let g:conoline_auto_enable = 0
endif

" Fill R comments with "-" up to 80
autocmd FileType r,R,sh,py nnoremap <buffer> <F12> :call RFillLine( '-' )<CR>


" "" close vim if the only window left open is a NERDTree 
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" autowrap for writing
"" We always wan't spelling in some files
augroup markdownSpell
    autocmd!
    autocmd BufRead,BufNewFile *.md,*.Rmd,*.qmd setlocal spell spelllang=en_us,el textwidth=85 formatoptions+=t colorcolumn=86
    autocmd FileType      latex,tex,md,markdown setlocal spell spelllang=en_us,el
augroup END


"" Folding markdown
let g:markdown_folding = 1


"" Colorizer options
let g:colorizer_auto_color = 1

"" CSV options
let g:csv_highlight_column = 'y'

"" Slime options send text to REPL
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

"" line wrapping for markdown
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap linebreak
augroup END
au BufRead,BufNewFile *.md,*.Rmd setlocal wrap linebreak

"" choose airline theme
let g:airline_theme='dark'

"" ale options
let g:ale_enable_r_lintr_checker = 1
let g:ale_r_checkers = ['lintr']
let g:ale_r_lintr_linters = "linters_with_defaults(line_length_linter(999))"
"let g:ale_r_lintr_options = "linters_with_defaults(line_length_linter(120))"

"" NerdTree
" show lines cound
let g:NERDTreeFileLines = 1


"" vimwiki
let g:vimwiki_list = [{'path': '~/NOTES/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
" his option will treat all markdown files in your system as part of vimwiki

" restrict Vimwiki's operation to only those paths listed in g:vimwiki_list
let g:vimwiki_global_ext = 0

" task tools
function! VimwikiFindIncompleteTasks()
  lvimgrep /- \[ \]/ %:p
  lopen
endfunction

function! VimwikiFindAllIncompleteTasks()
  VimwikiSearch /- \[ \]/
  lopen
endfunction

nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>

" "" vim-minimd
" nmap z :<C-u>MiniMDToggleFold<CR>
" let g:default_markdown_syntax = 1



""" KEYBINDS

" F2: Toggle file tree
map  <F2> :NERDTreeToggle<CR>

" F3: Toggle Tagbar
nmap <F3> :TagbarToggle<CR>

" F4: Toc for markdowns
map <F4> :Voom<CR>

" " F5: run current script
" nnoremap <F5> :w<CR>:!%:p<CR>
" " F5: run current script
" inoremap <F5> <Esc>:w<CR>:!%:p<CR>

" F6: undo tree
nnoremap <F6> :UndotreeToggle<CR>

" " F9: Build C++
" autocmd FileType cpp map <F9> :w <CR> :!g++ -std=c++11 -Wall -o "%<" "%" && \time -f "Time: %E  CPU: %P  MEM: %MKb  STA: %I\n" "./%<"<CR>

" '\d': Refresh diff highlight 
nnoremap <silent> <leader>d :diffupdate<CR>

" '\': shows keys for leader
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
" ' ': shows keys in general
nnoremap <silent> <space> :<c-u>WhichKey '  '<CR>
" ': shows keys in general
nnoremap <silent> ' :<c-u>WhichKey ''<CR>

" ctrl+f, ctrl+6: change language with both
inoremap <c-f> <c-^>

" Navigate windows with CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l " terminal redraw conflict

" Adjust split sizes with CTRL + arrows
noremap <silent> <C-Left>  :vertical resize +1<CR>
noremap <silent> <C-Right> :vertical resize -1<CR>
noremap <silent> <C-Up>    :resize +1<CR>
noremap <silent> <C-Down>  :resize -1<CR>

" Scroll open tabs
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Change headers/comments level
nnoremap <buffer> <silent> ]# :keeppatterns s/^/#/e<cr>
nnoremap <buffer> <silent> [# :keeppatterns s/^#//e<cr>
xnoremap <buffer> <silent> [# :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<cr>
xnoremap <buffer> <silent> ]# :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<cr>

" \| : Pad selection with spaces
vnoremap <silent> <leader><bar> :call RightPadSelection(+3)<cr>
func! RightPadSelection(extra) range
    let m = max(map(range(a:firstline, a:lastline), 'virtcol([v:val, "$"])'))
    let m += a:extra
    sil exec $'{a:firstline},{a:lastline}' 's/$/\=repeat(" ",m-virtcol("$"))'
endfunc


" "" Python-mode
" let g:pymode_rope = 1
" "" Documentation
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'
" "" Linting
" let g:pymode_lint = 1
" let g:pymode_lint_checker = "pyflakes,pep8"
" "" Auto check on save
" let g:pymode_lint_write = 1
" "" Support virtualenv
" let g:pymode_virtualenv = 1
" "" Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'
" "" syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" "" Don't autofold code
" let g:pymode_folding = 1
