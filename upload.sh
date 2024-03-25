#!/bin/sh
echo "$(date "+%Y-%m-%d %H:%M") 1. immich upload task start ..."
immich login-key "$INSTANCE_URL" "$API_KEY"
immich upload --recursive /home
echo "$(date "+%Y-%m-%d %H:%M") immich upload success!"

if [ -n "$IMMICH_PATH" ]; then
  echo "$(date "+%Y-%m-%d %H:%M") 2. save immich database data to $IMMICH_PATH"
  mkdir -p "$IMMICH_PATH/pgsql"
  docker exec -t immich_postgres pg_dumpall -c -U postgres | gzip > "$IMMICH_PATH/pgsql/database.sql.gz"
  echo "$(date "+%Y-%m-%d %H:%M") save database data success!"
fi
curl -XGET "https://api.day.app/${BARK_KEY}/Immich备份/Immich上传和数据库备份成功"
