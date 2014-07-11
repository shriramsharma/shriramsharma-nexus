FROM shriramsharma/basedocker
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN cd /usr/local && wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
RUN mkdir /usr/local/nexusdir
RUN tar xvf /usr/local/nexus*.gz -C /usr/local/nexusdir

RUN echo "export RUN_AS_USER=root" >> /etc/bash.bashrc

EXPOSE 8081
