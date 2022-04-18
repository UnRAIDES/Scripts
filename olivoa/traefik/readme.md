# Comenzando 🚀
- A continuación nombraremos las modificaciónes en las plantillas de los contenedores que se expondrán por traefik 
- Los contenedores deben estar en la misma red que el contenedor de traefik
- Generar un archivo adicioinal 
```
touch acme.json 
```
y modificar sus permisos 
```
chmod 600 ./acme.json 
```
## Nuevas variables de entorno 
- Agregar nueva variable en el contenedor que se desea exponer, y en config type seleccionar "label"
### Activación de  traefik 
- Name: Enable Traefik 
- Key: traefik.enable
- Value: true
- Default value: true 
### Selección del entrypoint
- Name: https 
- Key: traefik.http.routers.nombre-contenedor.entryPoints  
- Value: https
- Default value: https 

CON LAS DOS VARIABLES PREVIAS LA MAYORIA DE CONTENEDORES SE EXPONEN CORRECTAMENTE, EL NOMBRE DEL SUBDOMINIO SERÁ EL NOMBRE DEL CONTENEDOR.
### Seleccionar el nombre del subdominio 
SI SE DESEA PERSONALIZAR EL NOMBRE DEL SUBDOMINIO A UNO DISTINTO AL GENERADO SEGUN EL NOMBRE DEL CONTENEDOR, SE DEBE ESPECIFICAR LA SIGUIENTE VARIABLE.
- Name: Subdominio 
- Key: traefik.http.routers.nombre-contenedor.rule 
- Value: ```Host(`subdominio.dominio.com`)```
### Selección de conexión https
ALGUNAS CONTENEDORES SE CONECTAN DIRECTAMENTE A HTTPS POR LO QUE SE NECESITA ESPECIFICARLO (NEXTCLOUD DE LINUXSERVER O VAULTWARDEN SON UN EJEMPLO)
- Name: Esquema https
- Key: traefik.http.services.nombre-contenedor.loadbalancer.server.scheme 
- Value: https
- Default value: https 
### Selección de puertos personalizados 
EN CASO DE QUE TRAEFIK NO RECONOZCA LOS PUERTOS ESPECIFICADOS EN LA PLANTILLA SE DEBE ESPECIFICARLO EN LA SIGUIENTE VARIABLE. 
- Name: Ports
- Key: traefik.http.services.nombre-contenedor.loadbalancer.server.port 
- Value: puerto personalizado 
- Default: puerto personalizado 

### Otros
- En el archivo de configuración se deja comentado la autenticación basica del dashboard de traefik, generacion de usuarios, y muestra de conexión a una app externa al server.

## UNRAIDES
