#!/bin/bash

##########################################
#
# Indicador estadistico de longitud de palabra (mas larga, mas corta y promedio de longitud)
#
##########################################
ARGUMENTOS=$@
SOLO_PALABRAS="^[A-Za-z]+$"

[ $# -eq 0 ] && echo "Debe ingresar al menos un argumento!" && exit 1


MAYOR=""
MENOR=$1
CONT=0
SUMA=0
for palabra in $ARGUMENTOS
do
	if [[ $palabra =~ $SOLO_PALABRAS ]] 
	then
		if [ ${#palabra} -gt ${#MAYOR} ]
		then
			MAYOR=$palabra
		fi
		
		if [ ${#palabra} -le ${#MENOR} ]
		then	
			MENOR=$palabra
		fi
	else
		echo "Debe ingresar solo palabras!" && exit 2
	fi
	
	SUMA=$((SUMA+${#palabra}))
	((CONT++))
done

PROMEDIO=$((SUMA/CONT))

echo "Palabra mas larga: $MAYOR"
echo "Palabra mas corta: $MENOR"
echo "Promedio de longitud de palabras: $PROMEDIO letras"

exit 0
