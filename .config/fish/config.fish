# fnm
set PATH $PATH /home/caderek/.fnm
set PATH $PATH /usr/local/go/bin
set PATH $PATH /home/caderek/Other/zig
set PATH $PATH /home/caderek/Other/lua/src
set PATH $PATH /home/caderek/Other
set PATH $PATH /home/caderek/.cargo/bin
set EDITOR nvim
fnm env | source
fnm use default >/dev/null
set fish_greeting
alias disk-usage ncdu

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# lapce
set PATH $PATH /home/caderek/Other/Lapce

# Remap keys to have Esc intead os CapsLock and Shilt instead of key 94
setxkbmap -option
setxkbmap -option caps:escape
xmodmap -e "keycode 94 = Shift_L NoSymbol Shift_L"
xmodmap -e "keycode 91 = period period period"
