"
" (hatus niwman vimrc)
" -------------------
" hatus.net - hatusn at gmail dot com
"
"______________________ Esquema de Cores
set background=dark
"colorscheme dracula

"______________________ Mapeamentos do Teclado
" numeraçãoo das linhas
imap <F3>	<esc>:set number!<cr>
map <F3>	:set number!<cr>

"add ^I para TAB e $ para fim de linh
imap <F4>	<esc>:set list!<cr>
map <F4>	:set list!<cr>

" <F7> Copiar
imap <F7>	<esc>:w!	~/.tmp<cr>
map <F7>	:w!		~/.tmp<cr>
vmap <F7>	yGo<esc>p:.,$w!	~/.tmp<cr>u``

" <F8> Colar
imap <F8>	<esc>:r		~/.tmp<cr>
map <F8>	:r		~/.tmp<cr>

" <F10> para sair sem salvar
imap <F10>	<esc>:q!<cr>
map <F10>	:q!<cr>

" <F11> para salvar
imap <F11>	<esc>:w<cr>
map <F11>	:w<cr>

" <F12> para sair e salvar
imap <F12>	<esc>:wqa!<cr>
map <F12>	:wqa!<cr>

"______________________ Arquivos de Sintaxe
"au BufNewFIle,BufRead *.txt		set tw=75 ts=8
"au BufNewFile,BufRead *.txt		source ~/.vim/txt.vim
"au BufNewFile,BufRead *README	source ~/.vim/txt.vim
"au BufNewFile,BufRead *NEWS		source ~/.vim/txt.vim

"_____________________ Busca Colorida
hi    Search ctermbg=green ctermfg=black
hi IncSearch ctermbg=black ctermfg=cyan

"_____________________ Opções do Set
"(IncrementedSearch, HighLightedSearch, IgnoreCase, SmartCaSe)
set binary
set noeol
set wildmenu		"enhance command-line completion
set nocompatible	"make vim more useful
set encoding=utf-8 nobomb "use utf-8 without BOM
set is hls ic scs magic	"op��es espertas de busca
set showmatch		"ShowMatch: mostra o par parenteses/chaves recem fechado
set hid			"HIDen: num sei. s� sei q � massa
set aw			"AutoWrite: grava��o automactica a cada altera��o
set ai			"AutoIndent: identa��o autom�tica
"set ts=5		"TabStop: numero de caracteres de avanco TAB
set report=0		"reporta acoes com linhas
set shm=filmnrwxt	"SHortMessages: encurta as msgs do rodape
"set et			"ExpandTab: troca TABs por espa�os
"retab			"converter os TABs j� existentes
set ruler		" mostra a posi��o do cursor, regua
set showcmd		"mostra o comando sendo executado
"set laststatus=2	"mostra N linhas de estado (status)
"set textwidth=80	"quebra de linha
set bs=0		"comportamento do backspace
set nosmartindent	"desligando pois est� padr�o no CL40
"set visualbell		"pisca a tela ao inves de bipar
set wrap		"for�a a quebra de linha
set nojoinspaces	"! coloca 2 espacos apos o . quando usando o gq
"set sw=1		"numero de colunas para o comando > (ShiftWidth) ai
set wildmode=longest,list:full	"para completacao do TAB igual bash
set history=50		" guarda as N linhas do historico da linha de comando
set incsearch		" procura incrementada
"set number		" enumera as linhas
"set list		" mostra onde tem <TAB> (^I) e fim de linha ($)
set backspace=indent,eol,start	"permite backspace cobrir tudo no modo INSERT
set background=dark		"cores no terminal com a sintaxe
set foldmethod=marker
set nobackup 		"nao salva backup

"_____________________ Teclado Numerico - PuTTY
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

"_____________________ ARQUIVOS .sh S�O SEMPRE BASH, E N�O SH
au FileType sh let b:is_bash=1

"______________________ Misc
" Abreviações úteis para sua sanidade mental
cab W w | cab Q! q! | cab Wq wq | cab wQ wq | cab WQ wq | cab Q q

" Mostra os espaços em branco inúteis no final da linha
syn match brancomala '\s\+$' | hi brancomala ctermbg=red

"_____________________ Esconder as tags HTML (pintando de preto)
"map ,hh :syn match preto '<.\{-}>' <cr>:hi preto ctermfg=black ctermbg=blue<cr>

"______________________ Outros
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" somente se o vim foi compilado com suporte a autocommands
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " pula para a ultima posicao do cursor da ultima vez que arbi o arquivo
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Adiciona numero se for um arquivo c/c++
au BufNewFile,BufRead *.cpp,*.cc,*.C,*.H,*.hh,*.hpp,*.c,*.h set number
