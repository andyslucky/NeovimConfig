map  <silent> <leader>t :call OpenTerminal()<Enter>
imap <silent> <leader>t <Esc>:call OpenTerminal()<Enter>
map  <silent> <leader>T :Telescope<CR>
imap <silent> <leader>T <Esc>:Telescope<CR>

" Find anywhere
map <silent> <C-F> :Telescope live_grep<Enter>
imap <silent> <C-F> <Esc>:Telescope live_grep<Enter>

" Switch between tabs with 
imap jj <Esc><Esc>

map <leader>n :NERDTreeToggle<Enter>
map <C-A-l> :Neoformat<CR>
imap <C-A-l> <Esc>:Neoformat<CR>i


" Move selection 
vmap <silent> <C-S-Up> <A-k>
vmap <silent> <C-S-Down> <A-j>
vmap <silent> <C-S-Left> <A-h>
vmap <silent> <C-S-Right> <A-l>

" Window navigation in Normal Mode
nmap <silent> <S-UP> :call MoveUp()<Enter>
nmap <silent> <S-DOWN> :call MoveDown()<Enter>
nmap <silent> <S-LEFT> :call MoveLeft()<Enter>
nmap <silent> <S-RIGHT> :call MoveRight()<Enter>

" Tabs
map  <silent> <A-LEFT> :tabprev<Enter>
imap <silent> <A-LEFT> <Esc>:tabprev<Enter>
map  <silent> <A-RIGHT> :tabnext<Enter>
imap <silent> <A-RIGHT> <Esc>:tabnext<Enter>
" Resize windows in Normal Mode
nnoremap <silent> <C-S-Left> :vertical resize -1<CR>
nnoremap <silent> <C-S-Right> :vertical resize +1<CR>
nnoremap <silent> <C-S-Up> :res +1<CR>
nnoremap <silent> <C-S-Down> :res -1<CR>


function! MoveDown()
  if (winnr('$') > 1)
    execute "normal! \<C-w>j"
  else
    execute "normal! \<S-DOWN>"
  endif
endfunction

function! MoveUp()
  if (winnr('$') > 1)
    execute "normal! \<C-w>k"
  else
    execute "normal! \<S-UP>"
  endif
endfunction

function! MoveLeft()
  if (winnr('$') > 1)
    execute "normal! \<C-w>h"
  else
    execute "normal! \<S-LEFT>"
  endif
endfunction

function! MoveRight()
  if (winnr('$') > 1)
    execute "normal! \<C-w>l"
  else
    execute "normal! \<S-RIGHT>"
  endif
endfunction

map <C-a> ggVG
