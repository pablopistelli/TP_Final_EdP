#!/bin/bash

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
		;;
	2)
		echo "statsUsageWords.sh"
		;;
	3)
		echo "findNames.sh"
		;;
	4)
		echo "statsSentences.sh"
		;;
	5)
		echo "blankLinesCounter.sh"
		;;
	6)
		echo "caseConverter.sh"
		;;
	7)
		echo "substringReplace.sh"
		;;
	8)
		echo "blockSelection.sh"
		;;
	9)
		echo "palindromeDetection.sh"
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
