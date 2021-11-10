FROM jekyll/builder AS dev_builder

COPY jekyll/ /srv/jekyll/

WORKDIR /srv/jekyll

RUN bundle install && bundle exec jekyll build

FROM nginx AS web_server

COPY --from=dev_builder /srv/jekyll/_site /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

#FROM nginx

#COPY jekyll jekyll

#RUN \curl -sSL https://get.rvm.io | bash -s stable && \
#    rvm install 2.0.0 && \
#    gem install jekyll && \
#    cd jekyll && \
#    jekyll build

# RUN mv jekyll/_site /usr/share/nginx/html

# COPY nginx/default.conf /etc/nginx/conf.d/default.conf