#!/bin/bash

####################################
#
# Identificacion de nombres propios
#
####################################

ARGUMENTOS=$@
NOMBRE_PROPIO="^[A-Z]{1}[a-z]+$"

[[ $# -eq 0 ]] && echo "No se ingresaron palabras" && exit 1



for palabra in $ARGUMENTOS
do
	if [[ $palabra =~ $NOMBRE_PROPIO ]]
	then
		echo $palabra
	fi
done

