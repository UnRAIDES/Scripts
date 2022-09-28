# **docker-healthchecks** : Monitorizacion de contenedores con healthchecks.io

Con este script serás notificado si un contenedor *docker* se encuentra detenido.

## Prerequisitos e instalación.

- Necesitaras una cuenta en [https://healthchecks.io/] y tener configurado un Check. Si no sabes como hacerlo, en el canal de @Unraid_es de Youtube hicieron un fantástico video explicándolo, enlazo al minuto exacto [https://www.youtube.com/watch?v=uu5WZetPtnQ&t=2580s]

## Preparacion del script

- Al final del script *docker-healthchecks.sh* deberas añadir los contenedores que quieres monitorizar y el uuid proporcionado por healthchecks.io, con el formato: 

``` bash
docker-healthchecks <nombre del contenedor> <uuid>
```

Por ejemplo:

``` bash
docker-healthchecks Nginx 6381721a-b49e-4e8b-8a61-817b6b83fc6f
docker-healthchecks ddns-updater d1716e04-e79e-4a79-a969-169ca402d650
docker-healthchecks vorta d1716e04-e79e-4a79-a969-169ca402d650
```

## Configuracion del script en UserScripts

- En UnRaid crea un script de usuario con el nombre *docker-healthchecks* y en el propio script pega el contenido del fichero docker-healthchecks.sh
- Configura la ejecución del script con el mismo tiempo configurado en [https://healthchecks.io/]. Yo lo tengo cada 15 minutos: `*/15 * * * *`

## Changelog
### Version 0.1
* Primera versión del script.

# Agradecimientos y menciones:

## Referidos y recursos

- [Healthchecks.io Documentation](https://healthchecks.io/docs/)
- [UnRAIDES Youtube](https://www.youtube.com/c/UnRAIDES/)

### Agradecimientos

* Gracias a @Carpe_Diem_Quam_Minimum_Postero del canal [Telegram Unraid_ES](https://t.me/unRAID_ES) por descubrirme el servicio [https://healthchecks.io/] y enseñarme a usarlo en su video de youtube

### Contributors 

* Se agradencen sugerencias, incidencias e ideas de mejora.
