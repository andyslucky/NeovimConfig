" Configure theme
if (has("termguicolors"))
	set termguicolors
endif
set number
set nowrap
syntax enable
colorscheme dracula
set autoindent smartindent
" Disable neovide cursor annimation
let g:neovide_cursor_animation_length=0.05
" Configure light line
let g:lightline = {
\  'colorscheme': 'default',
\  'active': {
\    'left': [['mode','gitbranch'],[ 'filename']],
\		 'right': [['datetime'], ['lineinfo']]
\  },
\	 'inactive': {
\    'left': [['filename']],
\		 'right':[]
\  },
\	 'component_function': {
\    'gitbranch':'FugitiveHead'
\  },
\  'component': {
\    'datetime': '%{strftime("%a %b %d %H:%M")}'
\  },
\}
