FROM ubuntu:latest
MAINTAINER smaximov <s.b.maximov@gmail.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git

# Add Rust signing key
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 7B3B09DC

# Install multirust
RUN cd /tmp && \
    git clone --recursive https://github.com/brson/multirust && \
    cd multirust && \
    git submodule update --init && \
    ./build.sh && \
    ./install.sh

# Set default user
USER root