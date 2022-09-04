# cktemp: Control de temperatura en Qnap TS x53 con panq

## Prerequisitos e instalación.

- Necesitaras disponer de un bot configurado en Telegram. Si no dispones de un token de telegram y un chatid mira este enlace: [https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/](https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/) 
- Copia *panq* y *telegram* desde este directorio a la carpeta /root
- Conecta por ssh al servidor y otorga permisos de ejecución al fichero *panq*

``` bash
chmod +x /root/panq
```

- Ejecuta los comandos siguientes para comprobar que *panq* es compatible con tu Qnap:

``` bash
root@myUnraid:~# panq log
1662129237,753,45.00
root@myUnraid:~# panq fan
757 RPM
root@myUnraid:~# panq temperature
45.00 ºC
```

Si los comandos muestran temperatura y velocidad del ventilador correctamente puedes continuar, sino deberas buscar las versión de *panq* que funcione en tu Qnap.

## Preparacion del script

- Edita las variables siguientes del script *cktemp.sh* :

``` bash
	#Chat ID: 123456789
	ID="xxxxxxxxxxxxxxxxxx"
	#Bot token: ref: https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/
	TOKEN="xxxxxxxxxxxx:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  #Chat Admin UserID: 123456789
  TELEGRAM_ADMIN_ID="xxxxxxxxxxxxxxxx"  
```

- Adapta los valores de temperatura y rpm del ventilador a tu gusto **(Opcional)**
  
  **ADVERTENCIA**: Las listas TEMP_ARRAY y SPEED_ARRAY establecen la velocidad del ventilador según la temperatura en modo AUTO.

``` bash
    # Max fan speed (in rpm) supported by your system
    FAN_MAX_SPEED=1901
    # Min fan speed (in rpm) supported by your system
    FAN_MIN_SPEED=200
    # Temperature and fan speed array. Set these lists to the same number of elements.
    TEMP_ARRAY=(0 30 40 45 48 60 99)
    SPEED_ARRAY=(200 400 700 1000 1200 1500 1500)
    # Sends a message if the temperature rises above this value.
    MIN_TEMP_TO_NOTIFY=48

```

## Configuracion del script en UserScripts

- En UnRaid crea un script de usuario con el nombre cktemp y en el propio script pega el contenido del fichero cktemp.sh
- Configura la ejecución del script al tiempo que prefieras. Yo lo tengo cada 5 minutos: `*/5 * * * *`

## Uso del Bot

### Commandos admitidos

Este bot admite los siguientes comandos:
 
- **/fan *velocidad*** - Establece el ventilador a la velocidad especificada y activa el modo Manual.  p.e. /fan 700
- **/auto** - Establece el modo automático. El ventilador adaptara su velocidad según la temperatura.
- **/report** - Recibe un reporte del estado actual.
- **/fansettings** - Muestra la configuracion de rangos actuales para temperaturas y velocidades
- **/help** - Esta misma ayuda.

### Configuración del bot

El script leera el ultimo mensaje recibido en el chat y lo procesará. 
El tiempo de respuesta del bot estará determinado por el tiempo configurado en el UserScripts

## Changelog
### Version 0.4
* El bot solo responde a los comandos enviador por el usuario: TELEGRAM_ADMIN_ID
 
### Version 0.3
* Nuevo comando /fansettings 

### Version 0.2
* Recibir comandos del bot para modificar la velocidad del ventilador. 

# Agradecimientos y menciones:

## Referidos y recursos

- *panq* : [Dag-Rui/omv-panq-plugin](https://github.com/Dag-Rui/omv-panq-plugin/blob/main/panq-fan-service/panq)
- *telegram.sh*: [fabianonline/telegram.sh](https://github.com/fabianonline/telegram.sh/)

### Agradecimientos

* Gracias a @Captn_Obvious y a @Carpe_Diem_Quam_Minimum_Postero del canal Telegram Unraid_ES https://t.me/unRAID_ES por su ayuda.

### Contributors 

* Se agradencen sugerencias, incidencias e ideas de mejora.
