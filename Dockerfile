FROM maven:alpine

RUN apk add --update --no-cache \
        unzip wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
RUN unzip stanford-corenlp-full-2018-02-27.zip && \
        rm stanford-corenlp-full-2018-02-27.zip 

WORKDIR stanford-corenlp-full-2018-02-27

RUN wget https://nlp.stanford.edu/software/stanford-srparser-2014-10-23-models.jar
RUN mvn install:install-file -Dfile=stanford-srparser-2014-10-23-models.jar \
        -DgroupId=edu.stanford.nlp -DartifactId=stanford-srparser \
        -Dversion=3.5.2 -Dpackaging=jar

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port \
        $PORT -parse.model edu/stanford/nlp/models/srparser/englishSR.ser.gz
