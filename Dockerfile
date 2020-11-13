FROM centos:7
ENV service=kafka
ENV home=/opt/$service

RUN yum clean all && \
    yum -y update && \
    yum -y install sudo && \
    yum -y wget

RUN useradd -md /opt/$service -s /bin/bash $service && \
    echo "kafka ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$service && \
    chown -R $service:$service $home

CMD /usr/sbin/init
