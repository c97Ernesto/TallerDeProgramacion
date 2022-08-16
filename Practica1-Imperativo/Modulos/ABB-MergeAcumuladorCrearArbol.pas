{MERGE ACUMULADOR CREAR ARBOL}
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