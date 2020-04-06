FROM php:7.3-cli

ENV BLACKFIRE_CONFIG /dev/null
ENV BLACKFIRE_LOG_LEVEL 1
ENV BLACKFIRE_SOCKET tcp://0.0.0.0:8707
EXPOSE 8707

COPY blackfire blackfire-agent /usr/local/bin/
RUN chmod +x /usr/local/bin/blackfire && chmod +x /usr/local/bin/blackfire-agent

CMD ["blackfire-agent"]

# Don't run as root
RUN useradd -ms /bin/bash blackfire

RUN curl -OLsS https://get.blackfire.io/blackfire-player.phar
RUN chmod +x blackfire-player.phar
RUN mv blackfire-player.phar /usr/bin/blackfire-player

USER blackfire