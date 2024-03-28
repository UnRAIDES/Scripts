#!/bin/bash
cd /root

# Install eza 0.18.9
wget https://github.com/eza-community/eza/releases/download/v0.18.9/eza_x86_64-unknown-linux-musl.tar.gz
tar -xf eza_x86_64-unknown-linux-musl.tar.gz ./eza --no-same-owner --strip-components 1 && mv eza /usr/local/sbin
echo 'alias ll="eza --long --all --group --icons"' >> /root/.bash_profile

# Install bat 0.24.0
wget https://github.com/sharkdp/bat/releases/download/v0.24.0/bat-v0.24.0-x86_64-unknown-linux-musl.tar.gz
tar -xf bat-v0.24.0-x86_64-unknown-linux-musl.tar.gz bat-v0.24.0-x86_64-unknown-linux-musl/bat --no-same-owner --strip-components 1 && mv bat /usr/local/sbin

# Install dust 1.0.0
wget https://github.com/bootandy/dust/releases/download/v1.0.0/dust-v1.0.0-i686-unknown-linux-musl.tar.gz -P /root
tar -xf dust-v1.0.0-i686-unknown-linux-musl.tar.gz dust-v1.0.0-i686-unknown-linux-musl/dust --no-same-owner --strip-components 1 && mv dust /usr/local/sbin

# clean downloaded files
rm bat* dust* eza*