FROM shriramsharma/basedocker
MAINTAINER Shriram Sharma "shriram.sharma22@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get -y dist-upgrade
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java

RUN apt-get update
# Accept the Oracle Java license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
# Install Oracle Java
RUN apt-get install -y oracle-java7-installer

RUN cd /usr/local && wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
RUN mkdir /usr/local/nexusdir
RUN tar xvf /usr/local/nexus*.gz -C /usr/local/nexusdir

RUN echo "export RUN_AS_USER=root" >> /etc/bash.bashrc

ADD run.sh /

EXPOSE 8081
CMD ["sh","/run.sh"]
