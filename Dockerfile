ARG IMAGE_VERSION=20.10
FROM ubuntu:${IMAGE_VERSION}

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive \
apt-get install -y \
     wget  \
     curl  \
     screen \
     net-tools \
     sudo  \
     openjdk-8-jre \
     vim \
     unzip 
     


WORKDIR /data/minecraft

RUN wget https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2855/forge-1.12.2-14.23.5.2855-installer.jar 
RUN wget https://www.dropbox.com/s/tog15uw12lvj81n/rlcraft.zip?dl=1
RUN mv forge-1.12.2-14.23.5.2855-installer.jar forge.jar
RUN java -jar forge.jar --installServer

#Accept Eula contract
RUN echo eula=true > eula.txt 

RUN mv 'rlcraft.zip?dl=1' rlcraft.zip
RUN unzip rlcraft.zip

CMD java -Xms4G -Xmx8G -jar forge-1.12.2-14.23.5.2855.jar nogui

EXPOSE 25565 25575

VOLUME ["/data"]
