# Archivos para carga de configuración de VIM en Unraid: Método 3
## Instrucciones 🚀
_Instalar VIM desde NerdPack_
_Copiar el archivo .vimrc en el array o en un pool_
_Instalar el plugin UserScripts_
_Copiar el contenido del archivo script.sh en un script dentro de UserScripts, modificar la ruta en la variable VIMRC y programarlo en "at startup of array"
##Observaciones
_Este método solo servirá para vim 8 o superior_
_En el archivo .vimrc se activa packloadall para que cargue todo lo que este posterior a la carpeta pack de .vim (como se observa en el archivo .vimrc de ejemplo)_
_Si se desea instalar otros plugins señalelos con gitclone como se observa en el script_
## UNRAIDES
