FROM jekyll/builder AS dev_builder

WORKDIR /tmp

COPY . /tmp

RUN chown -R jekyll:jekyll /tmp

RUN cd jekyll && bundle install && bundle exec jekyll build

FROM nginx AS web_server

COPY --from=dev_builder /tmp/jekyll/_site /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

<<<<<<< HEAD
EXPOSE 8080
=======
EXPOSE 8080
>>>>>>> 570456a72cb04aabe30e3f0218c14aee19a95d44
