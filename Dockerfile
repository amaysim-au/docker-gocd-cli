FROM golang:1.20-alpine

RUN apk update && \
    apk add --no-cache --virtual build-dependancies \
    build-base gcc wget git bash && \
    apk add --no-cache openjdk17 && \
    git clone https://github.com/gocd-contrib/gocd-cli.git && \
    cd gocd-cli && ./build.sh && \
    mv gocd /usr/local/bin && chmod +x /usr/local/bin/gocd && \
    gocd configrepo --yaml fetch && gocd configrepo --json fetch && \
    apk del build-dependancies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/lib/apt/lists/*

# files for testing image
COPY test /root/test

ENTRYPOINT ["gocd"]
CMD ["--version"]
