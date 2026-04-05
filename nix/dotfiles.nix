{ config, dotfilesDir, tpm, ... }:

let
  # ヘルパー: dotfiles 内のパスへの直接シンボリックリンクを作成
  link = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${path}";
in {

  # ===== ホームディレクトリ直下の dotfiles =====
  home.file = {
    ".vimrc".source         = link ".vimrc";
    ".gvimrc".source        = link ".gvimrc";
    ".zshrc".source         = link ".zshrc";
    ".zshenv".source        = link ".zshenv";
    ".zsh".source           = link ".zsh";
    ".tmux.conf".source     = link ".tmux.conf";
    ".gitconfig".source     = link ".gitconfig";
    ".tigrc".source         = link ".tigrc";
    ".hgrc".source          = link ".hgrc";
    ".gdbinit".source       = link ".gdbinit";
    ".bashrc".source        = link ".bashrc";
    "bin".source            = link "bin";

    # Vim ディレクトリ
    ".vim".source           = link ".vim";

    ".tmux/plugins/tpm".source = tpm;

    # Claude
    ".claude/CLAUDE.md".source            = link ".claude/CLAUDE.md";
    ".claude/settings.json".source        = link ".claude/settings.json";
    ".claude/.mcp.json".source            = link ".claude/.mcp.json";
    ".claude/statusline-command.sh".source = link ".claude/statusline-command.sh";
  };

  # ===== XDG Config ディレクトリ =====
  xdg.configFile = {
    "nvim".source           = link ".config/nvim";
    "git".source            = link ".config/git";
    "gitui".source          = link ".config/gitui";
    "zsh".source            = link ".config/zsh";
    "sheldon".source        = link ".config/sheldon";
    "starship.toml".source  = link ".config/starship.toml";

    # Fish shell
    "fish/config.fish".source             = link ".config/fish/config.fish";
    "fish/fishfile".source                = link ".config/fish/fishfile";
    "fish/conf.d/000-env.fish".source     = link ".config/fish/conf.d/000-env.fish";
    "fish/functions/fish_prompt.fish".source = link ".config/fish/functions/fish_prompt.fish";
  };
}
