# pipのダウンロードファイルのキャッシュディレクトリ
export PIP_DOWNLOAD_CACHE=$HOME/.pip_cache
# パッケージをvirtualenv環境下にインストール
export PIP_RESPECT_VIRTUALENV=true
# pipの実行にvirtualenv環境下である事を必須に
# export PIP_REQUIRE_VIRTUALENV=true

if type pipenv &>/dev/null; then
  eval "$(pipenv --completion)"
fi

