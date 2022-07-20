FROM code-dal1.penguintech.group:5050/ptg/standards/docker-ansible-image:stable
LABEL company="Penguin Tech Group LLC"
LABEL org.opencontainers.image.authors="info@penguintech.group"
COPY . /opt/manager/
WORKDIR /opt/manager
RUN apt update && apt dist-upgrade -y && apt auto-remove -y && apt clean -y
# PUT YER ARGS in here

ARG IP=0.0.0.0
ARG PORT1=1935
ARG PORT2=8080
ARG PORT3=1985
ARG PORT4=8000
ARG PORT5=10080
ARG PORT6=8081
ARG MAXCONNECTION=1000
# Choices are on (Enabled) or off (Disabled)
ARG RTMP="off"
ARG HLS="off"
ARG DASH="off"
ARG RTMP2RTC="off"
ARG RTC="off"
ARG HLSORIGIN="off"
ARG HLSEDGE="off"
ARG RTC2RTMP="on"
RUN ansible-playbook /opt/manager/build.yml -c local
# PUT YER ENVS in here
# Choice of rtmp, rtc, rtmp2rtc, dash, hls, hlsorigin or hlsedge
ENV EXECTYPE="rtc2rtmp"
EXPOSE 1935 1985 8080 8000/udp 10080/udp 8081
ENTRYPOINT ["/bin/bash","/opt/manager/entrypoint.sh"]