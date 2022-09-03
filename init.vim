set mouse=a
set clipboard+=unnamedplus
set splitbelow

let g:nvim_conf_dir = stdpath('config')
if exists('$NVIMCONF')
	let g:nvim_conf_dir = glob("$NVIMCONF")
endif

" Load plugins first
call plug#begin(g:nvim_conf_dir . "/plugged")
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/NERDTree'

	Plug 'jiangmiao/auto-pairs'
	Plug 'dracula/vim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/lsp_extensions.nvim'
	Plug 'nvim-lua/completion-nvim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'cocopon/iceberg.vim'
	Plug 'matze/vim-move'
	Plug 'tpope/vim-surround'
	" Plug 'ctrlpvim/ctrlp.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdcommenter'
	Plug 'sbdchd/neoformat'
  Plug 'nvim-lua/plenary.nvim'
	Plug 'tpope/vim-fugitive'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

let g:nvim_scripts_dir = glob(g:nvim_conf_dir ."/scripts")

let g:initfile = glob(g:nvim_conf_dir."/init.vim")


" Source script files in vim-plug directory
for file in split(glob(g:nvim_scripts_dir."/*.vim"), '\n')
	exe 'source ' file
endfor

" Check if any plugins need to be installed or removed
call PlugInstallAsNeeded()
call PlugUninstallAsNeeded()

" Commands
command! EditInit :exe 'e' g:initfile
command! Reload :exe 'source' g:initfile | echom "Reloaded " . g:initfile
command! CdConfig :call OpenConfigDir()
command! Projects :exe 'NERDTree ' glob("~/GitHub")

" Open a nerdtree and switch to the main buffer on the VimEnter event
autocmd VimEnter * NERDTree | wincmd p
