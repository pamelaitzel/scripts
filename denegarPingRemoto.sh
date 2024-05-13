#!/bin/bash
read -p "Ingrese la IP que desea bloquear en el puerto 22: " BLOCK_IP
if [[ ! $BLOCK_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Por favor ingrese una IP en el formato x.x.x.x"
  exit 1
fi
sudo iptables -A INPUT -p tcp --dport 22 -s $BLOCK_IP -j DROP
echo "Bloqueo de puerto 22 para la IP $BLOCK_IP completado."