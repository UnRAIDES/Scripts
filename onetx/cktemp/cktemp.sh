#!/bin/bash

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Prerequisites:
# pang executable in /root
# cp panq /root/panq
# chmod +x /root/panq
# telegram script in /root
# cp telegram /root/telegram
# chmod +x /root/telegram

#Bot token: ref: https://proyectoa.com/crear-bot-en-telegram-y-generar-token-de-seguridad-para-uso-por-aplicacion-externa/
TELEGRAM_TOKEN="*123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11"
 #Chat ID: 123456789
TELEGRAM_CHAT="123456789"
#Chat Admin UserID: 123456789
TELEGRAM_ADMIN_ID="123456789"

# Set this values 

# Max fan speed (in rpm) supported by your system
FAN_MAX_SPEED=1901
# Min fan speed (in rpm) supported by your system
FAN_MIN_SPEED=200
# Temperature and fan speed array. Set these lists to the same number of elements.
TEMP_ARRAY=(0 30 40 43 47 50 53 60 99 )
SPEED_ARRAY=(200 400 500 700 800 900 1100 1500 1500 )
# Sends a message if the temperature rises above this value.
MIN_TEMP_TO_NOTIFY=50


# Constants and messages. Dont modify it.
LAST_MESSAGE=
LAST_MESSAGE_USERID=
AUTO_MODE=
MSG_ERROR="ERROR You must specify the fan speed (between $FAN_MIN_SPEED and $FAN_MAX_SPEED) in RPMs. \n  p.e. /fan 1000"
MSG_UNATHORIZED_USER="ALERT! Unauthorized user has sent the following message $LAST_MESSAGE. The message has not been processed."
COMMAND_RECEIVED=false
VERSION="0.4"
DATA_FILE=temp.sav


function help_bot {
    echo $(version)
    echo
    echo "This bot supports the following commands: "
    echo 
    echo "/fan [speed] - Sets the fan to the specified [speed] and activates Manual mode. e.g. /fan 700 "
    echo "/auto - Sets auto mode. The fan will adapt its speed according to the temperature. "
    echo "/report - Receive a report of the current status. "
    echo "/fansettings - Shows current range settings for temperatures and speeds"
    echo "/help - This same help."
    exit
}

function version {
	echo "cktemp - Control temperature v.$VERSION"
	echo "by Onetx"
}

# Send message to telegram bot
# params:
#       $1: Message
send_msg () 
{   
    message=$@
    echo MSG:$message
    /root/telegram -t $TELEGRAM_TOKEN -c $TELEGRAM_CHAT  "$(echo -e "$message\n")"   
}

#Read the last message from chat
get_msg () 
{
    LAST_MESSAGE=$(/root/telegram -t $TELEGRAM_TOKEN -c $TELEGRAM_CHAT -m)
    # echo "$LAST_MESSAGE"
}

# Set fan speed and send telegram message
# params:
#       $1: Message of current temperature
#       $2: New rpm fan speed
#       $3: Send telegram notification
set_fan () 
{
    echo "Current Temperature $CURRENTTEMP is higher than  $1. Setting up fan speed to $2."
    if $3 
    then
        send_msg "Current Temperature $CURRENTTEMP higher than is $1. Setting up fan speed to $2."
    fi
    /root/panq fan $2
}

set_auto_fan ()
{
    new_speed=1500
    if ! $AUTO_MODE; then
        echo "Modo manual activado."
        show_report
        exit
    fi

    # Search the speed assigned to the temperature
    for i in "${!TEMP_ARRAY[@]}"; do
        compare=${TEMP_ARRAY[i]}    
        if [ $compare -gt $CURRENTTEMP ]; then
            let selected=$i-1    
            new_speed=${SPEED_ARRAY[selected]}
            selected_temp=${TEMP_ARRAY[selected]}            
            break
        fi
    done

    if [ $CURRENTTEMP -ge $MIN_TEMP_TO_NOTIFY ]; then
        send_notification=true
    else
        send_notification=false
    fi
    
    set_fan "$selected_temp" $new_speed  $send_notification

    sleep 5s
    refresh_data
}


load_data ()
{
    echo Loading old variables...
    if [ -f "$DATA_FILE" ]; then
        source $DATA_FILE    
    else 
        OLDTEMP=0
        SAVED_MESSAGE=
    fi
}

save_data ()
{
    cat <<< "OLDTEMP=$CURRENTTEMP" > temp.sav
    cat <<< "SAVED_MESSAGE='$LAST_MESSAGE'" >> temp.sav
    cat <<< "AUTO_MODE=$AUTO_MODE" >> temp.sav    
}


show_report ()
{
    if awk "BEGIN {exit !($OLDTEMP == $CURRENTTEMP)}"; then
        dontChanged=true;    
    fi

    # print separator
    printf "=%.0s"  $(seq 1 55)
    # insert a newline
    printf "\n"
    echo            FAN : $FAN_SPEED rpm
    echo CURRTEMPERATURE: $CURRENTTEMP º
    echo OLD TEMPERATURE: $OLDTEMP º
    echo           EQUAL: $dontChanged
    echo       AUTO_MODE: $AUTO_MODE
    echo    LAST_MESSAGE: $LAST_MESSAGE
    echo   SAVED_MESSAGE: $SAVED_MESSAGE
    # print separator
    printf "=%.0s"  $(seq 1 55)
    # insert a newline
    printf "\n"
}

refresh_data ()
{
    echo Loading current temperature...
    temperature=$(/root/panq log)    
    IFS=',' read -ra ADDR <<< "$temperature"
    CURRENTTEMP=${ADDR[2]%.*}
    FAN_SPEED=${ADDR[1]}
}

load_data
refresh_data

echo Retrieving the last message...
get_msg

if [[ -z $LAST_MESSAGE ]]
then
    echo "No hay mensajes en el bot"
    COMMAND_RECEIVED=false
fi

if [ "${LAST_MESSAGE,,}" = "${SAVED_MESSAGE,,}" ]; then
    echo "Sin comandos nuevos."
    COMMAND_RECEIVED=false
else 
    COMMAND_RECEIVED=true
fi

if $COMMAND_RECEIVED 
then
    IFS=' ' read -ra MSG <<< "$LAST_MESSAGE"
    LAST_MESSAGE_USERID=${MSG[1]}
    COMMAND=${MSG[3]}
    PARAMETER=${MSG[4]}

    if awk "BEGIN {exit !($LAST_MESSAGE_USERID != $TELEGRAM_ADMIN_ID)}"; then
        echo "Usuario no autorizado"
        send_msg $MSG_UNATHORIZED_USER "Msg:$LAST_MESSAGE"
        save_data
        exit 1        
    fi

    if [ "${COMMAND,,}" = "/fan" ]; then
        echo "Manual fan command received..."
        if [ "$PARAMETER" -eq "$PARAMETER" ] 2>/dev/null
        then
        
            if [ $PARAMETER -gt 199 ] && [ $PARAMETER -lt 1901 ] 
            then
                send_msg "AUTO mode disabled. $(set_fan $CURRENTTEMP $PARAMETER false)"
                AUTO_MODE=false                
                show_report
                save_data
                exit
            else
                send_msg $MSG_ERROR
                exit 1
            fi

        else
            send_msg $MSG_ERROR
            exit 1
        fi
    fi

    if [ "${COMMAND,,}" = "/auto" ]; then
        AUTO_MODE=true
        output_auto="$(set_auto_fan $CURRENTTEMP)"
        send_msg "AUTO Mode ON. $output_auto"
        show_report
        save_data
        exit
    fi

    if [ "${COMMAND,,}" = "/report" ]; then        
        output_report="$(show_report)"
        send_msg "$output_report"
        show_report
        save_data
        exit
    fi

    if [ "${COMMAND,,}" = "/fansettings" ]; then
        arrVar=(" Temperature: __ Fan speed (rpm)")
        for i in "${!TEMP_ARRAY[@]}"; do    
            arrVar+=("${TEMP_ARRAY[i]} º       ${SPEED_ARRAY[i]} rpm")
        done
        concatenated=$(printf "%s\n" "${arrVar[@]}")
        send_msg "$concatenated"
        save_data
        exit
    fi

 if [ "${COMMAND,,}" = "/help" ]; then    
        #help_bot    
        output_report="$(help_bot)"
        send_msg "$output_report"
        show_report
        save_data
        exit
    fi
fi



# Main script


if $AUTO_MODE 
then
    if awk "BEGIN {exit !($OLDTEMP == $CURRENTTEMP)}"; then
        dontChanged=true;    
        echo Temperatura dont changed.
    else     
        dontChanged=false;
        set_auto_fan $CURRENTTEMP
    fi
fi

show_report
save_data
echo Exiting...
exit


