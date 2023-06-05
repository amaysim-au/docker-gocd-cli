#!/bin/sh

set -o errexit
set -o pipefail
set -o nounset

gocd configrepo --yaml syntax /root/test/pipeline.yml --debug
