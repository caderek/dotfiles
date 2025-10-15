# fnm
set PATH $PATH $HOME/.local/share/fnm/
set PATH $PATH $HOME/.local/bin/
set PATH $PATH /usr/local/go/bin
set PATH $PATH $HOME/Other/pypy3.10-v7.3.17-linux64/bin/
#set PATH $PATH $HOME/Other/zig
#set PATH $PATH $HOME/Other/lua/src
set PATH $PATH $HOME/Other
set PATH $PATH $HOME/.cargo/bin
#set PATH $PATH $HOME/.tmux/plugins/tmuxifier/bin
set PATH $PATH $HOME/Other/nvim-linux64/bin/
#set PATH $PATH $HOME/.luarocks/bin/
set VISUAL nvim
set EDITOR nvim
set SUDO_EDITOR /home/caderek/Other/nvim-linux64/bin/nvim
set MICRO_TRUECOLOR 1
fnm env | source
fnm use default >/dev/null
set fish_greeting

# aliases
alias disk-usage ncdu
alias c clear
alias ta="tmux attach"
alias vim="nvim --clean"

# keybindings
bind \cf 'clear; commandline -f repaint'

# Remap keys
setxkbmap -option
setxkbmap -option ctrl:nocaps
setxkbmap -option shift:both_capslock
xmodmap -e "keycode 94 = Shift_L NoSymbol Shift_L"
xmodmap -e "keycode 91 = period period period"


# opam configuration
source /home/caderek/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" >/dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
