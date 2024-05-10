echo "Dime un numero"
read x
a=1
r=1
while [ $a -lt $x ]
do 
r=`expr $r \* $x`
x=`expr $x - 1`
done
echo "El factorial de es" = $r
