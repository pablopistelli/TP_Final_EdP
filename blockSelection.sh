#!/bin/bash

#-----------------------------------
# Selección de párrafos y oraciones
#-----------------------------------
# Primer argumento: Archivo
# Segundo argumento:
# 	Oraciones: O/o 
#	Párrafos:  P/p
# Tercer argumento: número de oración/párrafo
#
# Ejemplos:
#	O 4 -> Cuarta oración	
#	P 1 -> Primer párrafo

FILE=$1
BLOCK=$2
SELECT=$3

# Párrafos:
if [[ "$BLOCK" =~ [Pp] ]]; then
	# Utilizamos el comando AWK. Cada párrafo que lea el comando será interpretada como una línea. 
	# Leo la cantidad de párrafos
	LONG=$(awk 'END { print NR }' $FILE)
	
	# Verifico que el párrafo solicitado exista
	if [ $SELECT -le $LONG ]; then
		# Imprimo la línea especificádola con NR
		[[ "$BLOCK" =~ [Pp] ]] && awk "NR==$SELECT" $FILE
	else
		echo "El archivo contiene $LONG párrafos"
		exit 1
	fi
fi

[[ "$BLOCK" =~ [Oo] ]] && awk -v RS="." "NR==$SELECT" $FILE


exit 0

