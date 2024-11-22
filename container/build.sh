#!/bin/bash

podman build -f Containerfile.ubi9-micro -t quay.io/rgordill/httpd-micro:2.24-0 .

export CONTAINER_ENGINE=podman
export IMAGE_NAME=quay.io/rgordill/httpd-micro
export IMAGE_TAG=2.24-0
export CST_TEST_FILE=$PWD/test/tests.yml

run-test-container-image.sh