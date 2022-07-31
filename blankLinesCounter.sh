#!/bin/bash

FILE=$1

LINEA_EN_BLANCO=$(grep -c "^$" $FILE)

echo "Cantidad de lineas en blanco: $LINEA_EN_BLANCO"
