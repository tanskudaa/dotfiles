" Vim configuration
"------------------------------------------------------------
" Theme
"colorscheme wal
"set background=light

" Set enconding to UTF-8 by default.
set encoding=utf-8
set fileencoding=utf-8

" Split new windows under and right of current window
set splitbelow
set splitright

" Enable code folding
" Plugin "SimplyFold" is recommended for proper folding.
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. Heavily edited by tanskudaa for readability and configurations.
"
"------------------------------------------------------------
" These options and commands enable some very useful features in Vim, that no user should have to live without.
"
" Set 'nocompatible' to ward off unexpected things that your distro might have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its contents. 
filetype indent plugin on

" Enable syntax highlighting
syntax on

" I like highlighting strings inside C comments. Revert with ":unlet c_comment_strings".
let c_comment_strings=1


"------------------------------------------------------------
" These are highly recommended options.
"
" Vim with default settings does not allow easy switching between multiple files in the same editor window.
" It's best to enable an option to allow easier switching between files.
" One such option is the 'hidden' option, which allows you to re-use the same window and switch from an unsaved buffer without saving it first.
set hidden

" Note that not everyone likes working with the hidden option. Alternatives include using tabs or split windows instead of
" re-using the same window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
 
" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd
 
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the mapping of <C-L> below)
set hlsearch
 
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
 

"------------------------------------------------------------
" These are options that users frequently set in their .vimrc. Which, if any, of these options to use is very much a personal preference, but they are harmless.
" 
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
" When opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
 
" Stop certain movements from always going to the first character of a line.
set nostartofline
 
" Display the cursor position on the last line of the screen or in the status line of a window
set ruler
set colorcolumn=80,120
 
" Always display the status line, even if only one window is displayed
set laststatus=2
 
" Instead of failing a command because of unsaved changes, instead raise a dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell
 
" ...and reset the terminal code for the visual bell.
" If visualbell is set, and this line is also included, vim will neither flash nor beep.
" If visualbell is unset, this does nothing.
set t_vb=
 
" Enable use of the mouse for all modes
set mouse=a
 
" Set the command window height to 2 lines, to avoid many cases of having to "press <Enter> to continue".
set cmdheight=2
 
" Display line numbers on the left
set number
set relativenumber
 
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
 
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
 
 
"------------------------------------------------------------
" Indentation settings according to personal preference.
"
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
" softtabstop for erasing tabs on backspace, tabstop for erasing spaces
set softtabstop=4
set shiftwidth=4
set expandtab
 
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
 
 
"------------------------------------------------------------
" Useful mappings
"
" Example
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
" map Y y$
 
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
 
"------------------------------------------------------------
" Additional

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=25

" Convenient command to see the difference between the current buffer and the file it was loaded from, thus the changes you made.
" Only define it when not defined already. Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72, 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting. Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with: ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler (happens when dropping a file on gvim) and
    " for a commit message (it's likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif



" Full 24-bit colors
"------------------------------------------------------------
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors

" Use terminal colors
"------------------------------------------------------------
set t_Co=16
colorscheme elflord

"------------------------------------------------------------
" File specific configuration
"
" Python source code files
au BufNewFile,BufRead *.py
  \ set tabstop=4 
  \ softtabstop=4 
  \ shiftwidth=4 
  \ expandtab 
  \ textwidth=79 

" For proper Python auto-indentation, plugin "indetpython.vim" is recommended.

" Flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

