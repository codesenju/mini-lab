FROM centos:7
ARG SERVICE=bamboo
ARG HOME=/opt/${SERVICE}

RUN yum clean all && \
    yum -y update && \
    yum -y install sudo && \
    yum -y install wget && \
    yum -y install vim && \
RUN useradd -md ${HOME} -s /bin/bash ${SERVICE} && \
    echo "${SERVICE} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${SERVICE} && \
    chown -R ${SERVICE}:${SERVICE} ${HOME} && \
    sudo yum install -y java-1.8.0-openjdk.x86_64
WORKDIR ${HOME}
ADD https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-6.6.3.tar.gz ${home}

WORKDIR ${HOME}
CMD /usr/sbin/init
