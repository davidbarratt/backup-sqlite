FROM alpine:3.19

ENV BUCKET=

RUN apk add --no-cache  \
    sqlite \
    curl \
    onedrive

RUN mkdir -p /opt/OneDrive/Backup

COPY backup.sh /opt/backup.sh

RUN chmod +x /opt/backup.sh

CMD "/opt/backup.sh"
