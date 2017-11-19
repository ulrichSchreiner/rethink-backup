FROM rethinkdb:2.3.6

RUN apt update && \
    apt -y upgrade && \
    apt -y install python-pip && \
    pip install rethinkdb && \
    rm -rf /var/lib/apt && \
    rm -rf /var/lib/dpkg

WORKDIR /work

CMD ["rethinkdb-dump"]
