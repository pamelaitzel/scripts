echo "Dame un número"
read z
b=1
while [ $b -le $z ]
do
c=1
while [ $c -le $z ]
do
d=1
while [ $d -le $z ]
do
            v=$((b * b))
            w=$((c * c))
            x=$((d * d))
            y=$((w + x))
            if [ $v -eq $y ]
            then
                echo "$v = $w + $x"
                d=$((d + 1))
            else
                d=$((d + 1))
            fi
        done
        c=$((c + 1))
    done
    b=$((b + 1))
done



