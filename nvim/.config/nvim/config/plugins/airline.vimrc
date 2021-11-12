let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_skip_empty_sections = 1
let g:airline_exclude_preview = 1

let g:airline_powerline_fonts = 1
let g:airline_section_z='%3p%% %4l%:%3v'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme = 'nord'
set noshowmode

