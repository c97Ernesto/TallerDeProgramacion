PROGRAM P2Ej2;
CONST
	dimF = 10;
	FIN = '.';
	
TYPE	
	rango_vector = 0..dimF;
	
	vector_caracteres = array [rango_vector] of char;
	
	lista_caracteres = ^nodo;
	nodo = record
		datos: char;
		sig: lista_caracteres;
	end;
	
{________________________________a.GenerarVector________________________________}
	
Procedure GenerarVectorRecursivamente(var vChar: vector_caracteres; var dimL: rango_vector);
Var
	caracter: char;
Begin

	if (dimL < dimF) then begin
		write('Ingresar caracter: ');
		readln(caracter);
		if (caracter <> FIN) then begin
			dimL:= dimL + 1;
			vChar[dimL]:= caracter;
			GenerarVectorRecursivamente(vChar, dimL);
		end;
	end;
	
End;

{________________________________c.ImprimirVector________________________________}
Procedure ImprimirVector(vChar: vector_caracteres; dimL: rango_vector);
Var
	caracter: integer;
Begin
	for caracter:= 1 to dimL do
		writeln('Caracter en pos ', caracter, ' : ', vChar[caracter]);
End;

{________________________________c.ImprimirVectorRecursivamente________________________________}
Procedure ImprimirVectorRecursivamente(vChar: vector_caracteres; dimL: rango_vector);
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

{________________________________e.ImprimirListaRecursivamente________________________________}
Procedure ImprimirListaRecursivamente(lChar: lista_caracteres);
Begin
	if (lChar <> nil) then begin
		writeln('Caracer de lista: ', lChar^.datos);
		ImprimirListaRecursivamente(lChar^.sig);
	end;
End;

{________________________________P.P________________________________}
VAR
	vectorCaracteres: vector_caracteres;
	dimensionLogica: rango_vector;
	
	listaCaracteres: lista_caracteres;
BEGIN
	dimensionLogica:= 0;
	
	{a.}
	GenerarVectorRecursivamente(vectorCaracteres, dimensionLogica);
	writeln('');
	{b.}
	writeln('VECTOR');
	ImprimirVector(vectorCaracteres, dimensionLogica);
	writeln('');
	{c.}
	writeln('VECTOR RECURSIVO');
	ImprimirVectorRecursivamente(vectorCaracteres, dimensionLogica);
	writeln('');
	{e.}
	listaCaracteres:= nil;
	GenerarListaRecursivamente(listaCaracteres);
	writeln('LISTA RECURSIVA');	
	ImprimirListaRecursivamente(listaCaracteres);
END.
