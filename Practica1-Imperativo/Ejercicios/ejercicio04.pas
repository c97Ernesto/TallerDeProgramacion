//4. Escribir un programa que:
//	a. Implemente un módulo que genere una lista a partir de la lectura de números
//	enteros. La lectura finaliza con el número -1.
//	b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
//	c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
//	d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado
//	se encuentra en la lista o falso en caso contrario.

PROGRAM ejer04;
CONST
	FIN = -1;

TYPE
	lista_enteros = ^nodo;
	nodo = record
		entero: integer;
		sig: lista_enteros;
	end;
	
//________________________Crear Lista________________________
Procedure CrearLista(var l: lista_enteros);

	procedure generarLista(var ultNodoAgregado: lista_enteros; n: integer);
	var
		nodoNuevo: lista_enteros;
	begin
		new(nodoNuevo);
		nodoNuevo^.entero:= n;
		nodoNuevo^.sig:= nil;
		ultNodoAgregado:= nodoNuevo;
	end;

Var
	num: integer;
	
Begin
	l:= nil;
	
	write('Ingresar Entero (-1 finalizar): ');
	readln(num);
	
	while (num <> FIN) do begin
		generarLista(l, num);
		write('Ingresar Entero (-1 finalizar): ');
		readln(num);
	end;
End;

//________________________Devolver Mínimo________________________
Procedure DevolverMinimo(l: lista_enteros; var min: integer);
Begin
	
	if (l <> nil) then begin
	    
		if (l^.entero < min) then
			min:= l^.entero;
			
		DevolverMinimo(l^.sig, min);	
	end
End;

//________________________Devolver Encontrado________________________
//Procedure DevolverEncontrado(l: lista_enteros; var ok: boolean; n: integer);
//Begin
	//if ((l <> nil) and (not ok)) then begin
		//ok:= (l^.entero = n);
		//DevolverEncontrado(l^.sig, ok, n);
	//end;	
//End;

//________________________P.P________________________
VAR
	enteros: lista_enteros;
	intMin: integer;
BEGIN

	
	CrearLista(enteros);
	
	intMin:= 999;	
	DevolverMinimo(enteros, intMin);
	writeln('El elemento mínimo de la lista fue: ', intMin);
	
//	write('Ingresar el elemento a buscar: ');
//	readln(int);
	//encontrado:= false;
	//DevolverEncontrado(l, encontrado, int);
END.



