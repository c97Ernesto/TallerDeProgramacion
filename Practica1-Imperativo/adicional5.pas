PROGRAM Ejercicio5
CONST
	codFin = -1;
TYPE
	str50 = string[50];
	rng_sucursal = 1..5;
	
	reg_AsistenciaL = record
		codSucursal: rng_sucursal;
		codCliente: integer;
		DniL: integer
		fecha: str50;
		minutosAsistidos: integer
	end;
	
	Lista = ^nodoL;
	nodoL = record
		datosL: reg_AsistenciaL;
		sig: lista;
	end;
	
	vec_Sucursal = array [rng_sucursal] of lista;
	
	reg_AsistenciaA = record
		DniA: integer;
		cantMinutos: integer
	end;
	
	Arbol = ^nodoA;
	nodoA = record
		datosA: reg_AsistenciaA
		hd: Arbol;
		hi: Arbol;
	end;
		
Procedure GenerarVec(var vec: vec_Sucursal)

	procedure leerRegistro(var r: reg_AsistenciaL);
	begin
		with r do begin
			redln(codCliente)
			if (codCliente <> -1) then begin
				readln(codSucursal)
				readln(Dni);
				readln(fecha);
				readln(minutosAsistidos);
			end;
		end;
	end;
	
	Procedure ArmarNodos (var l:lista; a:asistencia);
	var
		nue,ant,act:lista;
	begin
		new(nue);
		nue^.dato:=a;
		ant:=l;
		act:=l;
		while(act<>nil)and(act^.dato.codCliente < a.codCliente)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(ant=act)then
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
	end;
	
Var
	asistencia: reg_AsistenciaL;
Begin
	leerRegistro(asistencia)
	while (asistencia.codCliente <> -1) do
		ArmarNodos(vec[asistencia.codSucursal], asistencia)
		:= asistencia;
		leerRegistro(asistencia);
	end;
End;

Procedure Minimo (var vs:vectorSucursal; var min:integer);
var
	i,pos:integer;
begin
	pos:=-1;
	min:=999;
	for i:=1 to dimF do begin
		if (vs[i]<>nil) and (vs[i]^.dato.dni <= min)then begin
			min:=vs[i]^.dato.dni;
			pos:=i;
		end;
	end;
	if(pos<>-1)then
	  vs[pos]:=vs[pos]^.sig;
end;
			
Procedure MergeAcumulador (vec: vec_Sucursal; var A: Arbol);

	procedure minimo (var v: vec_Sucursal; var min: integer);
	var
		i, pos: integer;
	begin
		pos:= -1;
		min:= 999;
		for i:= 1 to dimF do begin
			if (v[i] <> nil) and (v[i]^.datosL.Dni <= min)then begin
				min:= v[i]^.datosL.Dni;
				pos:= i;
			end;
		end;
		if(pos <> -1)then
			v[pos]:= v[pos]^.sig;
	end;
	
	Procedure CrearArbol (var a: Arbol; dni: integer; totalAsistencias: integer);
	begin
		if(a = nil)then begin
			new(a);
			a^.datosA.DniA:= dni;
			a^.datosA.cantMinutos:= totalAsistencias;
			a^.hd:=nil;
			a^.hi:=nil;
		end
		else
			if (a^.datoA.dniA < dni) then
				CrearArbol(a^.hd, dni, totalAsistencias)
			else
				CrearArbol(a^.hi, dni, totalAsistencias);
	end;

var
	cantTotal:integer;
	dniAux:integer;
	dniMin:integer;
begin
	A:= nil;
	minimo(vec, dniMin);
	while(dniMin <> 999)do begin
		cantTotal:= 0;
		dniAux:= dniMin;
		while ((dniMin <> 999) and (dniMin = dniAux)) do begin
			cantTotal:= cantTotal + 1;
			minimo(vec, dniMin);
		end;
		CrearArbol(A, dniAux, cantTotal);
	end;
end;

VAR

BEGIN

END.