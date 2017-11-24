FROM rethinkdb:2.3.6

RUN apt update && \
    apt -y upgrade && \
    apt -y install python-pip unzip curl && \
    pip install rethinkdb && \
    curl -sSL https://github.com/ncw/rclone/releases/download/v1.38/rclone-v1.38-linux-amd64.zip >/tmp/rclone.zip && \
    cd /tmp && unzip rclone.zip && \
    cd rclone* && cp rclone /usr/bin && cd .. && \
    rm -rf /tmp/rclone* && \
    rm -rf /var/lib/apt && \
    rm -rf /var/lib/dpkg

WORKDIR /work

CMD ["rethinkdb-dump"]
