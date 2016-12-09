# Package in docker art.sf.net

FROM tomcat:9-alpine
MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

ENV ART_VERSION 3.0-beta3
ENV ART_FILE art-${ART_VERSION}.zip

RUN apk --no-cache add curl ttf-freefont unzip \
    && rm -rf /usr/local/tomcat/webapps/* \
    && curl -L "http://downloads.sourceforge.net/project/art/art/${ART_VERSION}/${ART_FILE}" > /tmp/${ART_FILE} \
    && unzip -p /tmp/${ART_FILE} art-${ART_VERSION}/art.war > /usr/local/tomcat/webapps/ROOT.war \
    && apk --no-cache del curl unzip
