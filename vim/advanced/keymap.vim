" Basic motions by easymotion
map R <Plug>(edgemotion-k)
map T <Plug>(edgemotion-j)
map ? <Plug>(easymotion-overwin-f2)
map l <Plug>(easymotion-bd-fl)
map * <Plug>(asterisk-z*)
map # <Plug>(asterisk-z#)

" Sandwich operations
map ;a <Plug>(operator-sandwich-add)
map ;d <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
map ;e <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
map ;c <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
map ;r <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)

" Tagbar
nnoremap <C-t> :TagbarOpen fj<CR>

" Close buffer without collapse window layout
nnoremap <silent> v :Sayonara!<CR>

" QuickRun (can be overwritten)
nnoremap ,r :QuickRun<CR>
nnoremap ,a :QuickRun -args 

" NeoSnippet
imap <expr><TAB>
			\ pumvisible() ? "\<C-n>" :
			\ neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Fzf
function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! -bang -nargs=* GPt
			\ call fzf#vim#grep(
			\		'pt --column --hidden '.shellescape(<q-args>), 1,
			\		fzf#vim#with_preview({ 'dir': s:find_git_root() }),
			\		<bang>0)

command! -bang -nargs=* Pt
			\ call fzf#vim#grep(
			\		'pt --column --hidden '.shellescape(<q-args>), 1,
			\		fzf#vim#with_preview({ 'dir': './' }),
			\		<bang>0)

nnoremap <Space><Space> :<C-u>GFiles<CR>
nnoremap <Space>c :<C-u>Files<CR>
nnoremap <Space>s :GPt 
nnoremap <Space>t :Pt 
nnoremap <Space>h :<C-u>History<CR>
nnoremap <Space>b :<C-u>Buffers<CR>

" JunkFile
nnoremap ,j :JunkfileOpen 

" Git operations
nnoremap gs :<C-u>Gstatus<CR>

" Vaffle
nnoremap <Space>l :<C-u>Vaffle<CR>

" Vaffle
augroup vimrc_vaffle
	autocmd!
	au FileType vaffle nnoremap <buffer> . /
	au FileType vaffle nmap <buffer> ~ <Plug>(vaffle-open-home)
	au FileType vaffle nmap <buffer> h <Plug>(vaffle-open-parent)
	au FileType vaffle nmap <buffer> s <Plug>(vaffle-open-current)
	au FileType vaffle nmap <buffer> a <Plug>(vaffle-toggle-all)
	au FileType vaffle nmap <buffer> <Space> <Plug>(vaffle-toggle-current)
	au FileType vaffle vmap <buffer> <Space> <Plug>(vaffle-toggle-current)

	au FileType vaffle nmap <buffer> <CR> <Plug>(vaffle-open-selected)
	au FileType vaffle nmap <buffer> e <Plug>(vaffle-move-selected)
	au FileType vaffle nmap <buffer> d <Plug>(vaffle-delete-selected)
	au FileType vaffle nmap <buffer> n <Plug>(vaffle-rename-selected)
	au FileType vaffle nmap <buffer> q <Plug>(vaffle-quit)
	au FileType vaffle nmap <buffer> o <Plug>(vaffle-mkdir)
	au FileType vaffle nmap <buffer> i <Plug>(vaffle-new-file)
	au FileType vaffle nmap <buffer> R <Plug>(vaffle-refresh)
	au FileType vaffle nmap <buffer> x <Plug>(vaffle-fill-cmdline)
augroup END

" ============================================================
"  FileTypeごとの設定
" ============================================================
" emmet
augroup emmet
	au!
	au FileType html,css,xml imap <S-Tab> <C-y>,<CR><CR><Up>
	au FileType html,css,xml imap <C-f> <C-y>,
augroup END

" golang
augroup go
	au!
	au FileType go nmap ,i <Plug>(go-alternate-edit)
	au FileType go nmap ,r <Plug>(go-run)
	au FileType go nmap ,b <Plug>(go-build)
	au FileType go nmap ,h :LspHover<CR>
	au FileType go nmap ,H :GoDescribe<CR>
	au FileType go nmap ,t <Plug>(go-test)
	au FileType go nmap ,l :GoDecls<CR>
	au FileType go nmap ,L :GoDeclsDir<CR>
	au FileType go nmap ,d :LspDefinition<CR>
	au FileType go nmap ,D :LspTypeDefinition<CR>
	" au FileType go nmap ,D <Plug>(go-def-pop)
	au FileType go nmap ,f :LspReferences<CR>
augroup END

" typescript
augroup typescript
	au!
	au FileType typescript nmap ,f <Plug>(TsuquyomiReferences)
	au FileType typescript nmap ,q :<C-u>TsuquyomiGeterr<CR>
	au FileType typescript nmap ,d <Plug>(TsuquyomiDefinition)
	au FileType typescript nmap ,D <Plug>(TsuquyomiGoBack)
augroup END
