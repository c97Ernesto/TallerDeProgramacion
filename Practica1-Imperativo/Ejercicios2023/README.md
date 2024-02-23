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

2.  El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.

	b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.

	c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.


3. Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.

	b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas, a partir de la estructura generada en a)..

	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría.

	d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje, del vector obtenido en el punto c).

4. Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. </br>
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

	a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza cuando se lee el precio 0.

	b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro. 
	
	c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.

	d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos métodos vistos en la teoría.

	e. Muestre los precios del vector resultante del punto d).

	f. Calcule el promedio de los precios del vector resultante del punto d).

<h2 align=" center">Parte 2: Recursión</h2>

1. Implementar un programa que invoque a los siguientes módulos.

	a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los almacene en un vector con dimensión física igual a 10 y retorne el vector.

	b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.

	c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..

	d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.

	e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con los caracteres leídos.


	f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el mismo orden que están almacenados.

	g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en orden inverso al que están almacenados.


6. Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2 5 6.

7. Escribir un programa que:

	a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.

	b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.

	c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.

	d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.

8. Escribir un programa con:

	a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y menores a 100.

	b. Un módulo recursivo que devuelva el máximo valor del vector.

	c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.

9. Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:

	```pascal
	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
	```
	> **Nota:** El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.

10. Realizar un programa que lea números y que utilice un módulo recursivo que escriba el equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).

	> Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. ¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.

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

12.

13.


<h2 align="center">Parte 4: Árboles 2</h2>

1.

15.

16.

<h2 align="center">Parte 5: Adicionales</h2>

1.

18.

19.

20.

21.