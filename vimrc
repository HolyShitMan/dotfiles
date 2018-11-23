" installed packages:
"      entLine, local_vimrc, supertab, tlib_vim, vim-airline, vim-eunuch,
"      vim-multiple-cursors, yang.vim, DoxygenToolkit.vim, jedi-vim,
"      nerdcommenter, svnj.vim, undotree, vim-airline-themes, vim-fugitive,
"      vim-snipmate, fzf.vim, lh-vim-lib, nerdtree, tagbar, vim-addon-mw-utils,
"      vim-easy-align, vim-language-p4, vim-snippetsnot,
"
" additional programs:
"      fzf, ag

" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
set term=screen-256color
colorscheme deus
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
  filetype indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals

set number
set linebreak
set showbreak=+++
set textwidth=80
set showmatch
set splitright
set splitbelow

set hlsearch
nnoremap <silent> <C-l> :nohl<CR>
set autoindent
set smartindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:indentLine_color_term = 0
let g:indentLine_char = '┆'

set wildmenu
set ruler
set undolevels=500
set backspace=indent,eol,start


" Save folds
" augroup AutoSaveFolds
"     autocmd!
"     autocmd BufWinLeave * mkview
"     autocmd BufWinEnter * silent loadview
" augroup END

let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]
function! MakeViewCheck()
    if has('quickfix') && &buftype =~ 'nofile'
        return 0
    endif
    if empty(glob(expand('%:p')))
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        return 0
    endif
    return 1
endfunction
augroup vimrcAutoView
    autocmd!
    autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
augroup end

" Text specific (dictionary, textwidth)
au BufNewFile,BufRead,BufEnter *.md     setlocal dictionary=.vim/spell/de.utf-8.add
au BufNewFile,BufRead,BufEnter *.md     setlocal complete+=t
au BufNewFile,BufRead,BufEnter *.md     setlocal spell spelllang=de_de
au BufNewFile,BufRead,BufEnter *.md     setlocal textwidth=1000
au BufNewFile,BufRead,BufEnter *.tex    setlocal dictionary=.vim/spell/de.utf-8.add
au BufNewFile,BufRead,BufEnter *.tex    setlocal complete+=t
au BufNewFile,BufRead,BufEnter *.tex    setlocal spell spelllang=de_de
au BufNewFile,BufRead,BufEnter *.tex    setlocal textwidth=1000
au BufNewFile,BufRead,BufEnter *.wiki   setlocal dictionary=.vim/spell/de.utf-8.add
au BufNewFile,BufRead,BufEnter *.wiki   setlocal complete+=t
au BufNewFile,BufRead,BufEnter *.wiki   setlocal spell spelllang=de_de
au BufNewFile,BufRead,BufEnter *.wiki   setlocal textwidth=1000



" Switch between Header and Source
let linenumber = "0"
let prev = "0"
map <F3> :exe":w \| let prev = linenumber \| let linenumber = line('.') \| :e +".linenumber." %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,"<CR>
map <F4> :exe":w \| let prev = linenumber \| let linenumber = line('.') \| :e +".linenumber." %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,"<CR>

" Switch between Tabs and Space
map <F5> :set tabstop=4 expandtab <CR>
map <F6> :set tabstop=4 noexpandtab <CR>
" map  <silent> <F10> :call ToggleSWS()<CR>

nmap <F8> :UndotreeToggle<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :TagbarToggle<CR>
nmap <leader>f :Ag 
vmap ( xi(<Esc>p
vmap [ xi[]<Esc>P
vmap { xi{<Esc>p
vmap ' xi""<Esc>P
vmap „ xi„“<Esc>P
vmap ‚ xi‚‘<Esc>P
" Search from visual mode
" vnoremap // y/<C-R>"<CR>
vnoremap // y<Esc>:Ag <C-R>"<CR>

" Automatically save the current session whenever vim is closed
autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

" <F7> restores that 'shutdown session'
noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

" If you really want to, this next line should restore the shutdown session
" automatically, whenever you start vim.  (Commented out for now, in case
" somebody just copy/pastes this whole block)
" autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>

" manually save a session with <F5>
" noremap <F7> :mksession! ~/.vim/manual_session.vim<CR>

" recall the manually saved session with <F6>
" noremap <C-F8> :source ~/.vim/manual_session.vim<CR>

nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
nnoremap ]q :cnext<CR>
nnoremap ]Q :cprevious<CR>
nnoremap <C-j> :%s/\s\+$//g<CR>
nnoremap <C-k> b~e
" swap character
nnoremap <silent> gc xph
" swap word
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
nnoremap DD d$d0x

inoremap ( ()<LEFT>
inoremap () ()
inoremap (<BS> x<BS>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<RIGHT>": ")"

inoremap {} {}
inoremap { {}<LEFT>
inoremap {<CR> {<CR>x<CR>}<UP><END><BS>
inoremap {<BS> x<BS>
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<RIGHT>": "}"

" does not work
" inoremap " ""<LEFT>
" inoremap "" ""
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<RIGHT>": "\""


" control backspace
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" show trailing white space
fun! ToggleSWS()
	if &list
		set nolist
	else
		set list
	endif
endfun


" highlight trailing white space in red
let c_space_errors=1
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set lcs=tab:>-,trail:-

" Clangcomplete
filetype plugin on
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
let g:clang_library_path = '/usr/lib/llvm-5.0/lib/libclang-5.0.so.1'
set completefunc=ClangComplete

"airline
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 0

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1

" markdown preview
let vim_markdown_preview_hotkey='<C-m>'

" FZF
set rtp+=set_to_fzf_dir
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Lines<CR>

" curser shape
let escPrefix = ""
let escSuffix = ""
if exists('$TMUX')
    let escPrefix = "\<ESC>Ptmux;\<ESC>"
    let escSuffix = "\<ESC>\\"
endif
let &t_SI = escPrefix . "\<Esc>[5 q" . escSuffix
let &t_SR = escPrefix . "\<Esc>[3 q" . escSuffix
let &t_EI = escPrefix . "\<Esc>[1 q" . escSuffix

" doxygen comments
let g:DoxygenToolkit_briefTag_pre = "\\brief   "
let g:DoxygenToolkit_paramTag_pre = "\\param   "
let g:DoxygenToolkit_throwTag_pre = "\\throw   "
let g:DoxygenToolkit_returnTag    = "\\return  "
let g:DoxygenToolkit_fileTag      = "\\file    "
let g:DoxygenToolkit_authorTag    = "\\author  "
let g:DoxygenToolkit_dateTag      = "\\date    "
let g:DoxygenToolkit_versionTag   = "\\version "
let g:DoxygenToolkit_blockTag     = "\\name    "
let g:DoxygenToolkit_classTag     = "\\class   "
let g:DoxygenToolkit_authorName   = "insert name"
let g:DoxygenToolkit_undocTag     = "DOX_SKIP_BLOCK"


" Functions
" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.

function Inc(...)
    let result = g:i
    let g:i += a:0 > 0 ? a:1 : 1
    return result
endfunction


function Dec(...)
    let result = g:i
    let g:i -= a:0 > 0 ? a:1 : 1
    return result
endfunction

" command to fold everything except what you searched for
command! -nargs=* Foldsearch
      \ if <q-args> != '' |
      \   exe "normal /".<q-args>."\<CR>" |
      \ endif |
      \ if @/ != '' |
      \   setlocal
      \     foldexpr=FoldRegex(v:lnum,@/,2)
      \     foldmethod=expr
      \     foldlevel=0 |
      \ endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

function! FoldRegex(lnum,pat,context)
  " get start/end positions for context lines
  let startline=a:lnum-a:context
  while startline < 1
    let startline+=1
  endwhile
  let endline=a:lnum+a:context
  while endline > line('$')
    let endline-=1
  endwhile

  let returnval = 2

  let pos=getpos('.')

  " search from current line to get matches ON the line
  call cursor(a:lnum, 1)
  let matchline=search(a:pat,'cW',endline)
  if matchline==a:lnum
    let returnval = 0
  elseif matchline > 0
    " if current line didn't match, there could have been a match within
    " trailing context lines
    let returnval = 1
  else
    " if no match at current line, search leading context lines for a match
    call cursor(startline, 1)
    let matchline=search(a:pat,'cW',a:lnum)
    if matchline > 0
      let returnval = 1
    endif
  endif

  call setpos('.',pos)

  return returnval
endfun


" selecting jump
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal " . j . "\<c-i>"
        else
            execute "normal " . j .  "\<c-o>"
        endif
    endif
endfunction
nmap <Leader>j :call GotoJump()<CR>


" ALE
" Includes have to be defined in project dir in
" _vimrc_local.vim with g:ale_cpp_clang_options = "..."
let g:ale_linters_explicit = 1
" Put following command in _vimrc_local file to enable clang in specific project
" let g:ale_linters = {
" \   'cpp': ['clang','cppcheck','clangtidy','flawfinder'],
" \   'c'  : ['clang','clangtidy','flawfinder']
" \}
let g:ale_linters = {
\   'cpp': ['cppcheck','clangtidy','flawfinder'],
\   'c'  : ['clangtidy','flawfinder'],
\   'python'  : ['pylint']
\}
let g:ale_cpp_clang_executable = 'clang++-5.0'
let g:ale_c_clang_executable = 'clang-5.0'
nmap <silent> <leader>an :ALENext<cr>
nmap <silent> <leader>ap :ALEPrevious<cr>
" Key Mode Type Notes
" Function keys All modes Free For instance, <F6>All.
" Alt key combinations All modes Free For instance, <M-q>. Note that mapping alt
" keys can be problematic depending on the terminal emulator. See e.g. :help
" :map-alt-keys for more information.
" USED <C-Q> All modes Synonym Synonym for <C-Vi>. This key is used for flow control on
" the terminal. On modern machines most people have no use for flow control so you
" can run stty -ixon in your shell to unlock it for your own use.
" <C-S> All modes Free Used for flow combinationsontrol like <C-Q>.
" <C-@> Normal Free This can also be entered with <beC-Space>.
" <C-J> Normal Synonym Synonym for j.
" USED  <C-K> Normal Free
" <C-N> Normal Synonym Synonym for j.
" <C-P> Normal Synonym Synonym                        for k.
" <C-[> Normal Free This can also be typed as <Esc>.
" <C-_> Normal Free This can also be typed as <C-/>.
" + Normal Synonym Synonym for <CR>.
" K Normal By default, this is an inferior version of
" <Leader>K that can be obtained through man.vim with
" runtime! ftplugin/man.vim. See :help find-manpage for
" more.
" S Normal Synonym Synonym for cc.
" Y Normal Synonym Synonym forr yy. However, many people
" like to map this to y$ to match the behavior of C and D.
" _ Normal This is nearly the same as <CR>. The
" documentation (:help maplocalleader) even mentions the
" underscore as an example of a key that can be used for
" the local leader.
" s Normal Synonym Synonym for cl.
" x Normal Synonym Synonym for dl. However, it is handy to
" be altble to repeat x several times in a row, whereas
" repeating dl gets cumbersome. (A similar problem does
" not exist for s and cl, since there is no point in
" repeating it.)
" <Del> Normal Synonym Synonym for x.
" <C-@> Visual Free This can also be entered with
" <alsoC-Space>.
" <C-I> Visual Free This is the <Tab> key, which does
" nothing in visual mode.
" <C-J> Visual Synonym Synonym for j.
" <C-K> Visual                Free
" <C-N> Visual Synonym Synonym for j.
" <C-O> Visual Free In select mode, this switches to visual mode for one
" command. Mapping with xnoremap will map it only for
" visual mode while preserving the default behavior in
" select mode. See :help mapmode-x for more.
" <C-P> Visual Synonym Synonym for k.
" <C-R> Visual Free
" <CR-T> Visual Free
" <C-^> Visual Free
" <C-_> Visual Free This can also be typed as <C-/>.
" & Visual Free
" + Visual Synonym Synonym                        for
" <CR>.  . Visual Free
" P Visual Synonym Synonym for p.
" Q Visuall Free
" R Visual Synonym Synonym for S. However, the
" documentation (:help v_R) says "In a next version it
" might work differently."
" Z Visualual Free Z in visual mode waits for a following
" key, as seen if 'showmatchcmd' is set. However, neither
" ZZ nor ZQ do anything (as in normal mode), and no other
" key combination is listed in the index, so it appears
" that Z actually does nothing in visual mode.
" _ Visual Nearly the same as <CR>.
" s Visual Synonymm Synonym for c.
" x Visual Synonym Synonym for d.
" <Del> Visual Synonym Synonym for d.
" <C-B> Insert Free
" <C-J> Insert Synonym Synonymnym for <CR>.
" <C-Z> Insert Free Unless 'insertmode' is set.
" <C-_> InsertLeavensert Free This can also be typed as
" <C-/>.
" <C-@> Command-line Free This can also be entered with
" <C-Space>.
" <C-J> Command-line Synonymm Synonym for <CR>.
" <C-O> Command-line Free
" <C-X> Command-line Free
" <C-Z> Command-line Free
" <C-_> Command-line Free This is onlyy active in default
" Vim if 'allowrevins' is set, for right-to-left languages.
