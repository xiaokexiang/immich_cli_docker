#!/bin/sh
if [ -z "$INSTANCE_URL" ] || [ -z "$API_KEY" ] ; then
  echo "Error: Missing required environment variable. Please set INSTANCE_URL, API_KEY, and UPLOAD_DIR."
  exit 1
fi
echo "${CRON} /root/upload.sh" > /etc/crontabs/root
crond -l 2 -f &
while true; do
  sleep 1800
done
