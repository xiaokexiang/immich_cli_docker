FROM docker.io/library/node:20-alpine
LABEL maintainer=xxiaokexiang@gmail.com
WORKDIR /root
COPY upload.sh entrypoint.sh /root/
RUN npm install -g @immich/cli \
&& apk --no-cache add tzdata \
&& chmod +x upload.sh \
&& chmod +x entrypoint.sh
ENV TZ=Asia/Shanghai
ENV CRON_EXPRESSION="30 1 * * *"
ENTRYPOINT ["/root/entrypoint.sh"]
