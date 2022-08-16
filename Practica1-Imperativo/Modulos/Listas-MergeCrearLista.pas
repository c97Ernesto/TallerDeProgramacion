{MERGE CREAR LISTA}
Procedure Merge(vec: vec_Sucursales; var l: Lista2);
	procedure minimo(var v: vec_Sucursales; var min: reg_Venta);			//Minimo
	var
		posMin, i: rng_sucursal;
	begin
		min.codProducto:= 9999;
		for i:= 1 to MAXsucursales do
			if ((v[i] <> nil) and (v[i]^.datos.codProducto <= min.codProducto)) then begin
				posMin:= i;
				min:= v[i]^.datos;
			end;
		if (min.codProducto <> 9999) then
			v[posMin]:= v[posMin]^.sig;
	end;
	procedure insertarAtras(var l: Lista2; var u: Lista2; r: reg_Venta2);				//AgregarNodo
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
Var																		//Merge
	min: reg_Venta;
	ult: Lista2;
	act: reg_Venta2;
Begin
	l:= nil;
	minimo(vec, min);
	while (min.codProducto <> 9999) do begin
		act.codProducto:= min.codProducto;
		act.cantTotal:= 0;
		while ((min.codProducto <> 9999) and (act.codProducto = min.codProducto)) do begin
			act.cantTotal:= act.cantTotal + min.cantidad;
			minimo(vec, min);
		end;
		insertarAtras(l, ult, act);
	end;
End;