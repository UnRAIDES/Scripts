# Instalación de Oh-my-ZSH en UnRAID
***

ZSH es un shell alternativo a bash, que incluye muchas funciones extra, como el uso de pluygins y temas.
Podéis encontrar un vídeo explicando paso a paso el proceso de instalación en nuestro canal de Youtube
https://www.youtube.com/watch?v=wOQR2reSrxo

Los pasos son los siguientes:

1. Instalar en UnRAID el plugin Nerd Tools
2. Entrar al plugin Nerd Tools y dentro, buscar e instalar ZSH
3. Crear un directorio "extra" dentro de /boot/config, y dentro del mismo, crear un archivo llamado ".zshrc". La ruta completa sería "/boot/config/extra/.zshrc
4. Copiar el contenido de [.zshrc](./.zshrc) dentro del archivo que acabamos de crear. Modificar el tema o los plugins que vienen por defecto según tus gustos particulares
5. Editar el archivo /boot/config/go y añadir al final del mismo el contenido del archivo [go](./go) (no borrar el contenido previo del archivo, solo añadir al final)
6. Instalar en UnRAID el plugin User Scripts
7. Crear un nuevo script, copiar en su interior el contenido de [./userscript.sh](./userscript.sh) y programarlo para que se lance al iniciar el array

Ya está todo listo. Para activar ZSH ahora, simplemente reiniciar UnRAID o ejecutar manualmente el script creado con User Script