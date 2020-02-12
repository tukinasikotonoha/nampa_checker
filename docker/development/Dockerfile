# Dockerfile
# docker_example_for_rails(Rails/MySQL)
FROM  ruby:2.6.4-alpine
LABEL maintainer="kotonoha<tukinasikotonoha@gmail.com>"
# 文字コードの設定
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LC_CTYPE="utf-8"
# 環境変数
ENV APP="/nampa_checker" \
    CONTAINER_ROOT="./" \
    NOKOGIRI_OPTION="--use-system-libraries \
                    --with-xml2-config=/usr/bin/xml2-config \
                    --with-xslt-config=/usr/bin/xslt-config" \
    MYSQL_PORT=4305 \
    SERVER_PORT=3000
# ライブラリのインストール(追加したい場合は以下に追記)
RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
	    alpine-sdk \
      build-base \
	    bash \
	    imagemagick \
	    jq \
	    less \
	    libgcrypt-dev \
	    libxml2-dev \
      libxslt-dev \
	    mariadb-dev \
	    mysql-client \
	    nodejs \
	    tzdata \
	    wget \
      xvfb \
	    yaml-dev \
      yarn \
      zlib-dev \
 # 重めのgemを予めインストールしておく
 && gem install -q -N bundler \
 && gem install -q -N pkg-config \
 && gem install -q -N rails -v 5.2.3 \
 && gem install -q -N nokogiri -v 1.10.1 -- $NOKOGIRI_OPTION \
 && gem install -q -N mysql2 -v 0.4.10
# 実行するディレクトリの指定
WORKDIR $APP
COPY Gemfile Gemfile.lock $CONTAINER_ROOT
RUN bundle install --jobs=4 --retry=3
# RAILS_SERVE_STATIC_FILES=trueにすることで、rails serverを起動時にpublic/assetsを読み込む
ENV RAILS_SERVE_STATIC_FILES=true \
    PORT=$SERVER_PORT \
    TERM=xterm
EXPOSE $SERVER_PORT
EXPOSE $MYSQL_PORT