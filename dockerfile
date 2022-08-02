#Utilizo como base la imagen de la última versión de Ubuntu
FROM ubuntu

MAINTAINER Lopez_Pistelli

#Defino bash como shell porque por defecto usa sh
SHELL ["/bin/bash", "-c"]

#Instalo locales para trabajar con textos en español
RUN apt-get -y install locales
RUN sed -i '/es_ES.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG es_ES.UTF-8  
ENV LANGUAGE es_ES:en  
ENV LC_ALL es_ES.UTF-8   

#Creo carpeta de datos
RUN mkdir /data

VOLUME ./data /data 

#Copio los scripts
ADD ["menu.sh", "statWords.sh", "statsUsageWords.sh", "findNames.sh", "statSentences.sh", "blankLinesCounter.sh", "caseConverter.sh", "substringReplace.sh", "blockSelection.sh", "palindromeDetection.sh", "./"]

ADD ["./data/TestFile.txt", "/data/TestFile.txt"]

#Ejecuto el menú. Paso como argumento el archivo de texto a analizar.
ENTRYPOINT ["./menu.sh"]

