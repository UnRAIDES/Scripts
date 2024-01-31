#!/bin/bash

TOKEN="EL TOKEN DEL BOT"
ID="EL ID DEL USUARIO O GRUPO DONDE NOTIFICARÁ"

send_telegram_message() {
  local URL_MESSAGE="https://api.telegram.org/bot$TOKEN/sendMessage"
  local MESSAGE="$1"
  curl -s -X POST $URL_MESSAGE -d chat_id=$ID -d text="$MESSAGE" -d parse_mode=Markdown
}

percentage=$(df -h | grep /var/log | awk '{print $5}' | sed 's/%//')
if [[ $percentage -gt 60 ]]
then
    send_telegram_message "*Almacenamiento de logs al $percentage%*"
fi