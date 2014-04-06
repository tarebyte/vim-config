Bundle 'klen/python-mode'
Bundle 'bling/vim-airline'
Bundle 'laurentgoudet/vim-howdoi'
Bundle 'tpope/vim-bundler'
Bundle 'thoughtbot/vim-rspec'
Bundle 'vim-perl/vim-perl'
Bundle 'Lokaltog/vim-distinguished'

Bundle 'chriskempson/base16-vim'
  let base16colorspace=256

Bundle 'tpope/vim-ragtag'
  let g:ragtag_global_maps = 1

Bundle "mattn/emmet-vim"
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,eruby EmmetInstall

Bundle "tpope/vim-dispatch.git"
  let g:rspec_command = "Dispatch rspec --format=progress --no-profile {spec}"
  nmap <Leader>rc :wa<CR> :call RunCurrentSpecFile()<CR>
  nmap <Leader>rn :wa<CR> :call RunNearestSpec()<CR>
  nmap <Leader>rl :wa<CR> :call RunLastSpec()<CR>
  nmap <Leader>ra :wa<CR> :call RunAllSpecs()<CR>

Bundle 'Lokaltog/vim-easymotion'
  map <Leader> <Plug>(easymotion-prefix)

Bundle 'rodjek/vim-puppet'
  au BufNewFile,BufRead *.pp set filetype=puppet

