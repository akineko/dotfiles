# Claude Code テンプレート

新規プロジェクト用の Claude Code 設定テンプレート。

## 使い方

```bash
# ベーステンプレートのみ
./claude/init-claude.sh /path/to/project

# 言語別テンプレートを追加（複数指定可）
./claude/init-claude.sh /path/to/project go typescript
```

## テンプレート構成

```
claude/
├── CLAUDE.md          # プロジェクト指示のテンプレート
├── settings.json      # 基本設定
└── rules/
    └── coding-standards.md  # 例: コード規約
```

- `settings.json` と `rules/` 配下のファイルは `.claude/` へコピーされます

## 言語別テンプレート（将来予定）

言語固有のベストプラクティスを追加テンプレートとして提供予定。
`init-claude.sh` に言語を指定すると、ベースに加えて言語別の設定がマージされます。

言語別ディレクトリの構成:
```
go/
├── CLAUDE.md    # ベースの CLAUDE.md に追記される内容
└── rules/       # .claude/rules/ にマージコピーされる
    └── go.md
```
