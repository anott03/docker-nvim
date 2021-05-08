FROM ubuntu:20.04

# Build dependencies
RUN apt-get update && \
    apt-get install -fy ninja-build && \
    apt-get install -fy gettext && \
    apt-get install -fy libtool && \
    apt-get install -fy libtool-bin && \
    apt-get install -fy autoconf && \
    apt-get install -fy automake && \
    apt-get install -fy cmake && \
    apt-get install -fy g++ && \
    apt-get install -fy pkg-config && \
    apt-get install -fy unzip && \
    apt-get install -fy git

# Clone and build
RUN git clone https://github.com/neovim/neovim && \
  cd neovim && make clean install && cd .. && rm -rf neovim

# Install packer
RUN git clone https://github.com/wbthomason/packer.nvim /nvim/pack/packer.nvim

# Load config
ADD nvim_conf /nvim/conf

# Set working directory and run nvim
WORKDIR /data
ENTRYPOINT nvim . -u /nvim/conf/init.lua
