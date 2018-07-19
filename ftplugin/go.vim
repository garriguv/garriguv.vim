" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" build, run, test, coverage and gocs
nmap <Leader>r <Plug>(go-run)
nmap <Leader>b :<C-u>call <SID>build_go_files()<CR>
nmap <Leader>t <Plug>(go-test)
nmap <Leader>T <Plug>(go-test-func)
nmap <Leader>c <Plug>(go-coverage-toggle)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>h :GoSameIdsToggle<CR>
nmap <Leader>god <Plug>(go-doc)
nmap <Leader>goh <Plug>(go-doc-browser)
nmap <Leader>l <Plug>(go-metalinter)

" open alternate files
command! -bang A call go#alternate#Switch(<bang>0, 'edit')
command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
command! -bang AS call go#alternate#Switch(<bang>0, 'split')
command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" :GoDef improvements
let g:go_def_reuse_buffer = 1
nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)

" run goimports on save
let g:go_fmt_command = "goimports"
