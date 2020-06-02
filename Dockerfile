FROM ubuntu:16.04

ENV no_proxy="127.0.0.1,localhost,kalliope.fr"

# pico2wav is a multiverse package
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list

# install packages
RUN apt-get update && apt-get install -y \
    git \
    python-dev \
    libsmpeg0 \
    libttspico-utils \
    libsmpeg0 \
    flac \
    libffi-dev \
    libffi-dev \
    libssl-dev \
    portaudio19-dev \
    build-essential \
    sox \
    libatlas3-base \
    mplayer \
    wget \
    vim \
    default-jre \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Install the last PIP
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py


ADD https://github.com/marytts/marytts-installer/archive/v5.2.tar.gz /
RUN mkdir /marytts && tar xvfz /v5.2.tar.gz --strip 1 -C /marytts
WORKDIR /marytts

RUN ./marytts dfki-prudence
# RUN ./marytts cmu-rms && marytts cmu-rms-hsmm && marytts dfki-obadiah && marytts dfki-prudence
# docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb -v /my_project_repos/kalliope_starter_en:/starter kalliope bash


# RUN apt update && apt install curl mysql-client net-tools swig libpulse-dev sphinxsearch -y
# RUN pip install -r kalliope/requirements.txt


RUN apt update && apt install zip gcc make pkg-config automake libtool libpcre2-dev -y
# wine
WORKDIR /home_automation/
RUN git clone https://github.com/MycroftAI/mimic.git
WORKDIR /home_automation/mimic
RUN ./dependencies.sh --prefix="/usr/local"
RUN ./autogen.sh
RUN ./configure --prefix="/usr/local"
RUN make
RUN make check

COPY . /home_automation
WORKDIR /home_automation

RUN apt install curl -y
RUN ls -la
run ls -la kalliope
# RUN apt update && apt install curl mysql-client net-tools swig libpulse-dev sphinxsearch -y
RUN pip install -r kalliope/requirements.txt
