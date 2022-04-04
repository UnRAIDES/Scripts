#!/bin/bash

echo "################################################"
echo "#                                              #"
echo "#       CARGANDO CONFIGURACIÓN DE VIM          #"
echo "#                                              #"
echo "################################################"

#variables
#remplazar por directorio donde se encuentre .vimrc en el array
VIMRC="/mnt/user/appdata/scripts/vim/.vimrc"
THEMES="/root/.vim/pack/themes/start"
PLUGINS="/root/.vim/pack/plugins/start"
#-------------------------------------
#enlace simbolico de vimrc
echo "creando enlace simbólico"
ln -s ${VIMRC} /root/

#creando carpetas necesarias
echo "creando carpetas necesarias"
mkdir -p ${THEMES}
mkdir -p ${PLUGINS}

#cargando plugins y themes
echo "cargando plugins y themes"
git clone --depth=1 https://github.com/dracula/vim.git ${THEMES}/dracula
sleep 2
git clone --depth=1 https://github.com/easymotion/vim-easymotion ${PLUGINS}/easymotion
sleep 2
git clone --depth=1 https://github.com/christoomey/vim-tmux-navigator.git ${PLUGINS}/tmux
sleep 2

echo "################################################"
echo "#                                              #"
echo "#      CONFIGURACIÓN DE VIM TERMINADA          #"
echo "#                                              #"
echo "################################################"
