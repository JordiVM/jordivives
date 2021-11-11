FROM jekyll/builder AS dev_builder

COPY jekyll/ /srv/jekyll/

RUN cd /srv/jekyll/ && bundle install && bundle exec jekyll build

FROM nginx AS web_server

COPY --from=dev_builder /srv/jekyll/ /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
