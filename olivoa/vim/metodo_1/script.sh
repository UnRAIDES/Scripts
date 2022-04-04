#!/bin/bash
#-------------------------------------
#variables
#remplazar por directorio donde se encuentre .vimrc en el array
VIMRC="/mnt/user/appdata/scripts/vim/.vimrc"
#-------------------------------------
#enlace simbolico de vimrc
echo "creando enlace simbólico"
ln -s ${VIMRC} /root/ 

sleep 3

echo "carga de configuración finalizada"
