# check-store-logs

No es que sea algo habitual, pero me ha ocurrido que algún problema con mi servidor me ha dejado sin acceso a la GUI (interfaz web) debido a que se me ha llenado la memoria reservada a logs del sistema.
Es por eso que tengo este script corriendo en mi servidor que avisará por telegram si este almacenamiento destinado a logs supera el 60% de uso. De esta manera nos dará tiempo a identificar el error antes de que sea tarde y tengamos que reiniciar el servidor forzosamente sin saber qué ha provocado el llenado.

## Prerequisitos:

- Necesitaras disponer de un bot configurado en Telegram. Si no dispones de un token de telegram y un chatid mira este enlace: [https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/](https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/) 

## Preparacion del script

- Edita las variables siguientes del script *check-store-logs.sh* :

``` bash
TOKEN="EL TOKEN DEL BOT"
ID="EL ID DEL USUARIO O GRUPO DONDE NOTIFICARÁ"
```

## Configuracion del script en UserScripts

- En UnRaid crea un script de usuario con el nombre check_store_logs o como prefieras y en el propio script pega el contenido del fichero check_store_logs.sh
- Configura la ejecución del script al tiempo que prefieras. Yo personalmente lo tengo con `Scheduled Hourly` ya que si está por debajo no hará nada.