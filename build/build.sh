#!/bin/bash

podman build -f Containerfile.ubi9-micro -t quay.io/rgordill/httpd-micro:2.24-0 .