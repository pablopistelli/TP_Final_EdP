#!/bin/bash

#----------------------------------------
# Reemplazo de cadenas dentro de archivo
#----------------------------------------

FILE=$1		#Primer argumento: archivo
SEARCH=$2	#Segundo argumento: cadena a buscar
REPLACE=$3	#Tercer argumento: cadena a reemplazar
CHAR=""
SEARCH_RGX=""

# Mensaje de error de argumentos
[ $# -ne 3 ] && echo "Se esperan tres argumentos: [ARCHIVO] [CADENA A BUSCAR] [CADENA DE REEMPLAZO]" && exit 1


#Armo regex para incluir las vocales con acentos
for (( i=0; i<${#SEARCH}; i++ )); do
	CHAR=$(echo "${SEARCH:$i:1}")
	if [[ $CHAR =~ [Aa] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[aAáÁàÀâÂ]"
	elif [[ $CHAR =~ [Ee] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[eEéÉèÈêÊ]"
	elif [[ $CHAR =~ [Ii] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[iIíÍìÌîÎ]"
	elif [[ $CHAR =~ [Oo] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[oOóÓòÒôÔ]"
	elif [[ $CHAR =~ [Uu] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[uUúÚùÙûÛ]"
	else
		SEARCH_RGX="$SEARCH_RGX[$CHAR${CHAR~~}]"	#Consonantes en mayuscula y minuscula
	fi
done

#Para reemplazar la cadena utilizo el comando sed
#Parámetros:
# -i	reemplazar de forma permanente
# .bak	generar un archivo .bak con el contenido original
# s/	sustituir
# /g	global (todas las apariciones)
# I	case insensitive (esto no es necesario si usamos la regex anterior)	

sed -i.bak s/$SEARCH/$REPLACE/gI $FILE

echo "Se ha reemplazado la cadena $SEARCH por $REPLACE."
echo "Se ha generado el archivo $FILE.bak con el contenido original."

exit 0

