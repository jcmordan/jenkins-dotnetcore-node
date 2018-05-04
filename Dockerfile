FROM jenkins/jenkins:lts

# if we want to install via apt

USER root

RUN apt-get update
RUN apt-get install curl libunwind8 gettext apt-transport-https -y


RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'

RUN apt-get update

RUN apt-get install dotnet-sdk-2.1.105 -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash

RUN apt-get install nodejs
# drop back to the regular jenkins user - good practice

USER jenkins

