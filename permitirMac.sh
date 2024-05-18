#!/bin/bash
read -p "Ingrese la dirección MAC para la que desea actualizar las reglas de acceso al puerto 22: " MAC_ADDRESS
if [[ ! "$MAC_ADDRESS" =~ ^([a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2}$ ]]; then
  echo "Formato de dirección MAC inválido. Por favor, ingrese una dirección MAC válida (e.g., 00:11:22:33:44:55)."
  exit 1
fi
sudo iptables -D INPUT -p tcp --dport 22 -m mac --mac-source $MAC_ADDRESS -j REJECT
if [ $? -eq 0 ]; then
  echo "Regla de denegación eliminada para la dirección MAC $MAC_ADDRESS"
else
  echo "No se encontró una regla de denegación para la dirección MAC $MAC_ADDRESS o ocurrió un error al intentar eliminarla"
fi
sudo iptables -A INPUT -p tcp --dport 22 -m mac --mac-source $MAC_ADDRESS -j ACCEPT
if [ $? -eq 0 ]; then
  echo "Acceso al puerto 22 permitido para la dirección MAC $MAC_ADDRESS"
else
  echo "Ocurrió un error al intentar permitir el acceso para la dirección MAC $MAC_ADDRESS"
fi
