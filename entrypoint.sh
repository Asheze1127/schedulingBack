#!/bin/sh
set -e

rm -f /app/tmp/pids/server.pid

# Gemfileから binstubs をインストール
bundle binstubs --all

# データベースが存在しない場合に作成 & マイグレーションを実行
# bin/rails db:prepare で自動的に処理してくれる
bin/rails db:prepare

# その後、DockerfileのCMDで渡されたコマンドを実行
# (この場合は rails server -b 0.0.0.0)
exec "$@"