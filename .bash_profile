export CLICOLOR=1 

##
# Your previous /Users/grandzhuo/.bash_profile file was backed up as /Users/grandzhuo/.bash_profile.macports-saved_2017-03-27_at_22:58:54
##

# MacPorts Installer addition on 2017-03-27_at_22:58:54: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

eval $(/usr/libexec/path_helper -s)

if [ -f ~/.git-completion.bash ]; then 
. ~/.git-completion.bash 
fi

#PS1='\[\e[1m\]▄█▀█● \w \t \$\[\e[0m\] '
PS1='\[\e[1m\]▄█▀█● \w \$\[\e[0m\] '

# 启动时调用archey显示系统信息
#archey

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval $(thefuck --alias fk)
#alias fuck='eval $(thefuck $(fc -ln -1)); history -r'

#PATH=.:$PATH

alias la="ls -a"
alias ll="ls -l"
alias tm="tmux"
alias py="python3"
alias vi="vim --noplugin"
