FROM ruby:2.3-alpine
MAINTAINER https://github.com/muccg/

ARG ARG_FAKES3_VERSION

RUN gem install fakes3 -v $ARG_FAKES3_VERSION
ENV FAKES3_VERSION ARG_FAKES3_VERSION

RUN mkdir -p /data/fakes3

EXPOSE 4569

ENTRYPOINT ["/usr/local/bundle/bin/fakes3"]
CMD ["-r",  "/data", "-p",  "4569"]
