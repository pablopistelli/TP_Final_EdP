#!/bin/bash

##############################
#
# Indicador estadistico de uso de palabras
#
#############################

FILE=$1
SOLO_PALABRAS="^[A-Za-z]+$"
CANT=0
CACHE=""

while read linea; do
	for palabra in $linea; do
		#Analizo sólo las palabras de 4 o más letras
		if [[ $palabra =~ $SOLO_PALABRAS ]] && [ ${#palabra} -ge 4 ]; then
			if [[ ! $palabra =~ $CACHE ]]; then

				CANT=$(grep -o -i $palabra $FILE | wc -l)
            			echo "$palabra aparece $CANT vez/veces"            
        			CACHE="$CACHE_$palabra_"
			fi
		else
            		continue
       	 	fi
	done
done <$FILE

echo $CACHE

exit 0
