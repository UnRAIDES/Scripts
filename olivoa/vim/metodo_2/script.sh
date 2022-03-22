#!/bin/bash
#foregroundOnly=true
echo "################################################"
echo "#                                              #"
echo "#       CARGANDO CONFIGURACIÓN DE VIM          #"
echo "#                                              #"
echo "################################################"

#variables
#remplazar por directorio donde se encuentre .vimrc en el array
VIMRC="/mnt/user/appdata/scripts/vim/.vimrc"
#-------------------------------------

#enlace simbolico de vimrc
echo "creando enlace simbólico"
ln -s /mnt/user/appdata/scripts/vim/.vimrc /root/ 

sleep 3

# instalar plug-vim
echo "instalando plug-vim"
echo "creando carpetas necesarias"
mkdir -p /root/.vim/autoload/
echo "descargando archivo"
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P /root/.vim/autoload/

sleep 3

# instalar plugins 
echo "cargando PlugInstall"
vim +PlugInstall +qall

sleep 3
echo "carga de configuración finalizada"
