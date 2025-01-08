" Kaelan's .vimrc
" -----------------------------------------------------------------------------
set nocompatible " Do not prederve compatibility with Vi.
set modifiable   " Ensure buffer contents can be modified.
set autoread     " Update buffer if file had been modified externally.

" Enabiling filetype support provices filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on

syntax on " Enable sytax highlighting.
colorscheme retrobox " Set colorscheme to vim default retrobox scheme.
set background=dark  " Sets colorscheme to darkmode

" `matchit.vim` is built in, enable it to allow for jumping
" to next match with `%`. ie jump from `if` to `else with `%`
runtime macros/matchit.vim

" Various Settings
set number relativenumber      " Show line numbers and current line number.
set showmatch                  " Show matching part of `{}`, `[]`, and `()`.
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Enables intuitive backspace behaviour.
set ruler                      " Shows current cursor pos on bottom right.

set wrap                       " Wraps text after max width is reached.
set breakindent                " Keeps wrapped lines at same indentation level.

set scrolloff=15               " Scroll page vertically.
set sidescrolloff=15           " Scroll page horizontally.

set splitbelow                 " Horizontal splits always open on the bottom.
set splitright                 " Vertical splits always open to the right.

set hidden                     " Allow for unsaved open buffers.

set hlsearch                   " Enable highlighted search pattern.
set incsearch                  " Highlight dynamically as patterned is typed.
set ignorecase                 " Ignore case of search strings.

" Sets number of spaces used for a line indent
set tabstop=4 shiftwidth=4 expandtab smarttab

" Enable auto completion menu after pressing `Tab`
set wildmenu

" Show what mode you are curently editing in
set showmode

" Shows partial commands in the last line of screen.
set showcmd

" Status Line Config (Work In Progress)
" -----------------------------------------------------------------------------
set laststatus=2 " Show the statusline 

function! GitBranch()

  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")

endfunction



function! StatuslineGit()

  let l:branchname = GitBranch()

  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''

endfunction



set statusline=

set statusline+=%#PmenuSel#

set statusline+=%{StatuslineGit()}

set statusline+=%#LineNr#

set statusline+=\ %f

set statusline+=%m\

set statusline+=%=

set statusline+=%#CursorColumn#

set statusline+=\ %y

set statusline+=\ %{&fileencoding?&fileencoding:&encoding}

set statusline+=\[%{&fileformat}\]

set statusline+=\ %p%%

set statusline+=\ %l:%c

set statusline+=\
