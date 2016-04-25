FROM ubuntu:14.04

RUN apt-get update \
&&  apt-get install -y \
					ruby2.0 \
					ruby2.0-dev build-essential zlib1g-dev \
&&  update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 1 && update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 1

RUN gem install github-pages

ENTRYPOINT ["/usr/local/bin/jekyll"]

CMD ["serve", "--watch", "--source", "/srv/jekyll", "--destination", "/srv/jekyll/_site", "--port", "4000", "--host", "0.0.0.0"]
