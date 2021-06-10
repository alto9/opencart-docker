# opencart-docker
A docker container for OpenCart

To build a specific version of OpenCart
`> docker build -t alto9/opencart:3.0.2.0 --build-arg MD5=41c7e7ec49d389fc4c2204efb40289e6 --build-arg VER=3.0.2.0 .`

Push to DockerHub
`> docker push alto9/opencart:3.0.2.0`