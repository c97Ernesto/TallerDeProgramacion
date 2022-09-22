PROGRAM ejercicio11;
CONST
	FIN = -1;
	MAXgenero = 8;
	VALOR_ALTO = 999;
	
TYPE
	rng_generos = 1..MAXgenero;
	
	reg_Pelicula = record
		codPeli: integer;
		codGen: rng_generos;
		puntajeProm: real;
	end;
	
	lista = ^nodo;
	nodo = record
		datos: reg_Pelicula;
		sig: lista;
	end;
	
	vec_Generos = array [rng_generos] of lista;
	
//________________________Generar Vector de Listas________________________
Procedure GenerarVectorListas(var vG: vec_Generos);
{a. Un módulo que lea los datos de películas y los almacene ordenados por 
código de película y agrupados por código de género, en una estructura de 
datos adecuada. La lectura finaliza cuando se lee el código de película -1.}
	procedure leerInfo(var reg: reg_Pelicula);
	begin
		with reg do begin
			write('Codigo Pelicula: ');
			readln(codPeli);
			
			if (codPeli <> FIN) then begin
				write('Codigo de Genero: ');
				readln(codGen);
				write('Puntaje Promedio: ');
				readln(puntajeProm);
			end;
		end;
	end;
	
	procedure crearListaOrdenada(var l: lista; reg: reg_Pelicula);
	var
		act, nodo, ant: lista;
	begin
		new(nodo);
		nodo^.datos:= reg;
		act:= l;
		while((act <> nil) and (reg.codPeli < act^.datos.codPeli)) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
		else
			ant^.sig:= nodo;
		nodo^.sig:= act
	end;
	
Var
	peli: reg_Pelicula;
Begin
	leerInfo(peli);
	while (peli.codPeli <> FIN) do begin
		crearListaOrdenada(vG[peli.codGen], peli);
		leerInfo(peli);
	end;
End;

//________________________Procedure Merge________________________
{b. Un módulo que reciba la estructura generada en el punto a y retorne una
estructura de datos donde estén todas las películas almacenadas ordenadas por código de
película.}
Procedure Merge(vG: vec_Generos; listaPelis: lista);

	procedure minimo(var v: vec_Generos; min: reg_Pelicula);
	var
		posMin, i: integer;
	begin
		min.codPeli:= VALOR_ALTO;
		for i:= 1 to MAXgenero do begin
			if (v[i] <> nil) then
				if (v[i]^.datos.codPeli < min.codPeli) then begin
					posMin:= i;
					min:= v[i]^.datos;
				end;
		end;
		if (min.codPeli <> VALOR_ALTO) then
			v[posMin]:= v[posMin]^.sig
	
	end;
	
	procedure agregarAtrasLista(var l: lista; reg: reg_Pelicula);
	var
		act, nodo: lista;
	begin
		new(nodo);
		nodo^.datos:= reg;
		nodo^.sig:= nil;
		if (l <> nil) then begin
			act:= l;
			while (act^.sig <> nil) do 
				act:= act^.sig;
			act^.sig:= nodo;
		end
		else
			l:= nodo;
	end;
Var
	min: reg_Pelicula;
Begin
	listaPelis:= nil;
	minimo(vG, min);
	while (min.codPeli <> VALOR_ALTO) do begin
		agregarAtrasLista(listaPelis, min);
		minimo(vG, min);
	end;
End;

//________________________P.P________________________
VAR
	vecGeneros: vec_Generos;
	listaPelis: lista;
BEGIN
	GenerarVectorListas(vecGeneros);
	Merge(vecGeneros, listaPelis)
END.
