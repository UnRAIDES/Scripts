# Instalación de Exa, Bat y Dust en UnRAID
***

Exa es una alternativa a ls, que nos ofrece múltiples ventajas, como tipar archivos por colores, visualización por árbol, etc
https://the.exa.website/

Bat es una alternativa a cat que permite movernos por el archivo de texto como en nano, pero además nos habilita código de colores y permite su uso como pipe usando cat README.md | bat
https://github.com/sharkdp/bat

Dust es una alternativa a du, que nos muestra el espacio ocupado en forma de árbol, con porcentajes de uso y barras
https://github.com/bootandy/dust

Para instalarlo, simplemente hay que crear un script en el plugin userscript, copiar el contenido de script.sh dentro, y programar la ejecución del script con la primera vez que se inicie el array
Se ha incluído un alias para Exa que incluye iconos y vista detallada, usando el comando "ll" (doble ele)