#!/bin/sh
echo "immich upload task start ..."
immich login-key "$INSTANCE_URL" "$API_KEY"
immich upload --recursive /home
echo "immich upload success!"
