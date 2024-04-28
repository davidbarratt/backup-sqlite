if [[ -z "$BUCKET" ]]; then
    echo "Must provide BUCKET in environment" 1>&2
    exit 1
fi

mkdir -p "/opt/OneDrive/Backup/$BUCKET";

for table in $(sqlite3 /opt/files/main.sqlite .tables); do
    sqlite3 /opt/files/main.sqlite ".dump $table" > /opt/OneDrive/Backup/$BUCKET/$table.sql
done

onedrive \
    --synchronize \
    --upload-only \
    --syncdir="/opt/OneDrive" \
    --single-directory="Backup/$BUCKET"
