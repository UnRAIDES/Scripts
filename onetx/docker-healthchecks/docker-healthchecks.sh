#!/bin/bash

VERSION="0.1"

#  docker-healthchecks.sh : Uso $FUNCNAME <container_name> <healthcheck_uuid>
docker-healthchecks(){
local container_name="$1"
local hc_uuid="$2"
[[ -z $container_name ]] && { echo "${FUNCNAME}(): container name not specified"; }
[[ -z $hc_uuid ]] && { echo "${FUNCNAME}(): healthcheck uuid not specified. Pleasse execute: ${FUNCNAME} <container_name> <healthcheck_uuid>";  }

if test -n "$hc_uuid" && test -n "$container_name"
then
     echo container name: $container_name
     echo hc: $hc_uuid
     result=$(sudo docker inspect --format="{{.State.Running}}" $container_name)     
     if [ "$result" = true ] ; then
          curl -m 10 --retry 5 https://hc-ping.com/$hc_uuid
          echo -e "\n$container_name is running"
     else
          curl -m 10 --retry 5 https://hc-ping.com/$hc_uuid/fail
          echo -e "\n$container_name stoped or deleted"          
     fi
fi
}

# Deberas añadir los contenedores que quieres monitorizar y el uuid proporcionado por healthchecks.io, con el formato: 
# docker-healthchecks <nombre del contenedor> <uuid>
# Por ejemplo:
#
# docker-healthchecks Nginx 6381721a-b49e-4e8b-8a61-817b6b83fc6f
# docker-healthchecks ddns-updater d1716e04-e79e-4a79-a969-169ca402d650
# docker-healthchecks vorta d1716e04-e79e-4a79-a969-169ca402d650
#