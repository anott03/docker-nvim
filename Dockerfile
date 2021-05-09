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
    apt-get install -fy git && \
    apt-get install -fy lua5.1

# Clone and build
RUN git clone https://github.com/neovim/neovim && \
  cd neovim && make clean install && cd .. && rm -rf neovim

# Install packer
RUN git clone https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Load config
ADD nvim_conf /nvim/conf
RUN mkdir -p ~/.config && ln -s /nvim/conf ~/.config/nvim
RUN cd /nvim/conf/lua/a && \
  lua /nvim/conf/lua/a/install_plugins.lua && \
  cd -

# Set working directory and run nvim
WORKDIR /data
ENTRYPOINT nvim . -u /nvim/conf/init.lua
