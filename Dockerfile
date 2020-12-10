FROM maven:alpine

RUN apk add --update --no-cache \
        unzip wget

ARG CORENLP_VERSION="4.2.0"

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-${CORENLP_VERSION}.zip
RUN unzip stanford-corenlp-${CORENLP_VERSION}.zip && \
        rm stanford-corenlp-${CORENLP_VERSION}.zip 

WORKDIR stanford-corenlp-${CORENLP_VERSION}

RUN wget https://nlp.stanford.edu/software/stanford-srparser-2014-10-23-models.jar
RUN mvn install:install-file -Dfile=stanford-srparser-2014-10-23-models.jar \
        -DgroupId=edu.stanford.nlp -DartifactId=stanford-srparser \
        -Dversion=3.5.2 -Dpackaging=jar

RUN export CLASSPATH="`find . -name '*.jar'`"

EXPOSE 9000

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -parse.model edu/stanford/nlp/models/srparser/englishSR.ser.gz
