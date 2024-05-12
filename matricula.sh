current_year=$(date +'%Y')
echo "Ingresa el periodo:"
read p

if [ $p -eq 2 ] 
then
    echo " "
    r=$p
elif [ $p -eq 1 ]
then
    echo " "
    r=$p
else
    echo "Periodo inválido. Debe ser 1 o 2."
    exit 1
fi

echo "Ingresa el número de carrera:"
read c

if [ $c -ge 1 ] && [ $c -le 8 ]
then
    echo " "
    r=$r$c
else
    echo "Carrera inválida. Debe ser de 1 a 8."
    exit 1
fi

echo "Ingresa el número de alumno:"
read n
if [ ${#n} -gt 3 ]; then
echo "Número de alumno inválido. Debe tener como máximo 3 dígitos."
exit 1
fi
if [ $n -ge 1 ] && [ $n -le 9 ]
then
n="00$n"
elif [ $n -ge 10 ] && [ $n -le 99 ]
then
n="0$n"
fi

echo "Tu número de control es: $current_year$r$n"