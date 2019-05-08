" Relative number
set relativenumber
set number

" Enable autocompletion
set wildmode=longest,list,full

" Split open at the bottom and right
set splitright splitbelow 

" input mode completion
inoremap ^] ^X^]    " complete from tags
inoremap ^F ^X^F    " complete filename
inoremap ^D ^X^D    " complete definition or macros
inoremap ^L ^X^L    " complete line

augroup filetypedetect
    au! BufRead,BufNewFile *.frm,*.bas,*.vb setfiletype vb
    au BufNewFile,BufRead *.wgetrc,wgetrc  setf wget
augroup end

" 在windows下的编码设置
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

" uppercase the WORD just before the cursor
imap <c-u> <esc>gUiWea
iabbrev @@ wangzhicheng.thu@gmail.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cucumbertables.vim
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1     " l means left align; 1 means one space of padding.
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" fuzzy deep directory search
set path+=**

set complete+=kspell
