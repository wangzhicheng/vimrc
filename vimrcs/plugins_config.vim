"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important: 
"       This requries that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/.vim_runtime/sources_forked/{}')
call pathogen#infect('~/.vim_runtime/sources_non_forked/{}')
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.\\.git\\*  " Windows
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(\/|\\)\.(git|hg|svn|stack\-work)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated .git .stack-work'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"

" Enabling vim-airline for displaying error information in the status bar 
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']

""""""""""""""""""""""""""""""
" => pymode plugin
""""""""""""""""""""""""""""""
let g:pymode_python = 'python3'

""""""""""""""""""""""""""""""
" => LanguageClient-neovim
""""""""""""""""""""""""""""""
set hidden
if has('win32')
    let g:pylspath = 'D:\Anaconda3\Scripts\pyls.exe'
else
    let g:pylspath = '~/Anaconda3/bin/pyls'
endif

let g:LanguageClient_serverCommands = {
            \ 'haskell': ['hie-wrapper'],
            \ 'python': [pylspath]  
            \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader>lk :call LanguageClient#textDocument_hover()<CR>
nnoremap <Leader>lg :call LanguageClient#textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
nnoremap <Leader>lb :call LanguageClient#textDocument_references()<CR>
nnoremap <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

""""""""""""""""""""""""""""""
" => neco-ghc
""""""""""""""""""""""""""""""
" Disable haskell-vim omnifunc - not disable
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""""""
""""""""""""""  ALE    """""""
""""""""""""""""""""""""""""""

let g:ale_fixers = { 'haskell': ['hlint', 'stylish-haskell']}
let g:ale_linters = {'haskell': ['hlint']}

" Keep the sign gutter open at all times
let g:ale_sign_column_alway = 1

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Disable highlighting
let g:ale_set_highlights = 0

" Navigate between errors quickly
nnoremap <silent><C-k> <Plug>(ale_previous_wrap)
nnoremap <silent><C-j> <Plug>(ale_next_wrap)

" Run linters only when saving files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Use the quickfix instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haskell-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hasekll-ide-engine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use deoplete.
let g:python3_host_prog = '/usr/bin/python3'  " python 3.6, same version vim was built
let g:deoplete#enable_at_startup = 1
