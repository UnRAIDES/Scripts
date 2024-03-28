#!/bin/bash
cd /root

# Install exa 0.10.0
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
unzip -j exa-linux-x86_64-v0.10.0.zip bin/exa -d /usr/local/sbin
echo 'alias ll="exa --long --all --group --icons"' >> /root/.bash_profile

# Install bat 0.20.0
wget https://github.com/sharkdp/bat/releases/download/v0.20.0/bat-v0.20.0-x86_64-unknown-linux-musl.tar.gz
tar -xf bat-v0.20.0-x86_64-unknown-linux-musl.tar.gz bat-v0.20.0-x86_64-unknown-linux-musl/bat --no-same-owner --strip-components 1 && mv bat /usr/local/sbin

# Install dust
wget https://github.com/bootandy/dust/releases/download/v0.8.1-alpha.2/dust-v0.8.1-alpha.2-x86_64-unknown-linux-musl.tar.gz -P /root
tar -xf dust-v0.8.1-alpha.2-x86_64-unknown-linux-musl.tar.gz dust-v0.8.1-alpha.2-x86_64-unknown-linux-musl/dust --no-same-owner --strip-components 1 && mv dust /usr/local/sbin

# clean downloaded files
rm bat* dust* exa*