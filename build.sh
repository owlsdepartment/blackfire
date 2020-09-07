#!/usr/bin/env sh

docker build -t owlsdepartment/blackfire:latest --no-cache .

docker push owlsdepartment/blackfire
