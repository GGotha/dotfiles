export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Plugins and Configurations
plugins=( 
    zsh-autosuggestions
    git
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# Aliases
alias intellij="sh /home/gotha/intellij/bin/idea.sh"

# Enviroment Variables
export M2_HOME=/home/gotha/apache-maven-3.8.4
export PATH=${M2_HOME}/bin:${PATH}
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
