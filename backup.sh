for table in $(sqlite3 /opt/files/.ht.sqlite .tables); do
    sqlite3 /opt/files/.ht.sqlite ".dump $table" > /opt/backup/$table.sql
done

s3cmd \
    --host="nyc3.digitaloceanspaces.com" \
    --host-bucket="%(bucket)s.nyc3.digitaloceanspaces.com" \
    --access_key="$S3_ACCESS_KEY" \
    --secret_key="$S3_SECRET_KEY" \
    --delete-removed \
    --acl-private \
    --default-mime-type="application/sql" \
    sync /opt/backup/ s3://$S3_BUCKET/backup/
