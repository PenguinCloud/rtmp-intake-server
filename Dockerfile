FROM penguintech/core-ansible
LABEL company="Penguin Tech Group LLC"
LABEL org.opencontainers.image.authors="info@penguintech.group"
COPY . /opt/manager/
WORKDIR /opt/manager
RUN apt update && apt dist-upgrade -y && apt auto-remove -y && apt clean -y
# PUT YER ARGS in here
ARG IP: 0.0.0.0
ARG MAIN_PORT: 1935
ARG SECOND_PORT: 8080
ARG THIRD_PORT: 1985
ARG FOURTH_PORT: 8000
ARG FIFTH_PORT: 10080
RUN ansible-playbook upstart.yml --tags build -c local
# PUT YER ENVS in here
# Choices are rtmp, hls, hlv, rtc or dash
ENV SERVER_TYPE: "rtmp"

EXPOSE 1935 1985 8080 8000/udp 10080/udp
RUN ansible-playbook upstart.yml --tags run -c local
ENTRYPOINT ["/bin/bash","/opt/manager/entrypoint.sh"]