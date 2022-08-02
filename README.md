# TP_Final_EdP
## Trabajo Práctico Final - Entorno de Programación - TUIA 2022

El proyecto consiste en generar un contenedor que al ejecutarse presente un menú de opciones de filtrados (mini aplicaciones creadas a partir de bash scripts) de un archivo de texto dado.  
Para el mismo, se editó un Dockerfile y se construyó una imágen, a partir de la cual se ejecutará el contenedor.

---  
## Pasos de ejecución del contenedor:
1. Ingresar en un terminal:
2. $ git clone https://github.com/pablopistelli/TP_Final_EdP.git
3. $ cd TP_Final_EdP
4. $ docker build --tag textproc .
5. $ docker run -it -v $(pwd)/data:/data/ textproc

Para analizar un archivo se debe ubicar en la carpeta **data**.  

A continuación, una vez que ya hemos ejecutado el contenedor, tendremos que seleccionar el archivo que se desee analizar, según la numeración correspondiente.  
Para nuestro caso, figurará un menú de la siguiente manera:

---    
_Seleccione el archivo a analizar:_  
_1) Stephen_King_221163_  
_2) TestFile.txt_  
_#?_

---       

#? --> Aquí indicaremos (según numeración) el archivo de texto que querramos analizar.

Haremos de cuenta que queremos analizar __TestFile.txt__. El mismo cuenta con el siguiente texto:
> Archivo de prueba. Nombres: Euge Pablo Luciano Nico NOnombre.  
> Segundo párrafo. Palíndromos: radar salas.  
> Una línea en blanco.  
>   
> Último párrafo, última oración.


Ingresamos el número 2.  
A continuación se nos desplazará el menú principal con las opciones para analizar el texto:  

---    
_Archivo seleccionado: TestFile.txt_  

_1. Stat Words_  
_2. Stats Usage Words_  
_3. Find Names_  
_4. Stat Sentences_  
_5. Blank Lines Counter_  
_6. Case Converter_  
_7. Substring Replace_  
_8. Block Selection_  
_9. Palindrome Detection_  
_0. Exit_  

_F. Seleccionar archivo_  

\----------------------------    
_Ingrese una opción:_

---    

Ingresamos la opción deseada para analizar el texto (números del 1 al 9) o salimos con el 0.  
Si queremos seleccionar otro archivo de texto para analizar, ingresamos la opción con la letra F.

Siguiendo nuestro caso, seleccionamos, por ejemplo, la opción 3 (Find Names) y a continuación veremos el resultado:

---    
_Ingrese una opción: 3_    

_Nombres propios encontrados en el archivo:_  
_Archivo_  
_Nombres_  
_Euge_  
_Pablo_  
_Luciano_  
_Nico_  
_Segundo_  
_Una_  
_Último_  

---  

Luego, aparecerá en pantalla nuevamente el menú principal para elegir la opción con la que se desee seguir.









