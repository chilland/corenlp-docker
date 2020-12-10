# corenlp-docker
Dockerfile for Stanford CoreNLP Server
---------

This Dockerfile builds the [Stanford CoreNLP
Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and
shift-reduce parser. It exposes the endpoint on port 9000. Requests 
are made as covered in the documentation. Including the shift-reduce parser
makes the image rather large (2.5gb+). You can specify the version you want to
build via `--build-arg`.

## Build

```shell
docker build --build-arg CORENLP_VERSION=${CORENLP_VERSION} -t corenlp:${CORENLP_VERSION} .
```

## Run
The container runs the server with some simple defaults and runs the jar with
4gb of memory. The command can be overriden when you start the container. For
example:
```shell
docker run -p 9000:9000 -d corenlp java -cp "*" -mx15g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -parse.model edu/stanford/nlp/models/srparser/englishSR.ser.gz -preload tokenize,ssplit,pos,lemma,depparse,ner,kbp,relation,coref,quote,sentiment -quiet
```
