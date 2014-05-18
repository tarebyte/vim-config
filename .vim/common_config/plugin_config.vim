" Plugins are managed by Vundle. Once VIM is open run :BundleInstall to
" install plugins.

" Plugins requiring no additional configuration or keymaps
  Bundle "altercation/vim-colors-solarized"
  Bundle "tpope/vim-cucumber"
  Bundle "tpope/vim-endwise"
  Bundle "tpope/vim-fugitive"
  Bundle "tpope/vim-haml"
  Bundle "vim-scripts/L9"
  Bundle "tpope/vim-rake"
  Bundle "vim-ruby/vim-ruby"
  Bundle "ervandew/supertab"
  Bundle "tomtom/tcomment_vim"
  Bundle "michaeljsmith/vim-indent-object"
  Bundle "kana/vim-textobj-user"
  Bundle "nelstrom/vim-textobj-rubyblock"
  Bundle "tpope/vim-repeat"
  Bundle "vim-scripts/ruby-matchit"
  Bundle "tpope/vim-abolish"
  Bundle 'klen/python-mode'
  Bundle 'bling/vim-airline'
  Bundle 'vim-perl/vim-perl'

" Javascript
Bundle "pangloss/vim-javascript"
au BufNewFile,BufRead *.es6 set filetype=javascript

" CtrlP - with FuzzyFinder compatible keymaps
  Bundle "kien/ctrlp.vim"
    nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
    nnoremap <Leader>t :<C-U>CtrlP<CR>
    nnoremap <Leader>T :<C-U>CtrlPTag<CR>
    let g:ctrlp_prompt_mappings = {
        \ 'PrtSelectMove("j")':   ['<down>'],
        \ 'PrtSelectMove("k")':   ['<up>'],
        \ 'AcceptSelection("h")': ['<c-j>'],
        \ 'AcceptSelection("v")': ['<c-k>', '<RightMouse>'],
        \ }
    " respect the .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Go
  Bundle "jnwhiteh/vim-golang"
    au BufNewFile,BufRead *.go set filetype=go

" Mustache
  Bundle "juvenn/mustache.vim"
    " Copied from the plugin; not sure why it isn't working normally
    au BufNewFile,BufRead *.mustache,*.handlebars,*.hbs set filetype=mustache

" Slim
  Bundle "slim-template/vim-slim"
    au BufNewFile,BufRead *.slim set filetype=slim

" Less
  Bundle "groenewege/vim-less"
    au BufNewFile,BufRead *.less set filetype=less

" Handlebars
  Bundle "nono/vim-handlebars"
    au BufNewFile,BufRead *.hbs set filetype=handlebars

" Stylus
  Bundle "wavded/vim-stylus"
    au BufNewFile,BufRead *.styl set filetype=stylus

" Coffee script
  Bundle "kchmck/vim-coffee-script"
    au BufNewFile,BufRead *.coffee set filetype=coffee

" AG aka The Silver Searcher
  Bundle 'rking/ag.vim'
    nmap g/ :Ag!<space>
    nmap g* :Ag! -w <C-R><C-W><space>
    nmap ga :AgAdd!<space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>
    nmap gq :ccl<CR>
    nmap gl :cwindow<CR>


" Tagbar for navigation by tags using CTags
  Bundle "majutsushi/tagbar"
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>

" Markdown syntax highlighting
  Bundle "tpope/vim-markdown"
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  Bundle "scrooloose/nerdtree"
    let NERDTreeHijackNetrw = 0

    nmap gt :NERDTreeToggle<CR>
    nmap g :NERDTree \| NERDTreeToggle \| NERDTreeFind<CR>


" Tabular for aligning text
  Bundle "godlygeek/tabular"
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" Unimpaired for keymaps for quicky manipulating lines and files
  Bundle "tpope/vim-unimpaired"
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv


" Syntastic for catching syntax errors on save
  Bundle "scrooloose/syntastic"
    let g:syntastic_enable_signs=1
    let g:syntastic_quiet_messages = {'level': 'warning'}
    " syntastic is too slow for haml and sass
    let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': ['haml','scss','sass'] }

" gist-vim for quickly creating gists
  Bundle "mattn/webapi-vim"
  Bundle "mattn/gist-vim"
    if has("mac")
      let g:gist_clip_command = 'pbcopy'
    elseif has("unix")
      let g:gist_clip_command = 'xclip -selection clipboard'
    endif

    let g:gist_detect_filetype = 1
    let g:gist_open_browser_after_post = 1


" gundo for awesome undo tree visualization
  Bundle "sjl/gundo.vim"
    map <Leader>h :GundoToggle<CR>

" rails.vim, nuff' said
  Bundle "tpope/vim-rails"
    map <Leader>oc :Rcontroller<Space>
    map <Leader>ov :Rview<Space>
    map <Leader>om :Rmodel<Space>
    map <Leader>oh :Rhelper<Space>
    map <Leader>oj :Rjavascript<Space>
    map <Leader>os :Rstylesheet<Space>
    map <Leader>oi :Rintegration<Space>

" surround for adding surround 'physics'
  Bundle "tpope/vim-surround"
    " # to surround with ruby string interpolation
    let g:surround_35 = "#{\r}"
    " - to surround with no-output erb tag
    let g:surround_45 = "<% \r %>"
    " = to surround with output erb tag
    let g:surround_61 = "<%= \r %>"

" Clojure Highlighting"
  Bundle 'emezeske/paredit.vim'
  let g:paredit_leader= '\'
  Bundle "tpope/vim-fireplace"
  Bundle "tpope/vim-classpath"
  Bundle "guns/vim-clojure-static"
  Bundle "amdt/vim-niji"
  autocmd BufNewFile,BufRead *.clj set filetype=clojure

" Jade Highlighting"
  Bundle "digitaltoad/vim-jade"
  autocmd BufNewFile,BufRead *.jade set filetype=jade

" Elixir plugin
  Bundle "elixir-lang/vim-elixir"
    au BufNewFile,BufRead *.ex set filetype=elixir
    au BufNewFile,BufRead *.exs set filetype=elixir

" RagTag
Bundle 'tpope/vim-ragtag'
  let g:ragtag_global_maps = 1

" Emmet Plugin
Bundle "mattn/emmet-vim"
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,eruby EmmetInstall

" Easy Motion
Bundle 'Lokaltog/vim-easymotion'
  map <Leader> <Plug>(easymotion-prefix)

" Puppet
Bundle 'rodjek/vim-puppet'
  au BufNewFile,BufRead *.pp set filetype=puppet

