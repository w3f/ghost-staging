#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...

    wait_pod_ready ghost-staging
}

teardown() {
    helmfile delete --purge
}

main(){
    if [ -z "$KEEP_GHOST_PREVIEW" ]; then
        trap teardown EXIT
    fi

    source /scripts/build-helmfile.sh

    run_tests
}

main
