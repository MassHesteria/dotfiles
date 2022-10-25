# Common configuration

alias ll='ls -l'
echo "~->|<-~"

alias gl="git log --pretty=format:'%C(auto)%h %C(blue)%cd%C(green) %<|(34)%an %C(reset)%C(auto)%d %s' --date=short"
alias gso="git status -uno"
alias gsu="git status"

if [ -t 1 ]; then
bind '"\t":menu-complete'
fi
