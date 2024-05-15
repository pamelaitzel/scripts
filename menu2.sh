while true
do
echo "menu principal script"
echo "1.-denegar ping remoto (ip)"
echo "2.-permitir ping remoto (ip) "
echo "3.-denegar puerto logico 22 (ip)"
echo "4.-permitir puerto logico 22(ip)"
echo "5.-denegar puerto logico 22 (rango ips)"
echo "6.-permitir puerto logico 22 (rango ips)"
echo "7.-denegar puerto logico 22 (mac)"
echo "8.-permitir puerto logico 22(mac)"
echo "9.-checar el estado de las reglas"
echo "10.-salir"
echo "elige una opcion"
read x
case $x in
1)
./programa24.sh
;;
2)
./programa 25.sh
;;
3)
./programa16.sh
;;
4)
./programa17.sh
;;
5)
./programa18.sh
;;
6)
./programa20.sh
;;
7)
./programa22.sh
;;
8)
./programa23.sh
;;
9)
./programa21.sh
;;
10)
exit
;;
esac
done
