let g:coc_global_extensions = [
    \'coc-flutter',
    \'coc-json',
    \'coc-pyright',
    \'coc-lua',
    \'coc-highlight',
    \'coc-git',
    \'coc-yaml',
    \'coc-flutter-tools',
    \'coc-snippets',
    \]

nmap <leader> gd <Plug>(coc-definition)
nmap <leader> gg <Plug>(coc-type-definition)
nmap <leader> gi <Plug>(coc-implementation)
nmap <leader> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <leader> gk :call <SID>show_documentation()<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" coc-snippets-expand
imap <leader><tab> <Plug>(coc-snippets-expand)
