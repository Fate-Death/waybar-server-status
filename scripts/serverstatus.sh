#!/bin/bash

SERVER="fatedeath.ddns.net"
PORTS="6969,2283"

SCAN_OUTPUT=$(nmap -Pn -p $PORTS "$SERVER")

#PORTS
STATE1=$(echo "$SCAN_OUTPUT" | grep "6969/tcp" | awk '{print $2}')
STATE2=$(echo "$SCAN_OUTPUT" | grep "2283/tcp" | awk '{print $2}')
#Ip address
IP=$(echo "$SCAN_OUTPUT" | grep "rDNS" | awk '{print $4}' | cut -d: -f1)

#Latency
LATENCY_RAW=$(curl -o /dev/null -s -m 1 -w "%{time_connect}" http://fatedeath.ddns.net:6969 || echo 0)
LATENCY_MS=$(awk "BEGIN {printf \"%.0f\", $LATENCY_RAW * 1000}")
# Determine color
if [[ "$STATE1" == "open" && "$STATE2" == "open" ]]; then
  STATUS="green"
elif [[ "$STATE1" == "filtered" && "$STATE2" == "filtered" ]]; then
  STATUS="red"
else
  STATUS="yellow"
fi

# Output for Waybar
echo "{\"text\":\"\",\"class\":\"$STATUS\",\"tooltip\":\"Server: $SERVER\nIP: $IP\n----PORTS----\n6969: $STATE1 | Latency : $LATENCY_MS\n2283: $STATE2\"}"
