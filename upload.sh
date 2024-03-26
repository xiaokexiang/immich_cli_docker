#!/bin/sh
echo "$(date "+%Y-%m-%d %H:%M") 1. immich upload task start ..."
immich login-key "$INSTANCE_URL" "$API_KEY"
immich upload --recursive /home
echo "$(date "+%Y-%m-%d %H:%M") immich upload success!"

echo "$(date "+%Y-%m-%d %H:%M") 2. save immich database data to /pgsql"
mkdir -p "/pgsql"
docker exec -t immich_postgres pg_dumpall -c -U postgres | gzip > "/pgsql/database.sql.gz"
echo "$(date "+%Y-%m-%d %H:%M") save database data success!"
curl -s "https://api.day.app/${BARK_KEY}/Immich备份/Immich上传和数据库备份成功"
