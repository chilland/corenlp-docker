# corenlp-docker
Dockerfile for Stanford CoreNLP Server
---------

This Dockerfile builds the [Stanford CoreNLP
Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and
shift-reduce parser. It exposes the endpoint on port 9000. Requests 
are made as covered in the documentation.

## Build

```shell
docker build -t corenlp:3.9.1 .
```
