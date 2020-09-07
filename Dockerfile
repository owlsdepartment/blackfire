FROM php:7.3-cli

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8707
ENV BLACKFIRE_VERSION 1.42.0
EXPOSE 8707

# Blackfire agent
RUN curl -OLsS https://packages.blackfire.io/binaries/blackfire-agent/${BLACKFIRE_VERSION}/blackfire-agent-linux_amd64
RUN chmod +x blackfire-agent-linux_amd64
RUN mv blackfire-agent-linux_amd64 /usr/local/bin/blackfire-agent

# Blackfire CLI
RUN curl -OLsS https://packages.blackfire.io/binaries/blackfire-agent/${BLACKFIRE_VERSION}/blackfire-cli-linux_amd64
RUN chmod +x blackfire-cli-linux_amd64
RUN mv blackfire-cli-linux_amd64 /usr/local/bin/blackfire

# Blackfire player
RUN curl -OLsS https://get.blackfire.io/blackfire-player.phar
RUN chmod +x blackfire-player.phar
RUN mv blackfire-player.phar /usr/bin/blackfire-player

CMD ["blackfire-agent"]

# Don't run as root
RUN useradd -ms /bin/bash blackfire

USER blackfire
