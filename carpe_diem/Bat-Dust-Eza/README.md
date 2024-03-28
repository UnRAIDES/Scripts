# Instalación de Eza, Bat y Dust en UnRAID
***

Eza es una alternativa a ls, que nos ofrece múltiples ventajas, como tipar archivos por colores, visualización por árbol, etc<br />
https://eza.rocks/

Bat es una alternativa a cat que permite movernos por el archivo de texto como en nano, pero además nos habilita código de colores y permite su uso como pipe usando cat README.md | bat<br />
https://github.com/sharkdp/bat

Dust es una alternativa a du, que nos muestra el espacio ocupado en forma de árbol, con porcentajes de uso y barras<br />
https://github.com/bootandy/dust

Para instalarlo, simplemente hay que crear un script en el plugin userscript, copiar el contenido de script.sh dentro, y programar la ejecución del script con la primera vez que se inicie el array
Se ha incluído un alias para Eza que incluye iconos y vista detallada, usando el comando "ll" (doble ele)
