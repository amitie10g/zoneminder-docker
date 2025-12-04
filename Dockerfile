ARG VERSION=1.36
FROM ubuntu:noble
ARG VERSION

# Update base packages
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common mariadb-server file vlc

RUN add-apt-repository ppa:iconnor/zoneminder-$(case "$VERSION" in "1.37") echo "master";; *) echo "1.36";; esac) && \
    apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y zoneminder && \
    a2enmod rewrite headers cgi && \
    a2enconf zoneminder && \
    systemctl enable zoneminder

# Setup Volumes
VOLUME /var/cache/zoneminder/events /var/cache/zoneminder/images /var/lib/mysql /var/log/zm

# Expose http port
EXPOSE 80

# Configure entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
