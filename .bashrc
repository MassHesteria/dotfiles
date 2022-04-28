PATH=/d/MinGW/bin:$PATH
PS1='\[\033]0;$PWD\007\]\n\[\033[35m\]\u@\h \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ '
alias ll='ls -l'
echo "~->|<-~"
#alias gl="git log --pretty=format:'%C(auto)%h %C(blue)%as%C(auto) %<|(34)%an %d %s'"
alias gl="git log --pretty=format:'%C(auto)%h %C(blue)%cd%C(green) %<|(34)%an %C(reset)%C(auto)%d %s' --date=short"

bind '"\t":menu-complete'
