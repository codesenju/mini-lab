FROM centos:7
ARG SERVICE=kafka
ARG HOME=/opt/${SERVICE}

RUN yum clean all && \
    yum -y update && \
    yum -y install sudo && \
    yum -y install wget

RUN useradd -md ${HOME} -s /bin/bash ${SERVICE} && \
    echo "${SERVICE} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${SERVICE} && \
    chown -R ${SERVICE}:${SERVICE} $HOME
WORKDIR ${HOME}
RUN touch test.home.txt
CMD /usr/sbin/init
