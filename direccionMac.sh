#!/bin/bash
read -p "Ingrese la direccion mac que desea bloquear: " BLOCK_IP

sudo iptables -A INPUT -m mac --mac --sorce $BLOCK_IP -j DROP
echo "Bloqueo de puerto 22 para la direccion mac $BLOCK_IP completado."