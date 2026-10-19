# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

Nix Flakes + Home Manager で管理する個人 dotfiles リポジトリ（x86_64-linux / WSL2）。
パッケージインストールと設定ファイルのシンボリックリンクを `home-manager switch` で一括適用する。

## 必須規則

- 設定ファイルはリポジトリ内を直接編集する（`~/.config/nvim` 等は `mkOutOfStoreSymlink` 経由のシンボリックリンク）
- Nix 式を編集した後は `home-manager switch` で適用確認する
- シェルは zsh がメイン。プラグイン管理は sheldon（`~/.config/sheldon/`）、プロンプトは starship

## アーキテクチャ

### Nix 管理（`nix/` ディレクトリ）

| ファイル | 役割 |
|---|---|
| `flake.nix` | エントリポイント。nixpkgs-unstable + home-manager を入力に取る |
| `home.nix` | Home Manager メイン設定。imports で他モジュールを結合 |
| `packages.nix` | インストールするパッケージ一覧 |
| `dotfiles.nix` | `mkOutOfStoreSymlink` でリポジトリ内ファイルへの直接シンボリックリンクを定義 |
| `shell.nix` | 環境変数（EDITOR, GOPATH 等）と PATH 追加 |

**重要な設計判断**: Nix Store 経由のコピーではなく `mkOutOfStoreSymlink` を使い、設定ファイルの編集を `home-manager switch` なしで即座に反映させている。

### Neovim 設定（`.config/nvim/`）

- `init.lua` がエントリポイント。基本設定 → keymaps → lazy.nvim の順でロード
- プラグイン定義は `lua/lazy-plugins/` 配下に機能別ファイルで分割（lsp, completion, telescope, treesitter 等）

### Nix 管理外ツール

Docker, gcloud, Rust (rustup), 一部 Go ツールは個別の `setup-*.sh` スクリプトで管理。

## 開発コマンド

```bash
# Nix 設定の適用（パッケージ追加・dotfiles リンク変更後）
home-manager switch

# nixpkgs の更新 + 適用
nix flake update --flake ~/.config/home-manager && home-manager switch

# パッケージ検索
nix search nixpkgs <name>

# 初回セットアップ（Nix インストール + Home Manager 適用）
./init.sh

# Nix 管理外ツールのセットアップ
./setup.sh
```

## 新しい設定ファイルを追加する場合

1. リポジトリ内に設定ファイルを配置
2. `nix/dotfiles.nix` にシンボリックリンク定義を追加（`link` ヘルパーを使用）
3. `home-manager switch` で適用
