# docker-gocd-cli
Golang image with Java & GoCD CLI installed.

## Usage
    docker run amaysim/gocd-cli --version
    docker run --mount type=bind,source="$(pwd)",destination=/go amaysim/gocd-cli configrepo --json syntax <gocd config file>.json
    docker run --mount type=bind,source="$(pwd)",destination=/go amaysim/gocd-cli configrepo --yaml syntax <gocd config file>.yaml