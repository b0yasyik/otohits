FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; \
    apt-get install -y \
      wget \
      xvfb \
      chromium \
      libgtk2.0-0

RUN wget https://cdndl.otohits.net/dl/OtohitsApp_5055_linux_portable.tar.gz \
    && tar -xzf OtohitsApp_5055_linux_portable.tar.gz \
    && rm OtohitsApp_5055_linux_portable.tar.gz \
    && groupadd -r otohits \
    && useradd -rm -g otohits otohits \
    && echo 'pcm.!default {\n\
    type plug\n\
    slave.pcm "null"\n\
}' > /etc/asound.conf

USER otohits

COPY run.sh /run.sh

RUN chmod +x run.sh

ENTRYPOINT ["/run.sh"]
