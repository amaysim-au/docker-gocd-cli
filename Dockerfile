FROM golang:1.13-buster

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install default-jdk && \
    git clone https://github.com/gocd-contrib/gocd-cli.git && \
    cd gocd-cli && ./build.sh && \
    mv gocd /usr/local/bin && chmod +x /usr/local/bin/gocd && \
    gocd configrepo --yaml fetch && gocd configrepo --json fetch

ENTRYPOINT ["gocd"]
CMD ["--version"]