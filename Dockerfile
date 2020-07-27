FROM ubuntu:18.04


RUN apt-get update; \
    apt-get install -y \
      ca-certificates \
      wget \
      xvfb \
      chromium-browser \
      libgtk2.0-0 \
      psmisc 

RUN mkdir Otohits \
    && cd Otohits \
    && wget https://www.otohits.net/app/linux/latest --no-check-certificate \
    && tar -xzf latest \
    && rm latest 

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
