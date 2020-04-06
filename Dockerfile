FROM blackfire/blackfire:latest

RUN mkdir /tmp/player

WORKDIR /tmp/player

USER root

RUN curl -OLsS https://get.blackfire.io/blackfire-player.phar
RUN chmod +x blackfire-player.phar
RUN mv blackfire-player.phar /usr/bin/blackfire-player

USER blackfire