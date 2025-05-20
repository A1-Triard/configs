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
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'

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

if [ "$TERM" = "xterm-256color" ]; then
    echo -en "\033]0;Terminal\a"
fi
