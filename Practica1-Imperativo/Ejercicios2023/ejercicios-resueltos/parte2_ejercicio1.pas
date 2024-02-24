{
1.- Implementar un programa que invoque a los siguientes módulos.
	a. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto, los
		almacene en un vector con dimensión física igual a 10 y retorne el vector.
		
	b. Un módulo que reciba el vector generado en a) e imprima el contenido del vector.
	
	c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector..
	
	d. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
		retorne la cantidad de caracteres leídos. El programa debe informar el valor retornado.
		
	e. Un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y
		retorne una lista con los caracteres leídos.
		
	f. Un módulo recursivo que reciba la lista generada en e) e imprima los valores de la lista en el
		mismo orden que están almacenados.
		
	g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
		la lista en orden inverso al que están almacenados.
}


PROGRAM P2Ej1;
CONST
	dimF = 10;
	FIN = '.';
	
TYPE	
	rango_vector = 1..dimF;
	indice_dimensionLogica = 0..dimF;
	
	vector_caracteres = array [rango_vector] of char;
	
	lista_caracteres = ^nodo;
	nodo = record
		datos: char;
		sig: lista_caracteres;
	end;
	
{________________________________a.GenerarVector________________________________}
	
Procedure GenerarVectorRecursivamente(var vChar: vector_caracteres; var dimL: indice_dimensionLogica);
Var
	caracter: char;
Begin

	if (dimL < dimF) then begin
		write('Ingresar caracter <> ".": ');
		readln(caracter);
		if (caracter <> FIN) then begin
			dimL:= dimL + 1;
			vChar[dimL]:= caracter;
			GenerarVectorRecursivamente(vChar, dimL);
		end;
	end;
	
End;

{________________________________b.ImprimirVector________________________________}
Procedure ImprimirVector(vChar: vector_caracteres; dimL: indice_dimensionLogica);
Var
	posicion: integer;
Begin
	for posicion:= 1 to dimL do
		writeln('Caracter en pos ', posicion, ' : ', vChar[posicion]);
End;

{________________________________c.ImprimirVectorRecursivamente________________________________}
Procedure ImprimirVectorRecursivamente(vChar: vector_caracteres; dimL: indice_dimensionLogica);
Begin
	if (dimL >= 1) then begin
		writeln('Caracter en pos ', dimL, ' : ', vChar[dimL]);
		dimL:= dimL - 1;
		ImprimirVectorRecursivamente(vChar, dimL);
	end;
End;

{________________________________e.GenerarLista________________________________}
Procedure GenerarListaRecursivamente(var lChar: lista_caracteres);

	procedure agregarAdelante(var l: lista_caracteres; c: char);
	var
		nodo: lista_caracteres;
	begin
		new(nodo);
		nodo^.datos:= c;
		nodo^.sig:= l;
		l:= nodo;
	end;

Var
	caracter: char;
Begin
	write('Ingresar caracter: ');
	readln(caracter);
	if (caracter <> FIN) then begin	
		agregarAdelante(lChar, caracter);
		GenerarListaRecursivamente(lChar^.sig);
	end;
End;

{________________________________f.ImprimirListaRecursivamente________________________________}
Procedure ImprimirListaRecursivamente(lChar: lista_caracteres);
Begin
	if (lChar <> nil) then begin
		writeln('Caracer de lista: ', lChar^.datos);
		ImprimirListaRecursivamente(lChar^.sig);
	end;
End;

{________________________________f.ImprimirListaInversamente________________________________}
Procedure ImprimirListaInversamente(lChar: lista_caracteres);
Begin
	if (lChar <> nil) then begin
		ImprimirListaInversamente(lChar^.sig);
		writeln('Caracer de lista: ', lChar^.datos);
	end;
End;

{________________________________P.P________________________________}
VAR
	vectorCaracteres: vector_caracteres;
	dimensionLogica: indice_dimensionLogica;
	
	listaCaracteres: lista_caracteres;
BEGIN
	dimensionLogica:= 0;
	
	{a.}
	GenerarVectorRecursivamente(vectorCaracteres, dimensionLogica);
	writeln('');
	writeln('');
	{b.}
	writeln('VECTOR');
	ImprimirVector(vectorCaracteres, dimensionLogica);
	writeln('');
	writeln('');
	{c.}
	writeln('VECTOR RECURSIVO');
	ImprimirVectorRecursivamente(vectorCaracteres, dimensionLogica);
	writeln('');
	writeln('');
	{e.}
	listaCaracteres:= nil;
	GenerarListaRecursivamente(listaCaracteres);
	writeln('LISTA RECURSIVA');	
	ImprimirListaRecursivamente(listaCaracteres);
	writeln('');
	writeln('');
	
	writeln('LISTA RECURSIVA INVERSAMENTE');	
	ImprimirListaInversamente(listaCaracteres);
END.
