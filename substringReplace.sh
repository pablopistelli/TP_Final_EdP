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
#Para los caracteres con acento utilizo los valores Unicode en HEX
for (( i=0; i<${#SEARCH}; i++ )); do
	CHAR=$(echo "${SEARCH:$i:1}")

	if [[ $CHAR =~ [a] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[a\xc3\xa1]"
	elif [[ $CHAR =~ [e] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[e\xc3\xa9]"
	elif [[ $CHAR =~ [i] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[i\xc3\xad]"
	elif [[ $CHAR =~ [o] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[o\xc3\xb3]"
	elif [[ $CHAR =~ [u] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[u\xc3\xba]"

	elif [[ $CHAR =~ [A] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[A\xc3\x81]"
	elif [[ $CHAR =~ [E] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[E\xc3\x89]"
	elif [[ $CHAR =~ [I] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[I\xc3\x8d]"
	elif [[ $CHAR =~ [O] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[O\xc3\x93]"
	elif [[ $CHAR =~ [U] ]]; then
		SEARCH_RGX="${SEARCH_RGX}[U\xc3\x9a]"

	else
		SEARCH_RGX="$SEARCH_RGX[$CHAR]"	#Consonantes
	fi
done

#Para reemplazar la cadena utilizo el comando sed
#Parámetros:
# -i	reemplazar de forma permanente
# .bak	generar un archivo .bak con el contenido original
# s/	sustituir
# /g	global (todas las apariciones)	

sed -i.bak s/$SEARCH_RGX/$REPLACE/g $FILE

echo "Se ha reemplazado la cadena $SEARCH por $REPLACE."
echo "Se ha generado el archivo $FILE.bak con el contenido original."

exit 0

