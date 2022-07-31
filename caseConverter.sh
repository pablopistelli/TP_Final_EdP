#!/bin/bash

#--------------------------
# MAYUSCULAS <-> minusculas
#--------------------------

FILE=$1
FILE_CONT=$(cat $FILE)		#Guardo el contenido del archivo
FILE_INV="${FILE_CONT~~}"	#Invierto el case de los caracteres (forma no documentada, verificar funcionamiento en Container)

echo "Texto original:"
echo "---------------"
echo "$FILE_CONT"
echo " "

echo "Texto invertido:"
echo "----------------"
echo "$FILE_INV"

exit 0

