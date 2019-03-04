zplug "zplug/zplug", hook-build:"zplug --self-manage"

#zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "mollifier/cd-gitroot"
zplug "mollifier/anyframe"
zplug "Tarrasch/zsh-bd"
zplug "knu/zsh-git-escape-magic", use:git-escape-magic

#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

