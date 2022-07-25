#!/bin/bash

####################################
#
# Identificacion de nombres propios
#
####################################

FILE=$1		
NOMBRE_PROPIO="^[A-Z]{1}[a-z]+$"	#Regex para formato de nombre propio: Una mayúscula + Al menos una minúscula

echo "Nombres propios encontrados en el archivo:"

while read linea; do
	for palabra in $linea; do
	        #Comparo las palabras leidas con la regex para nombres propios y muestro en pantalla las coincidencias
		if [[ $palabra =~ $NOMBRE_PROPIO ]]; then
                	echo $palabra
        	fi
	done
done <$FILE

exit 0
