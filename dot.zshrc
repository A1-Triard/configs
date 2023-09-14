HISTFILE=~/.zhistfile
HISTSIZE=2000
SAVEHIST=10000
setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt autocd extendedglob
unsetopt beep nomatch
bindkey -v
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[3;5~" delete-word

PROMPT='[%n@%m %1~]%# '

export VISUAL='DISPLAY=:0 nvim'

alias bat='bat -p'
alias bc='bc -lq'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color'
alias vi="$VISUAL"

echo__() {
    printf "%s\n" "$1"
}

o() {
    mkdir -p -- "$HOME"/.xdg-open || exit 1
    stderr="$(mktemp -- "$HOME"/.xdg-open/stderr.XXXXXXXXXX)"
    for file in "$@"; do
        echo__ "$file" > "$stderr" || exit 1
    done
    echo "----------------------------------------" >> "$stderr" || exit 1
    file="$(realpath -s "$1")"
    (xdg-open "$file" 2>>"$stderr" &)
}

n() {
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    export NNN_PLUG='i:xdgdefault'

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

if [ "$TERM" = "xterm-256color" ]; then
    echo -en "\033]0;Terminal\a"
fi
