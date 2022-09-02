#!/bin/bash

# Prerequisites:
# pang executable in /root

# Send message to telegram bot
# params:
# $1: Message
send_msg () 
{
    message="$1"
    #Chat ID: 123456789
    ID="xxxxxxxxxxxxxxxxxx"
    #Bot token: ref: https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/
    TOKEN="xxxxxxxxxxxx:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    URL="https://api.telegram.org/bot$TOKEN/sendMessage"
    echo "Sending message: $message"
    curl -s -X POST $URL -d chat_id=$ID -d text="$(echo -e "$message\n")" > /dev/null 2>&1
}

# Set fan speed and send telegram message
# params:
# $1: Message of current temperature
# $2: New rpm fan speed
# $3: Send telegram notification
set_fan () 
{
    echo "Temperature is $1. Setting up fan speed to $2."
    if $3 
    then
        send_msg "Temperature is $1. Setting up fan speed to $2"
    fi
    /root/panq fan $2
}

# Main script

temperature=$(/root/panq log)
IFS=',' read -ra ADDR <<< "$temperature"
echo Loading old temperature...
source temp.sav

if awk "BEGIN {exit !(${ADDR[2]} == $CURRENTTEMP)}"; then
    dontChanged=true;    
else     
    dontChanged=false;
fi

# print separator
printf "=%.0s"  $(seq 1 63)
# insert a newline
printf "\n"
echo FAN : ${ADDR[1]} rpm
echo CURRTEMPERATURE: ${ADDR[2]} º
echo OLD TEMPERATURE: $CURRENTTEMP º
echo           EQUAL: $dontChanged
# print separator
printf "=%.0s"  $(seq 1 63)
# insert a newline
printf "\n"

if $dontChanged 
then
    echo Temperatura dont changed. 
    echo Exiting...
    exit
fi

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
sleep 5s
/root/panq fan
/root/panq temperature


echo Saving current temperature
cat <<< "CURRENTTEMP=${ADDR[2]}" > temp.sav
cat temp.sav