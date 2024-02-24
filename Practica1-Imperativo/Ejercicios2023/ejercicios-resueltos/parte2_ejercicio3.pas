{
3.- Escribir un programa que:
	a. Implemente un módulo recursivo que genere una lista de números enteros “random”
		mayores a 0 y menores a 100. Finalizar con el número 0.
		
	b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
	
	c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
	d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se	
		encuentra en la lista o falso en caso contrario.
}

PROGRAM P2Ej3;
CONST
	NUM_MAX = 100;
	NUM_MIN = 0;

TYPE

	rango_numeros = NUM_MIN..NUM_MAX;
	
	lista_numeros = ^nodo;
	nodo = record
		dato: rango_numeros;
		sig: lista_numeros;
	end;
	
{________________________________a.Generar_ListaRecusivamente________________________________}
Procedure GenerarListaRecursivamente(var numeros: lista_numeros);

	procedure agregarAdelante(var l: lista_numeros; n: rango_numeros);
	var
		nodo: lista_numeros;
	begin
		new(nodo);
		nodo^.dato:= n;
		nodo^.sig:= l;
		l:= nodo;
	end;

Var
	numero: rango_numeros;
Begin
	write('Ingresar un numero <> 0: ');
	readln(numero);
	//numero:=random(100);
	if (numero <> NUM_MIN) then begin
		agregarAdelante(numeros, numero);
		GenerarListaRecursivamente(numeros);
	end;
End;

{________________________________Imprimir_ListaRecusivamente________________________________}
Procedure ImprimirListaRecursivamente(l: lista_numeros);
Begin
	if (l <> nil) then begin
		write(l^.dato, ' ');
		ImprimirListaRecursivamente(l^.sig);
	end;
End;

{________________________________b.DevolverMinimo________________________________}
Procedure DevolverMinimoRecursivamente(l: lista_numeros; var min: rango_numeros);
Begin
	if (l <> nil) then begin
		if (l^.dato < min) then
			min:= l^.dato;
		DevolverMinimoRecursivamente(l^.sig, min);
	end;
End;

{________________________________c.DevolverMaximo________________________________}
Procedure DevolverMaximoRecursivamente(l: lista_numeros; var max: rango_numeros);
Begin
	if (l <> nil) then begin
		if (l^.dato > max) then
			max:= l^.dato;
		DevolverMinimoRecursivamente(l^.sig, max);
	end;
End;

{________________________________c.DevolverSiSeEncuentra________________________________}
Function DevolverSiSeEncuentra(l: lista_numeros; x: rango_numeros): boolean;
Begin
	DevolverSiSeEncuentra:= false;
	if (l <> nil) then begin
		if (l^.dato = x) then
			DevolverSiSeEncuentra:= true
		else
			DevolverSiSeEncuentra:= DevolverSiSeEncuentra(l^.sig, x);
	end;
End;

{________________________________P.P________________________________}
Var
	listaDeNumeros: lista_numeros;
	x: rango_numeros;
	
BEGIN
	listaDeNumeros:= nil;
	{a.}
	GenerarListaRecursivamente(listaDeNumeros);
	ImprimirListaRecursivamente(listaDeNumeros);
	writeln('');
	{b.}
	x:= 100;
	DevolverMinimoRecursivamente(listaDeNumeros, x);
	Writeln('El minimo es: ', x);
	writeln('');
	{c.}
	x:= 0;
	DevolverMaximoRecursivamente(listaDeNumeros, x);
	Writeln('El maximo es: ', x);
	writeln('');
	{d.}
	write('Ingresar numero a buscar: ');
	readln(x);
	if (DevolverSiSeEncuentra(listaDeNumeros, x)) then
		writeln('Se encontro el numero buscado')
	else
		writeln('No se encontro')
END.
