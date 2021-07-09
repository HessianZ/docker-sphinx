FROM centos:7

ADD http://sphinxsearch.com/files/sphinx-2.2.11-1.rhel7.x86_64.rpm /tmp

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
        && yum install -y mariadb-libs unixODBC postgresql-libs \
        && rpm -ivh /tmp/*.rpm \
        && yum clean all

EXPOSE 9312/tcp
EXPOSE 9306/tcp

CMD ["searchd", "--nodetach"]
