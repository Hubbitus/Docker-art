# Package in docker art.sf.net

FROM tomcat:9-alpine
MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

ENV ART_FILE art-3.0-beta2.zip

RUN apk --no-cache add curl unzip \
    && rm -rf /usr/local/tomcat/webapps/* \
    && curl -L 'http://downloads.sourceforge.net/project/art/art/3.0-beta2/art-3.0-beta2.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fart%2Ffiles%2Fart%2F3.0-beta2%2F&ts=1481101112' > /tmp/$ART_FILE \
    && unzip -p /tmp/$ART_FILE art-3.0-beta2/art.war > /usr/local/tomcat/webapps/ROOT.war \
    && apk --no-cache del curl unzip
