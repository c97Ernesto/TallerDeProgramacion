{2. Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una 
lista con las entradas vendidas.
Se desea procesar la información de una semana. Se pide:
a. Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de
1 a 7), código de la obra, asiento, monto. La lectura finaliza con el código de obra igual
a 0. Las listas deben estar ordenadas por código de obra de forma ascendente.
b. Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta
lista debe estar ordenada por código de obra de forma ascendente.
c. Realice un módulo recursivo que informe el contenido de la lista generada en b)}

PROGRAM Adicional2;
CONST
	MAXdias = 7;
TYPE
	rng_dias = 1..MAXdias;
	
	{punto a}
	reg_entrada = record
		dia: rng_dias;
		codObra: integer;
		asiento: integer;
		monto: real;
	end;
	
	lista_entradas = ^nodoE;
	nodoE = record
		datos: reg_entrada;
		sig: lista;
	end;
	
	vec_dias = array [rng_dias] of lista;
	
	{punto b}
	reg_obra = record;
		codObra: integer;
		entradasVendidas: integer;
	end;
	
	lista_obras = ^nodoO;
	nodoO = record
		datos: reg_obra;
		sig: lista;
	end;
	
//__________________________________IniVectorListas__________________________________
Procedure InicializarVec(var v: vec_dias);
Begin
	for i:= 1 to MAXdias do 
		v[i]:= nil;
End;
//__________________________________GenerarVectorListas__________________________________
Procedure GenerarVec(var vec: vec_dias);
	
	procedure leerReg(r: reg_entrada);
	begin
		with r do begin
			readln(codObra);
			if (codObra <> 0) then begin
				readln(dia);
				readln(asiento);
				readln(monto);
			end;
		end;
	end;
	
	procedure insertarOrdenado(var l: lista_entradas; r: reg_entrada);
	var
		ant, nodo, act: lista_entradas;
	begin
		new(nodo);
		nodo^.datos:= reg_entrada;
		act:= l;
		while (act <> l) and (act^.datos.codObra < r.codObra) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo;
		else
			ant^.sig:= nodo;
		nodo^.sig:= act;
	end;	 
	
Var
	entrada: reg_entrada;
Begin
	leerReg(entrada);
	while (entrada.codObra <> 0) do begin
		insertarOrdenado(v[entrada.dia], entrada);
		leerReg(entrada);
	end;
End;
//__________________________________PROCEDIMIENTOS__________________________________
Procedure GenerarLista(var l: lista; vec: vec_dias);	{MergeAcumulador}

	procedure minimo(var v: vec_dias; var minC: integer);
	var
		posMin, i: rng_dias;
	begin
		minC:= 999;
		for i:= 1 to MAXdias do
			if ((v[i]) <> nil) and (v[i]^.datos.codObra < minC)) then begin
				posMin:= i;
				minC:= v[i]^.datos.codObra;
			end;
		if (minC <> 999) then
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure agregarAlFinal (var pri: lista_obras; r: reg_obra);
	var 
		act, nue : lista;
	begin
		new (nue);
		nue^.datos:= per;
		nue^.sig := NIL;
		if pri <> Nil then begin
			act := pri ;
			while (act^.sig <> NIL ) do act := act^.sig ;
				act^.sig := nue ;
		end
		else
			pri:= nue;
	end;

Var
	minCod: integer;;
	act: reg_obra;
	
Begin
	l:= nil;
	minimo(vec, minCod);
	while (minCod <> 999) do begin
		act.codObra:= minCod;
		act.entradasVendidas:= 0;
		while (minCod <> 999) and (minCod  = act.codObra) do begin
			act.entradasVendidas:= act.entradasVendidas + 1;
			minimo(vec, minCod);
		end
		agregarAlFinal(l, act);
	end;

End;
//__________________________________MostrarLista__________________________________
Procedure MostrarLista(l: lista);	{Recursivo}
Begin
	if (l <> nil) then begin
		writeln('Codigo de Obra: ', l^.datos.codObra);
		writeln('Cantidad de Entradas Vendidas: ', l^.datos.entradasVendidas);
		MostrarLista(l^.sig);
	end;
End;

//__________________________________P.P__________________________________
VAR
	vector: vec_dias;
	l: lista_obras
BEGIN
	InicializarVec(vector);
	GenerarVec(vector);
	GenerarLista(l, vector);
	MostrarLista(l);
END.