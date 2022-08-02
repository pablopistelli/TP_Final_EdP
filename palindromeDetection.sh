#!/bin/bash

#-------------------------
# DETECCION DE PALINDROMO
#-------------------------

FILE=$1

while read linea; do
	for palabra in $linea; do
		
		#Elimino caracteres que me crean problemas
		ELIM_CAR=$(echo $palabra | tr -d '.,?!¡')
			
		if [ ${#ELIM_CAR} -gt 2 ]; then		
			#Convierto el código de caracteres de cada palabra leída para eliminar acentos
			SIN_ACENTOS=$(echo $ELIM_CAR | iconv -f UTF-8 -t ASCII//TRANSLIT)
		
			#Revierto el orden de los caracteres
	      	 	REVERSE=$(echo $SIN_ACENTOS | rev)
	        
	      	  	#Convierto a minusculas y matcheo ambas variables para encontrar el palindromo
	        	if [[ ${SIN_ACENTOS,,} =~ ${REVERSE,,} ]]; then
                		echo "$ELIM_CAR es un palindromo"
                	fi
                fi
	done
done <$FILE

exit 0
