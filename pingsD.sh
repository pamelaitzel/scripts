#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta como root"
  exit
fi
read -p "Introduce la dirección IP para permitir los pings: " ip_address
if [[ -z "$ip_address" ]]; then
  echo "No se ha ingresado una dirección IP válida."
  exit 1
fi
iptables -D INPUT -s $ip_address -p icmp --icmp-type echo-request -j DROP
echo "Las solicitudes de ping desde la IP $ip_address ahora están bloqueadas."