FROM centos:7
ARG SERVICE=devops
ARG HOME=/opt/${SERVICE}

RUN yum clean all && \
    yum -y update && \
    yum -y install sudo && \
    yum -y install wget && \
    yum -y install vim && \
    yum -y install traceroute && \
    yum -y install java-1.8.0-openjdk
RUN useradd -md ${HOME} -s /bin/bash ${SERVICE} && echo ${SERVICE} | passwd ${SERVICE} --stdin && \
    echo "${SERVICE} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${SERVICE} && \
    chown -R ${SERVICE}:${SERVICE} $HOME
WORKDIR ${HOME}
CMD /usr/sbin/init
