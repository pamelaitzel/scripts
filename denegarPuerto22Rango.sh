#!/bin/bash
ip_to_num() {
  local IFS=.
  local ip=($1)
  printf "%d" "$((ip[0] * 256*3 + ip[1] * 256*2 + ip[2] * 256 + ip[3]))"
}
num_to_ip() {
  local num=$1
  echo "$(( (num >> 24) & 0xFF )).$(( (num >> 16) & 0xFF )).$(( (num >> 8) & 0xFF )).$(( num & 0xFF ))"
}
read -p "Ingrese la IP de inicio del rango: " START_IP
read -p "Ingrese la IP de fin del rango: " END_IP
if [[ ! $START_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]] || [[ ! $END_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Formato de IP inválido. Por favor ingrese IPs en el formato x.x.x.x"
  exit 1
fi
start_num=$(ip_to_num $START_IP)
end_num=$(ip_to_num $END_IP)
if [ $start_num -gt $end_num ]; then
  echo "El rango de IPs es inválido. La IP de inicio es mayor que la IP de fin."
  exit 1
fi
for (( ip_num=$start_num; ip_num<=$end_num; ip_num++ )); do
  ip=$(num_to_ip $ip_num)
  sudo iptables -A INPUT -p tcp --dport 22 -s $ip -j DROP
done
echo "Bloqueo de puerto 22 para el rango de IPs $START_IP a $END_IP completado."