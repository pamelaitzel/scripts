while true
do
echo "menu principal"
echo "1.-tabla de multiplicar"
echo "2.-factorial de x numero"
echo "3.-tablas de multiplicar"
echo "4.-pitagoras"
echo "5.-edad"
echo "6.-control"
echo "7.-salir"
echo "elige una opcion"
read x
case $x in
1)
./programa2.sh
;;
2)
./programa3.sh
;;
3)
./programa4.sh
;;
4)
./programa9.sh
;;
5)
./programa7.sh
;;
6)
./programa11.sh
;;
7)
exit
;;
esac
done