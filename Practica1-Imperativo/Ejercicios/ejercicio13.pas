PROGRAM Ejercicio13;
CONST
	MAXdias = 7;
TYPE
	rng_dias = 1..MAXdias;
	
	reg_Entrada = record
		Dia: rng_dias;
		CodObra: integer;
		Asiento: integer;
		Monto: real
	end;	
	Lista = ^nodo;
	nodo = record
		datos: reg_Entrada;
		sig: Lista;
	end;

	reg_Obra = record
		CodObra: integer;
		EntradasVendidas: integer;
	end;
	Lista2 = ^nodo2;
	nodo2 = record
		datos: reg_Obra;
		sig: Lista2;
	end;
	
	vec_Dias = array [rng_dias] of lista;
//_____________________________InicializarVector_____________________________
Procedure InicializarVec(var v: vec_Dias);
Var
	i: rng_dias;
Begin
	for i:= 1 to MAXdias do
		v[i]:= nil;
End;
//_____________________________GenerarVector_______________________
Procedure GenerarVec(var vec: vec_Dias);
	procedure leerReg(var r: reg_Entrada);								//leerEntrada
	begin
		with r do begin
			readln(CodObra);
			if (CodObra <> 0) then begin
				readln(Dia);
				readln(Asiento);
				readln(Monto);
			end;
		end;
	end;
	
	procedure insertarOrdenado(var l: Lista; r: reg_Entrada);		//Ordenar por Código de Obra
	var
		ant, nodo, act: Lista;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (r.CodObra <= act^.datos.CodObra) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
			else	
				ant^.sig:= nodo;
		nodo^.sig:= act;
	end;
Var
	entrada: reg_Entrada;
Begin																	//Armar Vector 
	leerReg(entrada);
	while (entrada.CodObra <> 0) do begin
		insertarOrdenado(vec[entrada.Dia], entrada);
		leerReg(entrada);
	end;
End;
//_____________________________MERGE_______________________
Procedure MergeAcumulador(vec: vec_Dias; var l: Lista2);
	procedure minimo(var v: vec_Dias; var min: reg_Entrada);			//Mínimo de los dias
	var
		posMin, i: rng_dias;
	begin
		min.CodObra:= 9999;
		for i:= 1 to MAXdias do
			if ((v[i] <> nil) and (v[i]^.datos.CodObra <= min.CodObra)) then begin
				posMin:= i;
				min:= v[i]^.datos;
			end;
		if (min.CodObra <> 9999) then
			v[posMin]:= v[posMin]^.sig;
	end;
	procedure insertarAtras(var l: Lista2; var u: Lista2; r: reg_Obra);	//Insertamos como venían ordenadas
	var
		nodo: Lista2;
	begin
		new(nodo);
		nodo^.datos:= r;
		nodo^.sig:= nil;
		if (l = nil) then
			l:= nodo
			else
				u^.sig:= nodo;
		u:= nodo;
	end;
Var																		//MergeAcumulador
	min: reg_Entrada;
	act: reg_Obra;
	ult: Lista2;
Begin
	l:= nil;
	minimo(vec, min);
	while (min.CodObra <> 9999) do begin
		act.CodObra:= min.CodObra;
		act.EntradasVendidas:= 0;
		while (min.CodObra <> 9999) and (min.CodObra = act.CodObra) do begin
			act.EntradasVendidas:= act.EntradasVendidas + 1;
			minimo(vec, min);
		end;
		insertarAtras(l, ult, act);
	end;
End;

//_____________________________PP_____________________________
VAR
	vecDias: vec_Dias;
	L: Lista2;
BEGIN
	InicializarVec(vecDias);
	GenerarVec(vecDias);
	MergeAcumulador(vecDias, L);
END.
