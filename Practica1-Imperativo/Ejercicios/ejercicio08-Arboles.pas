{
8.Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en 
un árbol binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:
	i. Obtener el número más grande.
	ii. Obtener el número más chico.
	iii. Obtener la cantidad de elementos.
	iv. Informar los números en orden creciente.
	v. Informar los números pares en orden decreciente.
}

PROGRAM ejercicio08;
CONST
	FIN = 0;

TYPE
	
	arbol = ^nodo;
	nodo = record
		dato: integer;
		hi: arbol;
		hd: arbol;
	end;

//________________________Generar Arbol________________________
Procedure GenerarArbol(var abb: arbol);

	procedure crearNodo(var nodo: arbol; n: integer);
	begin
		if (nodo = nil) then begin
			new(nodo);
			nodo^.dato:= n;
			nodo^.hi:= nil;
			nodo^.hd:= nil;
		end
		else begin
			if (n < nodo^.dato) then
				crearNodo(nodo^.hi, n)
			else
				crearNodo(nodo^.hd, n);
		end;
	end;

Var
	num: integer;
Begin
	abb:= nil;
	
	write('Ingresar número (0 finalizar): '); readln(num);
	while (num <> 0) do begin
		crearNodo(abb, num);
		write('Ingresar número (0 finalizar): '); readln(num);
	end;
End;

//________________________Mostrar Arbol________________________
Procedure MostrarArbolEnOrdenCreciente(abb: arbol);
Begin
	if (abb <> nil)	then begin
		MostrarArbolEnOrdenCreciente(abb^.hi);
		writeln(abb^.dato);
		MostrarArbolEnOrdenCreciente(abb^.hd);
	end;
End;

Procedure MostrarArbolEnOrdenDecreciente(abb: arbol);
Begin
	if (abb <> nil)	then begin
		MostrarArbolEnOrdenDecreciente(abb^.hd);
		writeln(abb^.dato);
		MostrarArbolEnOrdenDecreciente(abb^.hi);
	end;
End;

//________________________Obtener Mayor________________________
//	i. Obtener el número más grande.
Function obtenerMax(abb: arbol): arbol;

	function max(a: arbol): arbol;
	begin
		if (a^.hd = nil) then //caso base si el hd del nodo es nil
			max:= a
		else
			max:= max(a^.hd);
	end;

Begin
	if (abb <> nil) then
		ObtenerMax:= max(abb^.hd)
		
	else	//caso base si solo el árbol tiene un nodo
		ObtenerMax:= nil;
End;

//________________________Obtener Menor________________________
//	i. Obtener el número más chico.
Function obtenerMin(abb: arbol): arbol;

	function min(a: arbol): arbol;
	begin
		if (a^.hi = nil) then //caso base si el hd del nodo es nil
			min:= a
		else
			min:= min(a^.hi);
	end;

Begin
	if (abb <> nil) then
		ObtenerMin:= min(abb^.hi)
		
	else	//caso base si solo el árbol tiene un nodo
		ObtenerMin:= nil;
End;

//________________________Obtener CantElementos________________________
//	iii. Obtener la cantidad de elementos.
Function totalElementos(a: arbol): integer;
begin
	if (a = nil) then
		totalElementos:= 0
	else
		totalElementos:= (totalElementos(a^.hi) + totalElementos(a^.hd) + 1);
end;
//________________________P.P________________________
VAR
	arbolBinarioBusqueda: arbol;
BEGIN
	GenerarArbol(arbolBinarioBusqueda);
	MostrarArbolEnOrdenCreciente(arbolBinarioBusqueda);
    
    if (arbolBinarioBusqueda <> nil) then begin
	    writeln('El elemento máximo del árbol es: ', obtenerMax(arbolBinarioBusqueda)^.dato);
	    writeln('El elemento mínimo del árbol es: ', obtenerMin(arbolBinarioBusqueda)^.dato);
	end;
	
	writeln('La cantidad total de elementos es: ', totalElementos(arbolBinarioBusqueda));
	
	MostrarArbolEnOrdenDecreciente(arbolBinarioBusqueda);
END.
