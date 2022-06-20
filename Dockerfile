FROM penguintech/core-ansible
LABEL company="Penguin Tech Group LLC"
LABEL org.opencontainers.image.authors="info@penguintech.group"
COPY . /opt/manager/
WORKDIR /opt/manager
RUN apt update && apt dist-upgrade -y && apt auto-remove -y && apt clean -y
# PUT YER ARGS in here
ARG NGINX_URL="https://nginx.org/download/nginx-1.19.0.tar.gz"
ARG NGINX_VERSION="1.19.0"
# on / off
ARG NGINX_GZIP="on"
ARG FPM_ENABLE="yes"
RUN ansible-playbook upstart.yml --tags build -c local
# PUT YER ENVS in here
ENV NGINX_DOMAIN="default.penguintech.group"
# tuple of 2
ENV CERT_KEYSIZE="4096"
ENV CERT_EMAIL="na@example.org"
# yes / no
ENV RTMP_ENABLE="yes"
# on / off
ENV RTMP_HLS="on"
# on / off
ENV RTMP_RECORD="on"
ENV RTMP_PORT="1935"
ENV RTMP_USER="user"
ENV RTMP_PASS="123456"
ENV RTMP_DEST_URL="rtmp.penguintech.group"
# Recommend alphanumeric
ENV RTMP_DEST_KEY="notAkey"
RUN ansible-playbook upstart.yml --tags run -c local
ENTRYPOINT ["/bin/bash","/opt/manager/entrypoint.sh"]