# Generic Usage
## Pull

You can easily pull the image to run on your server or PC by using the following command:
> docker pull https://github.com/PenguinCloud/rtmp-intake-server.git

You will need to run this in the Windows Command Prompt, after installing Docker on your system. This link will help you along those lines https://docs.docker.com/desktop/install/windows-install/

## Run

To run the Container, follow the below instructions for Windows and Linux:

Linux:
First you will need to Navigate your terminal into the folder you have the Dockerfile and docker-compose.yml files inside, then run the following command in your terminal:
> docker-compose up

Windows:
Make sure Docker Hub is running on your system, then you should be able to run the container in there, alternatively you can run the same command shown in the linux section in your command prompt, after navigating into the same folder as stated above.

## Docker-Compose

This file is where the containers needed to run the RTMP Server, is pulled and connected to each other. It is not advised to change anything in this file, unless you make changes to the Dockerfiles ENVs. Note that making those changes have a chance of breaking the Container from working.

# Options
## Environment Variables

These are in the Dockerfile and can be changed as you see fit. Just know that changing some of these **MIGHT** have a chance of breaking everything, so make sure you keep a backup of this file before making changes to the ENVs. Here's what the ENVs are doing for you:

EXECTYPE - Choice of rtmp, rtc, rtmp2rtc, dash, hls, hlsorigin or hlsedge. Depending on which one you are planning to use.

## Arguments

IP - Leave this as 0.0.0.0 so that the server can automatically assign its IP to the correct IP.
PORTS 1 to 7 - These are set to work with the different config files depending on which type of server you are planning to use. NOT advised to change these
MAXCONNECTION - The Maximum amount of people that can connect to this server at one time.
RTMP - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
HLS - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
DASH - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
RTMP2RTC - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
RTC - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
HLSORIGIN - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
HLSEDGE - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.
RTC2RTMP - Turn this to "on" if you'd like to use this option for your server. Turn this off, if you don't want to use this option.