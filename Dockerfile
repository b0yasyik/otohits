FROM ubuntu:18.04


RUN apt-get update; \
    apt-get install -y \
      wget \
      xvfb \
      chromium-browser \
      libgtk2.0-0 \
      psmisc

RUN mkdir Otohits \
    && cd Otohits \
    && wget https://www.otohits.net/dl/OtohitsApp_5058_linux_portable.tar.gz \
    && tar -xzf OtohitsApp_5058_linux_portable.tar.gz \
    && rm OtohitsApp_5058_linux_portable.tar.gz 

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
