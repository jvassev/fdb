FROM ubuntu:16.04


RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl python2.7 python2.7-dev -y

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

ENV FDB_VERSION 5.1.7-1

RUN curl -o foundationdb-clients_${FDB_VERSION}_amd64.deb https://www.foundationdb.org/downloads/5.1.7/ubuntu/installers/foundationdb-clients_${FDB_VERSION}_amd64.deb && \
    dpkg -i foundationdb-clients_${FDB_VERSION}_amd64.deb && \
    rm foundationdb-clients_${FDB_VERSION}_amd64.deb

RUN curl -o foundationdb-server_${FDB_VERSION}_amd64.deb https://www.foundationdb.org/downloads/5.1.7/ubuntu/installers/foundationdb-server_${FDB_VERSION}_amd64.deb && \
    dpkg -i --ignore-depends=python foundationdb-server_${FDB_VERSION}_amd64.deb && \
    rm foundationdb-server_${FDB_VERSION}_amd64.deb
