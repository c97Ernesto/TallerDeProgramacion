# Módulos

## Arreglos
- ### Métodos de Ordenación: 
	- **[Selección](#selección)**
	- **[Inserción](#inserción)**
- ### [Generar Vector de Listas.](#generar-vector-de-listas-1)

## Árboles Binarios de Búsqueda

- ### [Creación.](#1-creación)
- ### [Recorridos: inOrden, preOrden y postOrden.](#2-recorridos-enorden-preorden-y-postorden)
- ### [Búsqueda: Elemento mínimo y máximo.](#3-búsqueda-elemento-mínimo-y-máximo)
- ### [Búsqueda: Nodo mínimo y máximo.](#4-búsqueda-nodo-mínimo-y-máximo)
- ### [Búsqueda: Devolver si se encuentra el nodo en la estructura.](#5-busqueda-devolver-si-se-encuentra-el-elemento-en-la-estructura)
- ### [Búsqueda: Devolver el nodo donde se encuentra el elemento.](#6-busqueda-devolver-el-nodo-donde-se-encuentra-el-elemento)

## Listas
- ### [Crear Lista: Merge.](#crear-lista-merge-1)
- ### [Crear Lista: Merge Acumulador.](#crear-lista-merge-acumulador-1)


## Arreglos: Métodos de ordenación.

### Selección
Dado un arreglo A y una dimensión lógica (dimL), el algoritmo consiste en buscar (hasta finalizar) en cada vuelta en que posición está ubicado el elemento mínimo, y al finalizar la vuelta intercambiar el elemento mínimo con el primero que no ha sido ordenado.

Es decir, en la **primera vuelta** se busca en que posición está ubicado el mínimo (realizando la búsqueda desde la 1ra posición hasta la última, siendo esta, dimL) y se intercambia el elemento de la primera posición con el elemento ubicado en la posición en la que se encontró el mínimo.

En la **segunda vuelta** se busca en que posición está ubicado el mínimo comenzado desde la 2da posición hasta el final del arreglo (dimL), luego se intercambia el elemento de la segunda posición con el elemento ubicado en la posición donde se encontró el segundo mínimo

El algoritmo se repite (dimensión lógica - 1) veces.

- Que se necesita conocer:
    - Dimensión lógica del arreglo.
    - Poosición donde va el elemento ordenado.
    - Posición desde la que vamos a buscar el mínimo.
    - Posición del elemento mínimo.

- Características:
    - Fácil de implementar.
    - El tiempo de ejecución es de N<sup>2</sup>
    - Posición del elemento mínimo.


```pascal
Procedure OrdenarPorSeleccion(var v: vector; dimL: indice);
var
	i, j, p: indice;
	item: tipoElem; 	// tipo de elemento del arreglo
	
begin
	for i:= 1 to dimL-1 do begin 
		p:= i;	//almaceno en p la pos actual del arreglo
		
		for j:= i+1 to dimL do
			if v[j] < v[p] then
				p:= j;	//almaceno en p la pos del menor elemento del arreglo
				
		{intercambio los elementos}
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;
end;
```

### Inserción
Dado un arreglo A y una dimensión lógica (dimL), el algoritmo consiste en ordenar en cada vuelta un elemetno de un subconjunto de elementos ya ordenados.

Es decir, en la **primera vuelta** se toma todo el subconjunto que contiene _solo el primer elemento_ del arreglo y ovbiamente se considera ordenado.

En la **segunda vuelta**, se toma el segundo elemento del arreglo y se lo inserta de manera que quede ordenado con respecto el subconjunto (donde solo se encuentra el primero elemento) que ya está ordenado.

En la **tercera vuelta**, se toma el tercer elemento del arreglo y se le inserta de manera que quede ordenado con respecto al subconjunto (del primer y segundo elemento mínimo) que ya se encuentra ordenado.

En la **k-ésima vuelta**, se toma el k + 1 elemento del arreglo y se lo inserta de manera que quede ordenado con respecto al subconjunto de k elementos que ya están ordenados.

En cada vuelta puede ser necesario realizar corrimientos para insertar de manera ordenada cada nuevo elemento.

Dado que en la primera vuela se considera solo el primer elemento y por lo tanto no se debe realizar ningún  ordenamiento, en realidad la primera vuelta del algoritma comienza tomando los dos primeros elementos.

- Que se necesita conocer:
    - Dimensión lógica del arreglo.
    - Posición que se debe comparar.
    - Cuantos elementos ya están ordenados

- Características:
    - No es tan fácil de implementar
    - El tiempo de ejecución es de N<sup>2</sup>
    - Si los datos están ordenados de menor a mayor el algoritmo solo hace comparaciones, por lo tanto, es de orden (N).
    - Si los datos están ordenados de mayor a menor, el algoritmo hace todas las comparaciones y todos los intercambios, por lo tanto es de orden (N2) comparaciones.

```pascal
Procedure OrdenarPorInsercion(var v: vector; dimL: indice);
var
	i, j: indice;
	act: tipoElem;
begin
	for i:= 2 to dimL do begin
		act:= v[i];
		j:= i-1;
		while (j > 0) and (v[j] > act) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;
end;
```

### Generar Vector de listas

```pascal
Procedure GenerarVec(var vec: vec_Sucursales);
	procedure leerReg(var r: reg_Venta);								//leer Venta
	begin	
		with r do begin
			writeln('Codigo de Sucursal (0 para terminar):');
			readln(codSucursal);
			if (codSucursal <> 0) then begin
				writeln('Fecha de Venta');
				readln(fecha);
				writeln('Codigo de Producto');
				readln(codProducto);
				writeln('Cantidad vendida del Producto:');
				readln(cantidad);
			end;
		end;
	end;
	procedure insertarOrdenado(var l: Lista; r: reg_Venta);				// ordenarNodos
	var
		ant, nodo, act: Lista;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (r.codProducto <= l^.datos.codProducto) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
			else
				ant^.sig:= nodo;
		nodo^.sig:= act;
	end;
Var																		//Armar Vector
	venta: reg_Venta;
Begin
	leerReg(venta);
	while (venta.codSucursal <> 0) do begin
		insertarOrdenado(vec[venta.codSucursal], venta);
		leerReg(venta);
	end;
End;
```

## Árboles Binarios de Búsqueda:

Es una estructura de datos jerárquica, formada por nodos, donde cada nodo tiene a los sumo dos hijos. El nodo principal se denomina raíz y los nodos que no tienen hijos se denominan hojas del árbol.

#### Características:
- Todo Árbol es una estructura de datos jerárquica, dinámica y  homogénea.
- Para crear un Árbol siempre se empiza por la ráiz.
- Un Árbol vacío se representa por le valor "nil".
- Un nuevo dato siempre se inserta como una hoja.
- Los nodos del Árbol respetan todos el mismo criterio (los hijos ubicados a la izquierda son menores al nodo padre y los ubicados a la derecha son mayores al nodo padre.)
```pascal
Type
	Arbol = ^nodo;
	nodo = record
		dato: dato;
		HI: Arbol;
		HD: Arbol;
	end;
```

### 1. Creación:
```pascal
Procedure Crear(var a: Arbol; num: dato);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= num;
		a^.HI:= nil; 
		a^.HD:= nil
	end
	else
		if (num < a^.dato) then
			crear(a^HI, num);
		else
			crear(a^.HD, num);
end;
```

### 2. Recorridos: EnOrden, PreOrden y PostOrden.

- Recorrido **enOrden**: hijoIzq - raíz - hijoDer
	```Pascal
	Procedure enOrden (a: Arbol);
	begin
		if ( a <> nil ) then begin
			enOrden (a^.HI);
			write (a^.dato); //o cualquier otra acción
			enOrden (a^.HD);
		end;
	end;
	```

- Recorrido **preOrden**: raíz - hijoIzq - hijoDer
	```Pascal
	Procedure preOrden(a: Arbol);
	begin
		if ( a <> nil ) then begin
			write (a^.dato); //o cualquier otra acción
			enOrden (a^.HI);
			enOrden (a^.HD);
		end;
	end;
	```
- Recorrido **postOrden**: hijoIzq - hijoDer - raíz
	```Pascal
	Procedure postOrden (a: Arbol);
	begin
		if ( a <> nil ) then begin
			enOrden (a^.HI);
			enOrden (a^.HD);
			write (a^.dato); //o cualquier otra acción
		end;
	end;
	```

### 3. Búsqueda: Elemento mínimo y máximo.

```Pascal
Function minimo(a: Arbol): integer
begin
    if ( a^.HI = nil ) then
        minimo:= a^.dato
    else
        minimo:= minimo(a^.HI):
end;
```

```Pascal
Function maximo(a: Arbol): integer
begin
    if ( a^.HD = nil ) then
        minimo:= a^.dato;
    else
        minimo:= minimo(a^.HD);
end;
```

### 4. Búsqueda: Nodo mínimo y máximo.
```Pascal
Function minimoNodo(a: Arbol): Arbol;
begin
    if (a = nil) then
        minimoNodo:= nil
    else
        if (a^.HI = nil) then
            minimoNodo:= a
        else
            minimoNodo:= minimoNodo(a^.HI);
end;
```

```Pascal
Function maximoNodo(a: Arbol): Arbol;
begin
    if (a = nil) then
        minimoNodo:= nil
    else
        if (a^.HD = nil) then
            minimoNodo:= a
        else
            minimoNodo:= minimoNodo(a^.HD);
end;
```

### 5. Busqueda: Devolver si se encuentra el elemento en la estructura.

```Pascal
Function buscarElemento(a: Arbol; x: interger): boolean;
begin
    if (a = nil) then
        buscarElemento:= false;
    else
        if (a^.dato = x) then
            buscarElemento:= true;
        else
            if (a^.dato > x) then
                buscarElemento:= buscar(a^.HI, x);
            else
                buscarElemento:= buscarElemento(a^.HD, x)
end;
```

### 6. Busqueda: Devolver el nodo donde se encuentra el elemento.
```Pascal
Function buscarNodo(a: Arbol; x: interger): Arbol;
begin
    if (a = nil) then
        buscarNodo:= nil
		else
			if (a^.dato = x) then
				buscarNodo:= a
    		else
      			if (a^.dato > x) then
          			buscarNodo:= bucar(a^.HI, x);
        		else
          	  		buscarNodo:= buscarNodo(a^.HD, x);         
end;
```

### Generar vector a partir de Árbol.
```pascal
Procedure RetornarVec(A: Arbol; numA, numB: integer; numCat: rng_categoria; var v: vecEmpleados; var dimL);

Begin
	if (A <> nil) then
		if (A^.datos.nroLegajo > numA) then
			if(A^.datos.nroLegajo < numB) then begin
				if(A^.datos.categoria = numCat) and (dimL < dimF) then begin
					dimL:= dimL + 1;
					v[dimL].Dni:= a^.datos.Dni;
					v[dimL].nroLegajo:= a^.datos.nroLegajo;
					end;
				RetornarVec(A^.hi, numA, numB, numCat, v, dimL);
				RetornarVec(A^.hd, numA, numB, numCat, v, dimL);
			end;
		else
			RetornarVec(A^.hi, numA, numB, numCat, v, dimL)
		else
			RetornarVec(A^.hd, numA, numB, numCat, v, dimL);
				

End
```

## Listas

- Una **lista** es una estructura de datos lineal compuesta por nodos. 

- Cada nodo de la lista posee el dato que almacena la lista y la dirección del siguiente nodo. Toda lista puede recorrerse a partir de su primer elemento.

- Los elementos no necesariamente está en posiciones contiguas de memoria.

- Para generar nuevos elementos en la lista, o eliminar alguno se deben utilizar las operaciones de `new` y `dispose` respectivamente.

- Características: homogénea, dinámica, de acceso secuencial, y lineal (le sigue y antecede un único elemento).

### Crear Lista: Merge.

```pascal
CONST
	VALOR_ALTO = 'ZZZ';
	MAX_listas = 5;

Type
	str20 = string[20];

	rango_listas = 1..MAX_listas;

	lista = ^nodo;
	nodo = record
		dato: string;
		sig: lista;
	end;
	
	vec_listas = array [rango_listas] of lista;
	
{______________________________Merge______________________________}
Procedure Merge(listas: vec_listas; var listaNueva: lista);

	procedure minimo(var v: vec_listas; var min: str20);			//Minimo
	{v es pasado por referencia porque hay que ir avanzando en las listas del vector}
	var
		posMin, i: rango_listas;
	begin
		min:= VALOR_ALTO;
		
		for i:= 1 to MAX_listas do
			if ((v[i] <> nil) and (v[i]^.dato <= min)) then begin
				{si no se terminó la lista de la posición determinada del vector y el 
				contenido del nodo es menor al dato que tengo, actualizo el mínimio}
				posMin:= i;
				min:= v[i]^.dato;
			end;
			
		if (min <> VALOR_ALTO) then
			{una vez que conseguimos el nodo mínimo en el vector, avanzamos en la lista
			asociada al nodo}
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure agregarAtras(var l: lista; dato: str20); 
	var  
	   act, nodo : lista;
	begin 
	   new (nodo);
	   nodo^.dato:= dato;
	   nodo^.sig := nil;
	   if l <> nil then 
	   begin
		   act := l ;
		   while  (act^.sig <> nil) do 
		       act := act^.sig ;
		   act^.sig := nodo ;
	   end
	   else
		   l:= nodo;
	end;

Var																		//Merge
	min: str20;
	
Begin
	listaNueva:= nil;
	minimo(listas, min);
	while (min <> VALOR_ALTO) do begin
		agregarAtras(listaNueva, min);
		minimo(listas, min);
	end;
End;
```

### Crear Lista: Merge Acumulador.

```pascal
CONST
	VALOR_ALTO = 'ZZZ';
	MAX_listas = 5;

Type
	str20 = string[20];

	rango_listas = 1..MAX_listas;
	
	registro = record
		nombre: str20;
		precio: real;
	end;

	lista = ^nodo;
	nodo = record
		datos: registro;
		sig: lista;
	end;
	
	vec_listas = array [rango_listas] of lista;
	
	lista_de_carga = ^nodo_de_carga;
	nodo_de_carga = record
		total: real;
		sig:lista_de_carga;
	end;
	
{______________________________Merge______________________________}
Procedure MergeAcumulador(listas: vec_listas; var listaNueva: lista_de_carga);

	procedure minimo(var v: vec_listas; var min: registro);			//Minimo
	{v es pasado por referencia porque hay que ir avanzando en las listas del vector}
	var
		posMin, i: rango_listas;
	begin
		min.nombre:= VALOR_ALTO;
		
		for i:= 1 to MAX_listas do
			if ((v[i] <> nil) and (v[i]^.datos.nombre <= min.nombre)) then begin
				{si no se terminó la lista de la posición determinada del vector y el 
				contenido del nodo es menor al dato que tengo, actualizo el mínimio}
				posMin:= i;
				min:= v[i]^.datos;
			end;
			
		if (min.nombre <> VALOR_ALTO) then
			{una vez que conseguimos el nodo mínimo en el vector, avanzamos en la lista
			asociada al nodo}
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure agregarAtras(var l: lista_de_carga; dato: real); 
	var  
	   act, nodo : lista_de_carga;
	begin 
	   new (nodo);
	   nodo^.total:= dato;
	   nodo^.sig := nil;
	   if l <> nil then begin
		   act := l ;
		   while  (act^.sig <> nil) do 
		       act := act^.sig ;
		   act^.sig := nodo ;
	   end
	   else
		   l:= nodo;
	end;

Var																		//Merge
	actNombre: str20;
	
	totalDeAcumular: real;
	
	minRegistro: registro;
	
Begin
	listaNueva:= nil;
	
	minimo(listas, minRegistro);
	
	while (minRegistro.nombre <> VALOR_ALTO) do begin
		actNombre:= minRegistro.nombre;
		totalDeAcumular:= 0;
				
		while ((minRegistro.nombre <> VALOR_ALTO) and (minRegistro.nombre = actNombre)) do begin
			totalDeAcumular:= totalDeAcumular + minRegistro.precio;
			minimo(listas, minRegistro);
		end;
		
		agregarAtras(listaNueva, totalDeAcumular);		
	end;
End;
VAR
	listas: vec_listas;
	listaNueva: lista_de_carga;
BEGIN
	MergeAcumulador(listas, listaNueva);
END.
```
