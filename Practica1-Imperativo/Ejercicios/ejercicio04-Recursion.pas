{4. Escribir un programa que:
a. Implemente un módulo que genere una lista a partir de la lectura de números
enteros. La lectura finaliza con el número -1.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.
}
PROGRAM ejercicio04;
CONST
	FIN = -1;
TYPE
	Lista = ^nodo;
	nodo = record
		entero: integer;
		sig: Lista;
	end;
//________________________GenerarListaEnteros________________________
{a. Implemente un módulo que genere una lista a partir de la 
lectura de números enteros. La lectura finaliza con el número -1.}
Procedure GenerarLista(var l: Lista);

	procedure crearLista(var l: lista; n: integer);
	var
		nodo: Lista;
	begin
		new(nodo);
		nodo^.entero:= n;
		nodo^.sig:= l;
		l:= nodo;
	end;
	
Var
	n: integer;
Begin
	l:= nil;
	writeln('Ingresar Entero: ');
	readln(n);
	while (n <> FIN) do begin
		crearLista(l, n);
		writeln('Ingresar Entero: ');
		readln(n);
	end;
End;

//________________________ImprimirLista________________________
Procedure ImprimirLista(l: Lista);
Begin
	if (l <> nil) then begin
		write(l^.entero);
		ImprimirLista(l^.sig);
	end;
End;

//________________________BuscarMinimo________________________
{c. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.}
Function buscarMin(l: Lista; min: integer): integer;
Begin
	if (l = nil) then
		buscarMin:= min
	else begin
		if (l^.entero < min) then
			min:= l^.entero;
		buscarMin:= buscarMin(l^.sig, min);
	end;
End;

//________________________BuscarElemento________________________
{d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
se encuentra en la lista o falso en caso contrario.}
Function buscarElem(l: Lista; x: integer): boolean;
Begin
	if (l <> nil) then begin
		if (l^.entero = x) then
			buscarElem:= True
		else
			buscarElem:= buscarElem(l^.sig, x);
	end
	else
		buscarElem:= False;
End;

//________________________P.P______________________________________
VAR
	l: Lista;
	min, x: integer;
BEGIN
	min:= 999;
	
	GenerarLista(l);
	writeln('Impresion de Lista: ');
	ImprimirLista(l);
	writeln();
	
	writeln('El minimo es: ', buscarMin(l, min));
	writeln();
	
	write('Ingresar numero a buscar: ');
	readln(x);
	if (buscarElem(l, x)) then
		writeln('El elemento se encontro!');
		
END.
