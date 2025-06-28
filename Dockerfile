# Dockerfile

# 使用するRubyのバージョンを指定
# プロジェクトで使用しているバージョンに合わせて変更してください
ARG RUBY_VERSION=3.2.3
FROM ruby:$RUBY_VERSION-slim

# --- 基本的な依存パッケージのインストール ---
# build-essential: gemのビルドに必要なツール群
# libpq-dev: PostgreSQLに接続するためのライブラリ
# nodejs, yarn: JavaScriptのランタイムとパッケージマネージャ (アセットパイプラインで必要になる場合がある)
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn

# --- アプリケーションのコードを配置するディレクトリを作成 ---
WORKDIR /app

# --- Gemfileをコピーして、bundle installを実行 ---
# GemfileとGemfile.lockを先にコピーすることで、gemのインストールがキャッシュされ、
# 2回目以降のビルドが高速になります。
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test' && \
    bundle install --jobs $(nproc) --retry 3

# --- アプリケーションのコード全体をコピー ---
COPY . .

# --- エントリーポイントスクリプトに実行権限を付与 ---
# このスクリプトはコンテナ起動時に実行されます。
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# アプリケーションが書き込むためのtmpとlogディレクトリを作成し、権限を付与
RUN mkdir -p /app/tmp/pids && chmod -R 777 /app/tmp && mkdir -p /app/log && chmod -R 777 /app/log

# --- Railsサーバーを起動 ---
# ポート3000番を公開し、サーバーを起動します。
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]