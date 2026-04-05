# dotfiles

開発環境を管理する dotfiles リポジトリ。

[Nix Flakes](https://nix.dev/concepts/flakes) + [Home Manager](https://github.com/nix-community/home-manager) により、パッケージ管理と dotfiles のシンボリックリンクを一元的に管理する。

## セットアップ

```bash
git clone https://github.com/akineko/dotfiles ~/dev/src/github.com/akineko/dotfiles
cd ~/dev/src/github.com/akineko/dotfiles
./init.sh
./setup.sh
```

- `init.sh`: Nix のインストールと Nix 環境のセットアップ
- `setup.sh`: Nix 管理外のツールのインストール

## 構成

```
nix/
├── flake.nix      # エントリポイント
├── flake.lock     # nixpkgs リビジョンロック
├── home.nix       # Home Manager メイン設定
├── packages.nix   # パッケージ一覧
├── dotfiles.nix   # シンボリックリンク定義（mkOutOfStoreSymlink）
└── shell.nix      # 環境変数・PATH
```

設定ファイルの編集を即座に反映させる為に設定ファイル（`.zshrc`, `.config/nvim/` 等）は Home Manager の `mkOutOfStoreSymlink` で直接シンボリックリンクを作成する。

## 日常の操作

```bash
# パッケージを追加（nix/packages.nix を編集後）
home-manager switch

# 全パッケージを更新
nix flake update --flake ~/.config/home-manager && home-manager switch

# パッケージを検索
nix search nixpkgs <name>

# 世代一覧
home-manager generations

# ガベージコレクション
nix-collect-garbage -d
```

## Nix 管理外のツール

以下は Nix で管理できないため、個別のスクリプトで導入する。

| ツール | スクリプト |
|---|---|
| Docker | `setup-docker.sh` |
| Google Cloud SDK | `setup-gcloud.sh` |
| Rust (rustup) | `setup-rust.sh` |
| Go ツール（nixpkgs 非収録分） | `setup-gotools-minimal.sh` |
| その他 | `setup-legacy.sh` |
