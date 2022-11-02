# Common configuration

alias ll='ls -l'
alias gl="git log --pretty=format:'%C(auto)%h %C(blue)%cd%C(green) %<|(34)%an %C(reset)%C(auto)%d %s' --date=short"
alias gso="git status -uno"
alias gsu="git status"
alias hh="history | grep -v \"^\s\s*[0-9][0-9]*\s\s*\(ls\|ll\|hh\|gso\|gsu\|gl\)\b\""

if [ -t 1 ]; then
bind '"\t":menu-complete'
echo "~->|<-~"
fi
