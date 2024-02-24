<h2 align="center">Parte 1: Ordenación</h2>

1. Se desea procesar la información de las ventas de productos de un comercio (como máximo50). </br>
Implementar un programa que invoque los siguientes módulos:

	a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el día de la venta, código del producto (entre 1 y 15) y cantidad vendida  como máximo 99 unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
	
	b. Un módulo que muestre el contenido del vector resultante del punto a).

	c. Un módulo que ordene el vector de ventas por código. 
	
	d. Un módulo que muestre el contenido del vector resultante del punto c).
	
	e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores que se ingresan como parámetros.
	
	f. Un módulo que muestre el contenido del vector resultante del punto e).
	
	g. Un módulo que retorne la información (ordenada por código de producto de menor a mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
	
	h. Un módulo que muestre la información obtenida en el punto g).

	- [Resolución Ejercicio 1](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte1_ejercicio1.pas)


2.  El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

	b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.

	c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.

	- [Resolución Ejercicio 2](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte1_ejercicio2.pas)


3. Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.

	b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas, a partir de la estructura generada en a)..

	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.

	d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, del vector obtenido en el punto c).

	- [Resolución Ejercicio 3](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte1_ejercicio3.pas)

4. Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.

	b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. 
	
	c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

	d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría.

	e. Muestre los precios del vector resultante del punto d).

	f. Calcule el promedio de los precios del vector resultante del punto d).

	- [Resolución Ejercicio 4](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte1_ejercicio4.pas)

<h2 align="center">Parte 2: Recursión</h2>

1. Implementar un programa que invoque a los siguientes módulos.

	a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los almacene en un vector con dimensión física igual a 10 y retorne el vector.

	b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.

	c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..

	d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.

	e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.


	f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el mismo orden que están almacenados.

	g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en orden inverso al que están almacenados.

	- [Resolución Ejercicio 1](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio1.pas)

6. Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2 5 6.

	- [Resolución Ejercicio 2](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio2.pas)

7. Escribir un programa que:

	a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.

	b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

	c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

	d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.

	- [Resolución Ejercicio 3](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio3.pas)


8. Escribir un programa con:

	a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y menores a 100.

	b. Un módulo recursivo que devuelva el máximo valor del vector.

	c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.

	- [Resolución Ejercicio 4](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio4.pas)

9. Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:

	```pascal
	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
	```
	> **Nota:** El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.

	- [Resolución Ejercicio 5](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio5.pas)

10. Realizar un programa que lea números y que utilice un módulo recursivo que escriba el equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).

	> Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.

	- [Resolución Ejercicio 6](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte2_ejercicio6.pas)

<h2 align="center">Parte 3: Árboles 1</h2>

1.  Escribir un programa que:

	a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado por número de socio.

	b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que :

		i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.

		ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.

		iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.

		iv. Aumente en 1 la edad de todos los socios.

		v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el valor leído y retorne verdadero o falso.

		vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.

		vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.

		viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.

		ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.

		x. Informe los números de socio en orden creciente.

		xi. Informe los números de socio pares en orden decreciente.

	- [Resolución Ejercicio 1](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte3_ejercicio1.pas)

12. Escribir un programa que:

	a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
	
		i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de producto.

		ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por código de producto. Cada nodo del árbol debe contener el código de producto y la cantidad total de unidades vendida.

		Nota: El módulo debe retornar los dos árboles.

	- [Resolución Ejercicio 2](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte3_ejercicio2.pas)

	b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.

	c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne la cantidad total de unidades vendidas de ese producto.

13. Implementar un programa que contenga:

	a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso de las materias finaliza con el código de materia -1.

	b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.

	c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.

	d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.

	e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.

	e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del alumno con mayor promedio.

	f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.

	- [Resolución Ejercicio 3](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte3_ejercicio3.pas)
	

<h2 align="center">Parte 4: Árboles 2</h2>

1. Implementar un programa modularizado para una librería que:

	a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total de unidades vendidas y el monto total. De cada venta se lee código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza cuando se lee el código de venta -1.

	b. Imprima el contenido del árbol ordenado por código de producto.

	c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.

	d. Contenga un módulo que reciba la estructura generada en el punto a y un código de producto y retorne la cantidad de códigos menores que él que hay en la estructura.

	e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos comprendidos entre los dos valores recibidos (sin incluir).

	- [Resolución Ejercicio 1](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte4_ejercicio1.pas)

15. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:

	a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben ser eficientes para buscar por ISBN.

		i. En una estructura cada préstamo debe estar en un nodo.

		ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN. (prestar atención sobre los datos que se almacenan).

	b.  Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más grande.

	c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más pequeño.

	d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.

	e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El módulo debe retornar la cantidad de préstamos realizados a dicho socio.
	
	f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.

	g. Un módulo que reciba la estructura generada en ii. y  retorne una nueva estructura ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces que se prestó.

	h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.

	i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).

	j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El módulo debe retornar la cantidad total de préstamos realizados a los ISBN comprendidos entre los dos valores recibidos (incluidos).

	- [Resolución Ejercicio 2](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte4_ejercicio2.pas)

16. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX. </br>
Esta carrera tiene 30 materias. Implementar un programa con:

	a. Un módulo que lea la información de los finales rendidos por los alumnos y los lmacene en dos estructuras de datos.

		i. Una estructura que para cada alumno se almacenen sólo código y nota de las materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con nota -1. La estructura debe ser eficiente para buscar por código de alumno.

		ii. Otra estructura que almacene para cada materia, su código y todos los finales rendidos en esa materia (código de alumno y nota).

	b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.

	c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos códigos de alumnos ingresados.

	- [Resolución Ejercicio 3](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte4_ejercicio3.pas)


<h2 align="center">Parte 5: Adicionales</h2>

1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. Implementar un programa con:

	a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que administra. Se debe leer, para cada oficina, el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.

	b) Un módulo que reciba el vector retornado en a) y  retorne dicho vector ordenado por código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos vistos en la cursada.

	c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0. </br>
	Luego el programa debe informar el DNI del propietario o un cartel indicando que no se encontró la oficina.

	d) Un módulo recursivo que retorne el monto total de las expensas.

	- [Resolución Ejercicio 1](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte5_ejercicio1.pas)

18. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta. Implementar un programa que:

	a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y modelo) y los almacene en dos estructuras de datos:

		i. Una estructura eficiente para la búsqueda por patente.

		ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben almacenar todos juntos los autos pertenecientes a ella.

	b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.

	c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne la cantidad de autos de dicha marca que posee la agencia.

	d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con la información de los autos agrupados por año de fabricación.

	e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el modelo del auto con dicha patente.

	f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el modelo del auto con dicha patente.

	- [Resolución Ejercicio 2](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte5_ejercicio2.pas)

19. Un supermercado requiere el procesamiento de sus productos. De cada producto se conoce código, rubro (1..10), stock y precio unitario. Se pide:

	a. Generar una estructura adecuada que permita agrupar los productos por rubro. A su vez, para cada rubro, se equiere que la búsqueda de un producto por código sea lo más eficiente posible. La lectura finaliza con el código de producto igual a -1. 

	b. Implementar un módulo que reciba la estructura generada en a), un rubro y un código de producto y retorne si dicho código existe o no para ese rubro.

	c. Implementar un módulo que reciba la estructura generada en a), y retorne, para cada rubro, el código y stock del producto con mayor código.

	d. Implementar un módulo que reciba la estructura generada en a), dos códigos y retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores ingresados.

	- [Resolución Ejercicio 3](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte5_ejercicio3.pas)

20. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de igual a -1. Se pide:

	a. Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.

	b. Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de reclamos efectuados por ese DNI.

	c. Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

	d. Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de los reclamos realizados en el año recibido.

	- [Resolución Ejercicio 4](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte1_ejercicio5.pas)

21. Realizar el punto a) del ejercicio anterior, pero sabiendo que todos los reclamos de un mismo DNI se leen de forma consecutiva (no significa que vengan ordenados los DNI).

	- [Resolución Ejercicio 5](/Practica1-Imperativo/Ejercicios2023/ejercicios-resueltos/parte5_ejercicio5.pas)