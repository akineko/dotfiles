{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # ===== エディタ =====
    neovim
    vim

    # ===== シェル・ターミナル =====
    zsh
    tmux
    zellij
    starship
    sheldon          # zsh プラグインマネージャ
    fzf
    peco
    carapace         # シェル補完

    # ===== ファイル操作・検索 =====
    ripgrep
    bat              # cat 代替
    eza              # ls 代替
    lsd              # ls 代替
    fd               # find 代替
    fselect          # SQL-like ファイル検索
    procs            # ps 代替
    zoxide           # cd 代替
    yazi             # ファイルマネージャ

    # ===== Git 関連 =====
    git
    tig
    gh               # GitHub CLI
    lazygit
    gitui
    gibo             # .gitignore テンプレート

    # ===== ビルドツール =====
    gcc
    gnumake
    cmake
    meson
    ninja

    # ===== 言語ランタイム =====
    nodejs_22
    deno
    bun
    go
    ruby
    python3
    lua

    # ===== 言語ツール =====
    uv               # Python パッケージマネージャ
    terraform        # IaC
    mise             # プロジェクト毎のバージョン管理に継続利用

    # ===== ユーティリティ =====
    jq
    ghq              # リポジトリ管理
    direnv
    curl
    unzip
    litestream       # SQLite ストリーミングレプリケーション
    tree-sitter

    # ===== Go 開発ツール =====
    gopls
    delve
    go-tools         # staticcheck 等
  ];
}
