# Package in docker art.sf.net

FROM tomcat:9-alpine
MAINTAINER Pavel Alexeev <Pahan@Hubbitus.info>

ENV ART_VERSION 4.0
ENV ART_FILE art-${ART_VERSION}.zip

# DEBUG
# ADD art-${ART_VERSION}.zip /tmp/

RUN apk --no-cache add curl ttf-freefont unzip postgresql-client \
	&& rm -rf /usr/local/tomcat/webapps/* \
	&& curl -L "http://downloads.sourceforge.net/project/art/art/${ART_VERSION}/${ART_FILE}" > /tmp/${ART_FILE} \
		&& unzip -d /tmp/ /tmp/${ART_FILE} \
		&& unzip -d /usr/local/tomcat/webapps/ROOT /tmp/art-${ART_VERSION}/art.war \
		&& mv /tmp/art-${ART_VERSION}/database/ /database \
	&& apk --no-cache del curl unzip \
	&& rm -rf /tmp/art*

# TEMPORARY BUG workaround. See https://sourceforge.net/p/art/code/merge-requests/12/
ADD tmp-art-tables.sql tmp-add-indexes.sql /tmp/
RUN mv /tmp/tmp-art-tables.sql /database/art-tables.sql
RUN mv /tmp/tmp-add-indexes.sql /database/etc/add-indexes.sql

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
