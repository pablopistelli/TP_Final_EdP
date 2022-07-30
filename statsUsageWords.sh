#!/bin/bash

#-----------------------------------------
# Indicador estadistico de uso de palabras
#-----------------------------------------

FILE=$1
			
# tr -d '.,?![0-9]' 		--> Elimino caracteres indeseados
# tr '[:upper:]' '[:lower:]' 	--> Transformo todo a minusculas
# tr ' ' '\n' 			--> Indico saltos de linea
# awk 'length > 3' 		--> Filtro palabras de mas de 3 letras.
# sort 				--> Agrupo palabras iguales
# uniq -c 			--> Me quedo con una de cada palabra repetida y cuento apariciones
# sort -r 			--> Agrupo nuevamente en forma descendente
# head -n 10			--> Indico salida de las 10 palabras con mayor aparicion

cat $FILE | tr -d '.,?![0-9]' | tr '[:upper:]' '[:lower:]' | tr ' ' '\n' | awk 'length > 3' | sort | uniq -c | sort -r | head -n 10 > list.txt 
	
echo "Listado de palabras (Aparicion|Palabra):"

cat list.txt

exit 0

