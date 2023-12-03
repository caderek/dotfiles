# fnm
set PATH $PATH /home/caderek/.fnm
set PATH $PATH /usr/local/go/bin
set PATH $PATH /home/caderek/Other/zig
set PATH $PATH /home/caderek/Other/lua/src
set PATH $PATH /home/caderek/Other
set PATH $PATH /home/caderek/.cargo/bin
set EDITOR nvim
set MICRO_TRUECOLOR 1
fnm env | source
fnm use default >/dev/null
set fish_greeting

# aliases
alias disk-usage ncdu
alias c clear
alias ta="tmux attach"

# keybindings
bind \cf 'clear; commandline -f repaint'

# Remap keys
setxkbmap -option # Defaults
setxkbmap -option ctrl:nocaps # CapsLook as Ctrl
setxkbmap -option shift:both_capslock
xmodmap -e "keycode 94 = Shift_L NoSymbol Shift_L" # Shift instead of addiional symbols
xmodmap -e "keycode 91 = period period period" # Dot instead of comma for numbers
