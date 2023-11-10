#  File:   ~/.zshrc
#  Author: Cayden Lund (cayden.lund@utah.edu)
#  Brief:  Contains zsh configuration.
#  Date:   30 October 2023
#
#  Copyright (c) 2023 by Cayden Lund.


#  ================================================
#  ||  Initial setup from the built-in utility:  ||
#  ================================================

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/cayden/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e


#  ============================
#  ||  Other zsh functions:  ||
#  ============================

bindkey "^[[3~" delete-char


#  ==============================
#  ||  Environment variables:  ||
#  ==============================

#  Configure the default editor.
export EDITOR=nvim
export VISUAL=nvim

#  Add the GPG signing key.
export GPG_TTY=$(tty)

#  Set `HOSTNAME` to be the same as Bash.
export HOSTNAME=$HOST

#  Configure $PATH.
PATH=$PATH:~/.local/bin
PATH=$PATH:~/.local/share/JetBrains/Toolbox/scripts

#  Prompt configuration.
#  Common options:
#    - `%M`/`%m` - The full/abbreviated machine hostname.
#    - `%n`      - The currently-logged-in user.
# 
#    - `%d`/`%/` - The current working directory.
#                  If a number follows the `%`, it specifies the number
#                  of trailing components to show.
#                  A negative number specifies leading components.
#    - `%~`      - As above, but if the current working directory starts
#                  with $HOME, that part is replaced by a `~`.
# 
#    - `%D`      - The date in yy-mm-dd format.
#                  Note that more formats are supported with the
#                  `%D{...}` syntax.
#                  See the following page for details:
#                  https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
#    - `%T`/`%t` - The time in 24/12-hour format.
#    - `%*`      - The time in 24-hour format, with seconds.
#    - `%w`      - The date in day-dd format.
#    - `%W`      - The date in mm/dd/yy format.
# 
#    - `%B`/`%b` - Start/stop boldface mode.
#    - `%U`/`%u` - Start/stop underline mode.
#    - `%S`/`%s` - Start/stop standout mode.
#    - `%F{...}`
#      `%f`      - Start/stop foreground color mode.
#    - `%K{...}`
#      `%k`      - Start/stop background color mode.
#    - %{...%}   - Include a string as a literal escape sequence.
# 
#    - %(condition.TRUE.FALSE)
#                - Given a condition, selects the TRUE text or the FALSE
#                  text.
#                  Conditions (n defaults to 0):
#                    - `!`   - True if the shell is running with privileges.
#                    - n`#`  - True if the effective uid of the process is
#                              n.
#                    - n`?`  - True if the exit status of the last command
#                              was n.
#                    - n`C`
#                      n`/`  - True if the current absolute path has
#                              at least n elements relative to the root
#                              directory.
#                    - n`c`
#                      n`.`
#                      n`~`  - True if the current absolute path has
#                              at least n elements with path replacement.
#
#  user@machine:~/a/b/c$
PROMPT="%B%(!.%F{red}.%F{green})%n@%M%f:%F{blue}%3~%f%(!.#.$)%b "


#  ================
#  ||  Aliases:  ||
#  ================

#  Always use Emacs in console mode.
alias emacs="emacs -nw"

#  Always use Neovim.
alias vim="nvim"

#  Download a video from YouTube and extract the audio as an MP3.
alias get-mus="yt-dlp -x --audio-format mp3 -o '%(title)s.%(ext)s'"

#  Copy to clipboard.
alias clip="xclip -sel clip"

#  Mount the "OneDrive" rclone at "~/OneDrive".
alias mount-onedrive="rclone --vfs-cache-mode writes mount OneDrive: ~/OneDrive"

#  Convert a PowerPoint presentation to PDF slides.
alias pptx-to-pdf="soffice --headless --convert-to pdf"

#  Dotfile configuration alias.
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'


#  =========================
#  ||  Startup commands:  ||
#  =========================

    #  Create or attach to zellij instance `main`:
if [[ -z "$ZELLIJ" ]]; then zellij attach main || zellij -s main; fi

