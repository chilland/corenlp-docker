FROM java:8

MAINTAINER Casey Hilland <casey dot hilland at gmail dot com>

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2015-12-09.zip
RUN unzip stanford-corenlp-full-2015-12-09.zip

WORKDIR stanford-corenlp-full-2015-12-09

RUN export CLASSPATH="`find . -name '*.jar'`"

EXPOSE 9000

CMD java -cp "*" -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer
