# cktemp: Control de temperatura en Qnap TS x53 con panq

## Prerequisitos e instalación.

- Necesitaras disponer de un bot configurado en Telegram. Si no dispones de un token de telegram y un chatid mira este enlace: https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/
- Copia *panq* de este directorio a la carpeta /root
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
45.00 °C
```

Si los comandos muestran temperatura y velocidad del ventilador correctamente puedes continuar, sino deberas buscar las versión de *panq* que funcione en tu Qnap.

## Preparacion del script

- Edita las variables siguientes del script *cktemp.sh* :

``` bash
	#Chat ID: 123456789
	ID="xxxxxxxxxxxxxxxxxx"
	#Bot token: ref: https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/
	TOKEN="xxxxxxxxxxxx:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
```

- Adapta los valores de temperatura y rpm del ventilador a tu gusto **(Opcional)**

``` bash
# Only send message if temperature is over 45 º
if [ ${ADDR[2]%.*} -gt 48 ]
then
    set_fan "higher than 48" 1500 true
elif [ ${ADDR[2]%.*} -gt 45 ]
then
    set_fan "higher than 45" 950 true
elif [ ${ADDR[2]%.*} -gt 40 ]
then
    set_fan "higher than 40" 800 false
else
    set_fan "lower than 40" 500 true
fi

```

## Configuracion del script en UserScripts

- En UnRaid crea un script de usuario con el nombre cktemp y en el propio script pega el contenido del fichero cktemp.sh
- Configura la ejecución del script al tiempo que prefieras. Yo lo tengo cada 5 minutos: `*/5 * * * *`


# Agradecimientos y menciones:

Gracias a @Captn_Obvious y a @Carpe_Diem_Quam_Minimum_Postero por su ayuda.

## Ref

- *panq* : https://github.com/Dag-Rui/omv-panq-plugin/blob/main/panq-fan-service/panq

