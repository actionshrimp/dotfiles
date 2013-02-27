alias ls="ls -l --color=auto"

alias vim="powershell -File 'D:\\cmd\\powershell\\gvim-shared.ps1'"

tmp=/d/tmp/
scratch=/d/tmp/_scratch.sql

todo=/d/home/dave/workspace/docs/todo.taskpaper

# Prompt
PS1='\[\033]0;$MSYSTEM:\w\007
\033[31m\]\u@\h \[\033[33m\w$(__git_ps1)\033[0m\]
$ '

# Horrible tree implementation - my bash skills are severely lacking
tree()
{
    echo
    local directory=
    if [[ "${1:0:1}" != "-" ]]
    then #positional argument
        directory="$1"
        shift;
    fi

    local depth=
    #Get depth from long form arg --depth=5
    if [[ "${1:0:8}" == "--depth=" ]]
    then
        depth=${1:8}
    fi

    #Get depth from short form arg -d 5
    if [[ $1 = -d ]]
    then
        depth=$2
    fi

    if [[ "$depth" != "" ]]
    then
        if [[ "$directory" != "" ]]
        then
            find $directory -maxdepth $depth -type d ! -path '*.svn*' | sed -e 's/[^-][^\/]*\//--/g' -e 's/\/\([^\/]*\)$/--\1/' -e 's/^/\|/'
        else
            find -maxdepth $depth -type d ! -path '*.svn*' | sed -e 's/[^-][^\/]*\//--/g' -e 's/\/\([^\/]*\)$/--\1/' -e 's/^/\|/'
        fi
    else
        if [[ "$directory" != "" ]]
        then
            find $directory -type d ! -path '*.svn*' | sed -e 's/[^-][^\/]*\//--/g' -e 's/\/\([^\/]*\)$/--\1/' -e 's/^/\|/'
        else
            find -type d ! -path '*.svn*' | sed -e 's/[^-][^\/]*\//--/g' -e 's/\/\([^\/]*\)$/--\1/' -e 's/^/\|/'
        fi
    fi

    if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
       then echo "   -> no sub-directories"
       fi
    echo
}


# Ignore .suo from tab completion
FIGNORE=$FIGNORE:.suo

set -o vi

cd ~
