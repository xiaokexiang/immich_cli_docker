## Immich_Cli_Docker

> Periodically upload images from a specified directory to the Immich server based on Immich CLI and crontab

```bash
docker run -d \
--name immich_upload \
-e INSTANCE_URL=<INSTANCE_URL> \
-e API_KEY=<API_KEY> \
-e CRON=<CRON> \ 
-v <UPLOAD_DIR>:/home \
xiaokexiang/immich_upload:latest
```

> - [How to Obtain  API_KEY](https://immich.app/docs/features/command-line-interface/)

> Support scheduled backup immich database data &  notify via bark

```bash
docker run -d --name immich_upload \
-e INSTANCE_URL=<INSTANCE_URL> \
-e API_KEY=<API_KEY> \
-e CRON=<CRON> \
-e BARK_KEY=<bark_key> \
-v <IMMICH_PATH>:/pgsql \
-v <UPLOAD_DIR>:/home \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /usr/bin/docker:/usr/bin/docker \
xiaokexiang/immich_upload:latest
```

