#!/bin/bash

FILE=""

echo "TRABAJO PRACTICO FINAL"
echo "Menu de aplicaciones"

if [[ $FILE =~ "" ]]; then
    echo "Seleccione el archivo a analizar: "
        select SEL_FILE in $(ls ./data/)
        do
            [ -e $SEL_FILE ] && echo "Opción no válida" && continue
                echo "Archivo seleccionado: $SEL_FILE" && FILE=$SEL_FILE && break
    done
fi

while [ "$OPT" != "0" ]; do
echo -ne "
------------------------
Archivo seleccionado: $FILE

1. Stat Words
2. Stats Usage Words
3. Find Names
4. Stat Sentences
5. Blank Lines Counter
6. Case Converter
7. Substring Replace
8. Block Selection
9. Palindrome Detection
0. Exit

F. Seleccionar archivo
------------------------
Ingrese una opción: "
read OPT

case $OPT in
    1)
        #echo "statWords.sh"
        /bin/bash ./statWords.sh ./data/$FILE
        ;;
    2)
        #echo "statsUsageWords.sh"
        /bin/bash ./statsUsageWords.sh ./data/$FILE
        ;;
    3)
        #echo "findNames.sh"
        /bin/bash ./findNames.sh ./data/$FILE
        ;;
    4)
        #echo "statsSentences.sh"
        /bin/bash ./statSentences.sh ./data/$FILE
        ;;
    5)
        #echo "blankLinesCounter.sh"
        /bin/bash ./blankLinesCounter.sh ./data/$FILE
        ;;
    6)
        #echo "caseConverter.sh"
        /bin/bash ./caseConverter.sh ./data/$FILE
        ;;
    7)
        #echo "substringReplace.sh"
        echo "Ingrese la cadena que desea buscar: " 
        read SEARCH
        echo "Ingrese la cadena por la que desea reemplazar: " 
        read REPLACE
        /bin/bash ./substringReplace.sh ./data/$FILE $SEARCH $REPLACE
        ;;
    8)
        #echo "blockSelection.sh"
        echo "Ingrese el tipo de bloque que desea buscar:"
        echo "P -> Párrafo"
        echo "O -> Oraciones"
        read BLOCK
        echo "Ingrese el número de bloque que desea buscar:"
        read BLOCK_NUM
        /bin/bash ./blockSelection.sh ./data/$FILE $BLOCK $BLOCK_NUM
        ;;
    9)
        #echo "palindromeDetection.sh"
        /bin/bash ./palindromeDetection.sh ./data/$FILE
        ;;

    F)
        echo "Seleccione el archivo a analizar: "
        select SEL_FILE in $(ls ./data/)
        do
            [ -e file ] && echo "Opción no válida" && continue
            echo "Archivo seleccionado: $SEL_FILE" && FILE=$SEL_FILE && break
        done
        ;;    
    0)
        echo "Chau"
        exit 0
        ;;
    *)
        echo "Opción errónea"
        #exit 1
        ;;
esac

done
