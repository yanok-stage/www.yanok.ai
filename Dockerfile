FROM timbru31/ruby-node:3.3-slim as jekyll

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 4000

WORKDIR /site

RUN gem update --system && gem install bundler jekyll

COPY Gemfile Gemfile.lock /site
RUN bundle install && gem cleanup

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 777 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD [ "bundle", "exec", "jekyll", "serve", "--livereload", "-H", "0.0.0.0", "-P", "4000" ]
