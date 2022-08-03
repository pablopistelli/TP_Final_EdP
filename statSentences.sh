#!/bin/bash

#---------------------------------------------------------------------
# Longitud de oraciones (más corta, más larga y promedio de longitud).
#---------------------------------------------------------------------
FILE=$1

LARGA=0		#Cantidad de caracteres de la oracion mas larga
CORTA=0		#Cantidad de caracteres de la oracion mas corta
PROM=0		#Cantidad promedio de caracteres por oracion
CANT_OR=0	#Cantidad de oraciones
LONG=0		#Longitud de oracion actual

FIN_OR="[.!?]"	#Regex para detectar fin de oraciones 

while read -n1 char; do
	#Cuento cantidad de caracteres hasta encontrar un final de oracion
	if [[ ! $char =~ $FIN_OR ]]; then
		#Cuento la cantidad de caracteres omitiendo los espacios en blanco
		if [[ $char = [![:space:]] ]]; then
			LONG=$(($LONG+1))
		fi
	else
		if [ $LONG != 0 ]; then
			#Si es la primera oracion que leo la guardo como la más corta y la más larga
			if [ $CANT_OR == 0 ]; then
				CORTA=$LONG
				LARGA=$LONG
			else
			#Si no es la primera oracion comparo con las longitudes guardadas y reemplazo
				[ $LONG -lt $CORTA ] && CORTA=$LONG
				[ $LONG -gt $LARGA ] && LARGA=$LONG
			fi

		ACUM=$(($ACUM+$LONG))   #Acumulo total de caracteres
		LONG=0             	#Reinicio longitud de oracion
		CANT_OR=$(($CANT_OR+1)) #Aumento contador de oraciones
		fi
	fi
done <$FILE

PROM=$(($ACUM/$CANT_OR))

echo "Oracion mas larga: $LARGA caracteres"
echo "Oracion mas corta: $CORTA caracteres"
echo "Longitud promedio: $PROM caracteres"
echo "Cantidad de oraciones: $CANT_OR"

exit 0

