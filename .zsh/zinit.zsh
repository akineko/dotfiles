# Commands -----
#zinit pick'init.sh'; zinit light b4b4r07/enhancd
zinit light mollifier/cd-gitroot
zinit light mollifier/anyframe
zinit light Tarrasch/zsh-bd

# Completions -----
zinit ice wait'!0'; zinit light zsh-users/zsh-completions
zinit ice wait'!0'; zinit ice as'completion'; zinit snippet OMZ::plugins/docker/completions/_docker
zinit ice wait'!0'; zinit ice as'completion'; zinit snippet OMZ::plugins/docker-compose/_docker-compose
zinit ice wait'!0'; zinit light pkulev/zsh-rustup-completion
zinit ice lucid nocompile; zinit load MenkeTechnologies/zsh-cargo-completion

# Utilities -----
#zinit ice pick'async.zsh'; zinit light mafredri/zsh-async
zinit ice wait'!0'; zinit light zdharma/fast-syntax-highlighting
zinit ice wait'!0' atload'_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!0' pick'git-escape-magic'; zinit light knu/zsh-git-escape-magic

# Themes -----
#zinit ice pick'async.zsh' src'pure.zsh'; zinit light sindresorhus/pure
#zinit ice pick'spaceship.zsh'; zinit light denysdovhan/spaceship-prompt
