"" ״̬������״̬
let statusHead ="%-.50f\ %h%m%r"
let statusBreakPoint ="%<"
let statusSeparator ="|"
let statusFileType ="%{((&ft\ ==\ \"help\"\ \|\|\ &ft\ ==\ \"\")?\"\":\"[\".&ft.\"]\")}"
let statusFileFormat ="[%{(&ff\ ==\ \"unix\")?\"u\":\"d\"}]"
let statusAscii ="\{%b:0x%B\}"
let statusCwd ="%-.50{getcwd()}"
let statusBody =statusFileType.statusFileFormat.statusSeparator.statusAscii.statusSeparator."\ ".statusBreakPoint.statusCwd
let statusEncoding ="[%{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]"
let statusBlank ="%="
let statusKeymap ="%k"
let statusRuler ="%-12.(%lL,%c%VC%)\ %P"
let statusTime ="%{strftime(\"%y-%m-%d\",getftime(expand(\"%\")))}"
let statusEnd=statusKeymap."\ ".statusEncoding.statusRuler."\ ".statusTime
"" ����״̬����ģʽ�ַ���
let statusString=statusHead.statusBody.statusBlank.statusEnd
set statusline=%!statusString 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
 
" input mode completion
inoremap ^] ^X^]    " complete from tags
inoremap ^F ^X^F    " complete filename
inoremap ^D ^X^D    " complete definition or macros
inoremap ^L ^X^L    " complete line

augroup filetypedetect
    au! BufRead,BufNewFile *.frm,*.bas,*.vb setfiletype vb
    au BufNewFile,BufRead *.wgetrc,wgetrc  setf wget
augroup end

" ��windows�µı�������
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���console�������
language message zh_CN.utf-8


" uppercase the WORD just before the cursor

imap <c-u> <esc>gUiWea
iabbrev @@ wangzhicheng.thu@gmail.com
iabbrev ccopy Copyright 2014 WANG Zhicheng, all rights reserved.

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 02/08/15 08:57:51
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_auto_select = 1
