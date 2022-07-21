#!/bin/bash

#-----------------------
# Longitud de oraciones
#-----------------------

LARGA=0
CORTA=0
PROM=0
CANT_OR=0
LONG=0
FILE=$1

while read -n1 char; do
	#Cuento cantidad de caracteres hasta encontrar un punto
	if [ "$char" != "." ]; then
		LONG=$(($LONG+1))
	else
		#Si es la primera oracion que leo la guardo como la más corta y la más larga
		if [ $CANT_OR == 0 ]; then
			echo "CANT_OR CERO"
			CORTA=$LONG
			LARGA=$LONG
		else
		#Si no es la primera oracion comparo con las longitudes guardadas y reemplazo
			[ $LONG -lt $CORTA ] && CORTA=$LONG && (echo "CORTA")
			[ $LONG -gt $LARGA ] && LARGA=$LONG && (echo "LARGA")
		fi

	ACUM=$(($ACUM+$LONG))   #Acumulo total de caracteres
	LONG=0             	#Reinicio longitud de oracion
	CANT_OR=$(($CANT_OR+1)) #Aumento contador de oraciones
	fi
done <$FILE

PROM=$(($ACUM/$CANT_OR))

echo "ACUM $ACUM"
echo "Oracion mas larga: $LARGA caracteres"
echo "Oracion mas corta: $CORTA caracteres"
echo "Longitud promedio: $PROM caracteres"

exit 0

