echo
fortune
echo

umask 007

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi

export DISLIN="$HOME/dislin"
export PATH="$PATH:$DISLIN/bin"
export LD_LIBRARY_PATH="$DISLIN:$LD_LIBRARY_PATH"
