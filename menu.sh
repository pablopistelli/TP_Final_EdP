#!/bin/bash

FILE=$1

echo "TRABAJO PRACTICO FINAL"
echo "Menu de aplicaciones"

while [ "$OPT" != "0" ]; do
echo -ne "
------------------------
1. Stats Words
2. Stats Usage Words
3. Find Names
4. Stats Sentences
5. Blank Lines Counter
6. Case Converter
7. Substring Replace
8. Block Selection
9. Palindrome Detection
0. Exit
------------------------
Ingrese una opción: "
read -r OPT

case $OPT in
	1)
		echo "statWords.sh"
		/bin/bash ./statWords.sh $FILE
		;;
	2)
		echo "statsUsageWords.sh"
		/bin/bash ./statsUsageWords.sh $FILE
		;;
	3)
		echo "findNames.sh"
		/bin/bash ./findNames.sh $FILE
		;;
	4)
		echo "statsSentences.sh"
		/bin/bash ./statsSentences.sh $FILE
		;;
	5)
		echo "blankLinesCounter.sh"
		/bin/bash ./blankLinesCounter.sh $FILE
		;;
	6)
		echo "caseConverter.sh"
		/bin/bash ./caseConverter.sh $FILE
		;;
	7)
		echo "substringReplace.sh"
		/bin/bash ./substringReplace.sh $FILE
		;;
	8)
		echo "blockSelection.sh"
		/bin/bash ./blockSelection.sh $FILE
		;;
	9)
		echo "palindromeDetection.sh"
		/bin/bash ./palindromeDetection.sh $FILE
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
