# Commands -----
#zplugin pick'init.sh'; zplugin light b4b4r07/enhancd
zplugin light mollifier/cd-gitroot
zplugin light mollifier/anyframe
zplugin light Tarrasch/zsh-bd

# Completions -----
zplugin ice wait'!0'; zplugin light zsh-users/zsh-completions
zplugin ice wait'!0'; zplugin ice as'completion'; zplugin snippet OMZ::plugins/docker/_docker
zplugin ice wait'!0'; zplugin ice as'completion'; zplugin snippet OMZ::plugins/docker-compose/_docker-compose

# Utilities -----
#zplugin ice pick'async.zsh'; zplugin light mafredri/zsh-async
zplugin ice wait'!0'; zplugin light zdharma/fast-syntax-highlighting
zplugin ice wait'!0' atload'_zsh_autosuggest_start'; zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait'!0' pick'git-escape-magic'; zplugin light knu/zsh-git-escape-magic

# Themes -----
#zplugin ice pick'async.zsh' src'pure.zsh'; zplugin light sindresorhus/pure
#zplugin ice pick'spaceship.zsh'; zplugin light denysdovhan/spaceship-prompt

