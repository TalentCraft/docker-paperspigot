FROM nimmis/java:openjdk-8-jdk

MAINTAINER OwnageTechGeek <talentcmc@gmx.com>

# SPIGOT_HOME         default directory for SPIGOT-server
# SPIGOT_VER          default minecraft version to compile
# SPIGOT_AUTORESTART  set to yes to restart if minecraft stop command is executed
ENV PAPERSPIGOT_HOME=/minecraft \
    PAPERSPIGOT_VER=1.8.8 \
    PAPERSPIGOT_AUTORESTART=yes

# add extra files needed
COPY rootfs /

RUN apt-get update && \


    # Make info file about this build
    printf "Build of TalentCraft/paperspigot:latest, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/paperspigot && \

    # install application
    apt-get install -y wget git && \

    # Make special user for minecraft to run in
    /usr/sbin/useradd -s /bin/bash -d /minecraft -m minecraft && \

    # remove apt cache from image
    apt-get clean all


# expose minecraft port
EXPOSE 25565


