#!/bin/sh

# Check for required environment variables
if [ -z "$MINIO_ENDPOINT" ] || [ -z "$MINIO_USER" ] || [ -z "$MINIO_PASS" ] || [ -z "$OBJECT_KEY" ] || [ -z "$DEST_DIR" ]; then
    echo "Error: Required environment variables are not set. Please set the following variables:"
    echo "    MINIO_ENDPOINT: MinIO endpoint (e.g., https://example.com)"
    echo "    MINIO_USER: MinIO access key"
    echo "    MINIO_PASS: MinIO secret key"
    echo "    OBJECT_KEY: Key of the object to download (e.g., bucket-name/path/to/object.zip)"
    echo "    DEST_DIR: Path to the destination directory"
    exit 1
fi

echo "MINIO_ENDPOINT: $MINIO_ENDPOINT"
echo "MINIO_USER:     $MINIO_USER"
echo "MINIO_PASS:     ***"
echo "OBJECT_KEY:     $OBJECT_KEY"
echo "DEST_DIR:       $DEST_DIR"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Configure mc alias
mc alias set myminio "$MINIO_ENDPOINT" "$MINIO_USER" "$MINIO_PASS" || {
    echo "Error: Failed to set MinIO alias."
    exit 1
}

# Download the object to a temporary file
TEMP_FILE=$(mktemp)
mc cp "myminio/$OBJECT_KEY" "$TEMP_FILE" || {
    echo "Error: Failed to download the object from MinIO."
    exit 1
}

# Extract the object
unzip -o "$TEMP_FILE" -d "$DEST_DIR" || {
    echo "Error: Failed to extract the object."
    rm -f "$TEMP_FILE"
    exit 1
}

# Remove the temporary file
rm -f "$TEMP_FILE"

echo "Success: The object has been extracted to $DEST_DIR."
