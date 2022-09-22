{8. Escribir un programa que:
a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda. La lectura finaliza con el valor 0.
b. Una vez generado el árbol, realice módulos independientes para:
i. Obtener el número más grande.
ii. Obtener el número más chico.
iii. Obtener la cantidad de elementos.
iv. Informar los números en orden creciente.
v. Informar los números pares en orden decreciente.
Nota: Tener en cuenta que cada número debe aparecer una única vez en el árbol.}
PROGRAM ejercicio08;
TYPE
	Arbol = ^nodo;
	nodo = record
		dato: integer;
		HI: Arbol;
		HD: Arbol;
	end;
//______________________GenerarABB_________________________
Procedure GenerarABB(var A: Arbol);
{a. Implemente un módulo que lea números enteros y los almacene en un árbol
binario de búsqueda. La lectura finaliza con el valor 0.}
	procedure crear(var a: Arbol; n: integer);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= n;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (n < a^.dato) then
				crear(a^.HI, n)
			else
				if (n > a^.dato) then
					crear(a^.HD, n);
		end;
	end;
Var
	num: integer;
Begin
	write('Ingrese un num (0 para finalizar): ');
	readln(num);
	while (num <> 0) do begin
		crear(A, num);
		readln(num);
	end;
End;
//______________________MostrarElementos_________________________
{iv. Informar los números en orden creciente.}
Procedure MostrarElementos(A: Arbol);
Begin
	if (A <> nil) then begin
		MostrarElementos(A^.HI);
		writeln(A^.dato);
		MostrarElementos(A^.HD);
	end;
End;
//______________________CantElementos_________________________
{iii. Obtener la cantidad de elementos.}
Function CantElementos(A: Arbol): integer;
Begin
	if (A <> nil) then 
		CantElementos:= (CantElementos(A^.HI) + CantElementos(A^.HD) + 1)
	else
		CantElementos:= 0;
End;
//______________________Maximo_________________________
{i. Obtener el número más grande.}
Function Maximo(A: Arbol): Arbol;
	function calcular(a: Arbol): Arbol;
	begin
		if (a^.HD = nil) then
			calcular:= a
		else
			calcular:= calcular(a^.HD);
	end;
Begin
	if (a = nil) then
		Maximo:= nil
	else
		Maximo:= calcular(a);
End;
//______________________P.P_________________________
VAR
	ABB: Arbol;
BEGIN
	GenerarABB(ABB);
	MostrarElementos(ABB);
	if (ABB <> nil) then begin
		writeln('El Maximo del ABB es: ', Maximo(ABB)^.dato);
		writeln('La cantidad de elementos es: ',CantElementos(ABB));
	end
	else
		writeln('No hay Elementos');
END.
