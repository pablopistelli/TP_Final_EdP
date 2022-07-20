#!/bin/bash

##############################
#
# Indicador estadistico de uso de palabras
#
#############################

ARGUMENTOS=$@
SOLO_PALABRAS="^[A-Za-z]+$"

[ $# -eq 0 ] && echo "Debe ingresar al menos un argumento!" && exit 1



for palabra in $ARGUMENTOS
do
    if [[ $palabra =~ $SOLO_PALABRAS ]] 
    then
        if [ ${#palabra} -ge 4 ]
        then
            #grep -o -i $palabra | wc -l ??
            
            
        else
            continue
        fi
                
            
        
        
    else
            echo "Debe ingresar solo palabras!" && exit 2
    fi
done    
