FROM golang:1.13-alpine

RUN apk update && \
    apk add --no-cache --virtual build-dependancies \
    build-base gcc wget git bash && \
    apk add --no-cache openjdk8 && \
    git clone https://github.com/gocd-contrib/gocd-cli.git && \
    cd gocd-cli && git checkout ab589aed89177ef478caf4aa613c540f1dcebe56 && ./build.sh && \
    mv gocd /usr/local/bin && chmod +x /usr/local/bin/gocd && \
    gocd configrepo --yaml fetch && gocd configrepo --json fetch && \
    apk del build-dependancies && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["gocd"]
CMD ["--version"]
