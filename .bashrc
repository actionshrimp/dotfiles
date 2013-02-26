alias ls="ls -l --color=auto"

alias vim="powershell -File 'D:\\cmd\\powershell\\gvim-shared.ps1'"

tmp=/d/tmp/
scratch=/d/tmp/_scratch.sql

todo=/d/home/dave/workspace/docs/todo.taskpaper

# Prompt
PS1='\[\033]0;$MSYSTEM:\w\007
\033[31m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
$ '

# Ignore .suo from tab completion
FIGNORE=$FIGNORE:.suo

cd ~
