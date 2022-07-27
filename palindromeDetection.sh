#!/bin/bash
		
#-------------------------
# DETECCION DE PALINDROMO
#-------------------------

FILE=$1

while read linea; do
	for palabra in $linea; do
		
		#Convierto el código de caracteres de cada palabra leída para eliminar acentos
		SIN_ACENTOS=$(echo $palabra | iconv -f UTF-8 -t ASCII//TRANSLIT)
		
		#Revierto el orden de de los caracteres
	        REVERSE=$(echo $SIN_ACENTOS | rev)
	        
	        #Matcheo ambas variables para encontrar el palindromo
	        if [[ ${SIN_ACENTOS,,} =~ ${REVERSE,,} ]]; then
                	echo "$palabra es un palindromo"
                fi
	done
done <$FILE

exit 0

