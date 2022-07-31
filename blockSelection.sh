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

# Comando AWK
# -----------
# NR: number of record. 
# Según el caso, cada record puede ser una línea (párrafo) o una oración.
#
# RS: record separator. 
# Para los párrafos se utiliza el separador de una o más líneas nuevas.. 
# Para las oraciones se utiliza una regex con los signos de puntuación que identifican finales de oraciones.

FILE=$1
BLOCK=$2
SELECT=$3

#Validación de argumentos
[[ ! "$BLOCK" =~ [PpOo] ]] && echo "Bloque incorrecto. Ingrese P (párrafo) ׀ O (oración)" && exit 1
[[ ! "$SELECT" =~ [0-9]+ ]] && echo "Número de párrafo/oración inválido" && exit 1


#Regex para fin de párrafos.
#Incluyo la posibilidad de que haya más de una nueva línea entre los párrafos.
FIN_PAR="[\n]+"

#Regex para fin de oración. Considero también oraciones exclamativas e interrogativas. 
#Incluyo la posibilidad de que termine en múltiples signos de puntuación. ("...", "!!!!!", "??!!")
#Considero que luego del signo de puntuación pueda haber un espacio o una nueva línea. La incorporo al RS.
FIN_OR="[.!?]+[\s]+?[\n]+?"


# Párrafos:
if [[ "$BLOCK" =~ [Pp] ]]; then
	# Leo la cantidad de párrafos
	LONG=$(awk -v RS=$FIN_PAR 'END { print NR }' $FILE)
	
	# Verifico que el párrafo solicitado exista
	if [ $SELECT -le $LONG ]; then
		# Imprimo la línea especificádola con NR
		awk -v RS=$FIN_PAR "NR==$SELECT" $FILE
	else
		echo "El archivo contiene $LONG párrafos"
		exit 1
	fi
fi

# Oraciones
if [[ "$BLOCK" =~ [Oo] ]]; then
       	# Leo la cantidad de oraciones. Resto 1 porque considera el EOF como otro record.
	LONG=$(($(awk -v RS=$FIN_OR 'END { print NR }' $FILE)-1))
	
        # Verifico que la oración solicitada exista
        if [ $SELECT -le $LONG ]; then
                # Imprimo la oración especificádola con NR
                awk -v RS=$FIN_OR "NR==$SELECT" $FILE
        else
                echo "El archivo contiene $LONG oraciones"
                exit 1
        fi
fi

exit 0

