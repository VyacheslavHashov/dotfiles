export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export TERM=xterm-256color

function lowbr {
    echo 1500 | sudo tee /sys/class/backlight/intel_backlight/brightness
}
