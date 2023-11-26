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
alias disk-usage ncdu

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# lapce
set PATH $PATH /home/caderek/Other/Lapce

# Remap keys
setxkbmap -option # Defaults
setxkbmap -option ctrl:nocaps # CapsLook as Ctrl
xcape -e 'Control_L=Escape' # When tapped Capslock (ctrl) is Escape
xmodmap -e "keycode 94 = Shift_L NoSymbol Shift_L" # Shift instead of addiional symbols
xmodmap -e "keycode 91 = period period period" # Dot instead of comma for numbers
