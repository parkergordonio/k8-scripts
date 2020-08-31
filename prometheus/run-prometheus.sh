#!/bin/bash

docker run \
    -p 9090:9090 \
    -v /Users/parkergordon/GitRepos/k8-scripts/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus