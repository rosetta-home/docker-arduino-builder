FROM java:8

ENV ARDUINO_IDE_VERSION 1.8.2

RUN apt-get update && apt-get install -y wget xz-utils
RUN wget -q -O- https://downloads.arduino.cc/arduino-${ARDUINO_IDE_VERSION}-linux64.tar.xz | tar xJ -C /opt
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION}/arduino-builder /usr/local/bin/
RUN ln -s /opt/arduino-${ARDUINO_IDE_VERSION} /opt/arduino
RUN cd /opt
RUN mkdir /opt/arduino-builder
RUN wget https://github.com/arduino/arduino-builder/releases/download/1.3.25/arduino-builder-linux64-1.3.25.tar.bz2
RUN tar xvjf arduino-builder-linux64-1.3.25.tar.bz2 -C /opt/arduino-builder

ENTRYPOINT [ "arduino-builder" ]
