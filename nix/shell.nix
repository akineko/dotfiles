{ config, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    SVN_EDITOR = "nvim";
    GOPATH = "$HOME/dev";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/dev/bin"        # GOPATH/bin
    "$HOME/.cargo/bin"
  ];
}
