#!/bin/bash

#############################################################################################
#
# Indicador estadistico de longitud de palabra (mas larga, mas corta y promedio de longitud)
#
#############################################################################################

FILE=$1

SOLO_PALABRAS="^[A-Za-z]+$"	#Regex para omitir construcciones de caracteres que no sean palabras.

MAYOR=0		#Palabra de mayor longitud
MENOR=0		#Palabra de menor longitud
CONT=0		#Contador de palabras
SUMA=0		#Suma total de caracteres del archivo

while read linea; do
    for palabra in $linea; do
	#Analizo sólamente las palabras
        if [[ $palabra =~ $SOLO_PALABRAS ]]; then	
		#Si es la primera palabra leída la guardo como más larga y más corta
		if [ $CONT == 0 ]; then
			MAYOR=$palabra
			MENOR=$palabra
		else
		#Si no es la primera palabra la comparo con las palabras guardadas
			[ ${#palabra} -gt ${#MAYOR} ] && MAYOR=$palabra
			[ ${#palabra} -lt ${#MENOR} ] && MENOR=$palabra
		fi

		((CONT++))			#Aumento contador
		SUMA=$((SUMA+${#palabra}))	#Acumulo cantidad de caracteres
	fi
    done
done <$FILE

#Calculo promedio de cantidad de caracteres por palabra
PROMEDIO=$((SUMA/CONT))		

echo "Palabra mas larga del texto: $MAYOR - ${#MAYOR} letras"
#Determino si la palabra mas corta tiene una letra o más para mostrar el mensaje correcto (letra/letras)
([ ${#MENOR} -eq 1 ] && echo "Palabra mas corta del texto: $MENOR - ${#MENOR} letra") || echo "Palabra mas corta: $MENOR - ${#MENOR} letras" 
echo "Promedio de longitud de palabras: $PROMEDIO letras"

exit 0
