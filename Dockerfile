FROM debian:stable
MAINTAINER Tom Taylor <tom+dockerfiles@tomm.yt>

ENV JRE_VER=8u111
# Because 'standards' ... (update this one too)
ENV JRE_PATH_VER=jre1.8.0_111

ENV JAVA_HOME=/usr/local/java/${JRE_PATH_VER}
ENV JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jre-${JRE_VER}-linux-x64.tar.gz
ENV ACCEPT_COOKE="Cookie: oraclelicense=accept-securebackup-cookie"

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -yqq install curl && \
    mkdir -p /usr/local/java && \
    curl -Ls -H "${ACCEPT_COOKE}" ${JAVA_URL} | tar zx -C /usr/local/java && \
    update-alternatives --install /usr/bin/java java ${JAVA_HOME}/bin/java 1
