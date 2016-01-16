FROM centos:centos7
MAINTAINER Goran Sterjov <goran.sterjov@gmail.com>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install python-pip python-devel gcc zeromq3-devel libevent-devel; yum clean all

RUN pip install circus

RUN mkdir /etc/circus.d
COPY circus.ini /etc/circus.ini

CMD ["circusd", "/etc/circus.ini"]