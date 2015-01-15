# Credit to https://github.com/lphoward/fake-s3
#
FROM debian:jessie
MAINTAINER ccg <ccgdevops@googlegroups.com>

ENV DEBIAN_FRONTEND noninteractive

# install Ruby
RUN apt-get update && apt-get install -yqq \
  ruby \
  rubygems-integration \
  && apt-get clean

# install fake-s3
RUN gem install fakes3 -v 0.1.6.1

# run fake-s3
RUN mkdir -p /data

EXPOSE 4569

ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/data", "-p",  "4569", "-h", "0.0.0.0"]
