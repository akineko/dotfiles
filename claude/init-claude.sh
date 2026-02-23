#!/bin/bash
set -Ceu

abspath=$(cd "$(dirname "$0")" && pwd)

usage() {
  echo "Usage: $0 <target-dir> [lang1] [lang2] ..."
  echo ""
  echo "Examples:"
  echo "  $0 /path/to/project"
  echo "  $0 /path/to/project go"
  echo "  $0 /path/to/project go typescript"
  exit 1
}

if [ $# -lt 1 ]; then
  usage
fi

target="$1"
shift
langs=("$@")

# 言語ディレクトリの存在チェック（コピー前にすべて検証）
for lang in "${langs[@]}"; do
  if [ ! -d "$abspath/$lang" ]; then
    echo "Error: 言語テンプレート '$lang' が見つかりません: $abspath/$lang" >&2
    exit 1
  fi
done

# ベーステンプレートのコピー
mkdir -p "$target/.claude/rules"

cp "$abspath/CLAUDE.md" "$target/CLAUDE.md"
cp "$abspath/settings.json" "$target/.claude/settings.json"
find "$abspath/rules" -maxdepth 1 -name '*.md' -exec cp {} "$target/.claude/rules/" \;

# 言語別テンプレートのマージ
for lang in "${langs[@]}"; do
  langdir="$abspath/$lang"

  # CLAUDE.md の追記
  if [ -f "$langdir/CLAUDE.md" ]; then
    echo "" >> "$target/CLAUDE.md"
    cat "$langdir/CLAUDE.md" >> "$target/CLAUDE.md"
  fi

  # rules のマージコピー
  if [ -d "$langdir/rules" ]; then
    find "$langdir/rules" -maxdepth 1 -name '*.md' -exec cp {} "$target/.claude/rules/" \;
  fi
done

echo "Claude Code テンプレートを $target に展開しました"
