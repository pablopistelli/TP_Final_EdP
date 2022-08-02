#Utilizo como base la imagen de la última versión de Ubuntu
FROM ubuntu

MAINTAINER Lopez_Pistelli

#Defino bash como shell porque por defecto usa sh
SHELL ["/bin/bash", "-c"]

#Instalo locales para trabajar con textos en español
RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL es_ES.UTF-8
ENV LANG es_ES.UTF-8
ENV LANGUAGE es_ES.UTF-8

#Creo carpeta de datos
RUN mkdir /data

VOLUME ./data /data 

#Copio los scripts
ADD ["menu.sh", "statWords.sh", "statsUsageWords.sh", "findNames.sh", "statSentences.sh", "blankLinesCounter.sh", "caseConverter.sh", "substringReplace.sh", "blockSelection.sh", "palindromeDetection.sh", "./"]

ADD ["./data/TestFile.txt", "/data/TestFile.txt"]

#Ejecuto el menú. Paso como argumento el archivo de texto a analizar.
ENTRYPOINT ["./menu.sh"]

