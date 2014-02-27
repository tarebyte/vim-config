" Base-16 color scheme
  Bundle 'chriskempson/base16-vim'
    let base16colorspace=256

" Python
  Bundle 'klen/python-mode'

" Vim-Airline
  Bundle 'bling/vim-airline'

" Vim Rag-Tag
  Bundle 'tpope/vim-ragtag'
  let g:ragtag_global_maps = 1

" Distingushed theme
  Bundle 'Lokaltog/vim-distinguished'

" Emmet-Vim
  Bundle "mattn/emmet-vim"
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,eruby EmmetInstall

Bundle 'laurentgoudet/vim-howdoi'
Bundle 'tpope/vim-bundler'

" Easy async RSpec running
Bundle 'thoughtbot/vim-rspec'
Bundle "git://github.com/tpope/vim-dispatch.git"
let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>
