!/bin/bash

iptables -F INPUT
iptables -P INPUT ACCEPT
iptables -F FORWARD
iptables -P FORWARD ACCEPT
iptables -F OUTPUT
iptables -P OUTPUT ACCEPT

read -p "Ingrese la IP desde la cual desea permitir acceso al puerto 22: " ALLOW_IP
if [[ ! $ALLOW_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Ingrese una IP en el formato x.x.x.x"
  exit 1
fi
sudo /sbin/iptables -D INPUT -p tcp -s $ALLOW_IP --dport 22 -j DROP
echo "Permitido acceso al puerto 22 desde la IP $ALLOW_IP."