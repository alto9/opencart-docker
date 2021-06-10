# What is it?
A docker container for OpenCart

## What does it do?
This container starts with a base php-apache image and installs a copy of OpenCart based on the version and md5 arguments passed to it at build time. The version tag for this image lines up with OpenCart versions. This image is the base image in Peddler based OpenCart installations.

## How do you build it?
Use buildx to build a multi-arch image and push to Dockerhub. Must be authenticated with Dockerhub to run this.
`> docker buildx build --platform linux/amd64,linux/arm64 --push -t alto9/opencart:3.0.2.0 --build-arg MD5=41c7e7ec49d389fc4c2204efb40289e6 --build-arg VER=3.0.2.0 .`