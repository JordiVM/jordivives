FROM jekyll/builder AS dev_builder

WORKDIR /tmp

COPY . /tmp

RUN chown -R jekyll:jekyll /tmp

RUN cd jekyll && bundle install && bundle exec jekyll build

FROM nginx AS web_server

COPY --from=dev_builder /tmp/jekyll/_site /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
