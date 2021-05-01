FROM alpine

ENV S3_ACCESS_KEY=
ENV S3_SECRET_KEY=
ENV S3_BUCKET=

RUN apk add --no-cache python3 py3-pip sqlite

RUN pip install s3cmd

RUN mkdir /opt/backup

COPY backup.sh /opt/backup.sh

RUN chmod +x /opt/backup.sh

CMD "/opt/backup.sh"