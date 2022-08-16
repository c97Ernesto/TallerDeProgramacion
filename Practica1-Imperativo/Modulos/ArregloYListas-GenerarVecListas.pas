{GENERAR VECTOR DE LISTAS}
Procedure GenerarVec(var vec: vec_Sucursales);
	procedure leerReg(var r: reg_Venta);								//leer Venta
	begin	
		with r do begin
			writeln('Codigo de Sucursal (0 para terminar):');
			readln(codSucursal);
			if (codSucursal <> 0) then begin
				writeln('Fecha de Venta');
				readln(fecha);
				writeln('Codigo de Producto');
				readln(codProducto);
				writeln('Cantidad vendida del Producto:');
				readln(cantidad);
			end;
		end;
	end;
	procedure insertarOrdenado(var l: Lista; r: reg_Venta);				// ordenarNodos
	var
		ant, nodo, act: Lista;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (r.codProducto <= l^.datos.codProducto) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
			else
				ant^.sig:= nodo;
		nodo^.sig:= act;
	end;
Var																		//Armar Vector
	venta: reg_Venta;
Begin
	leerReg(venta);
	while (venta.codSucursal <> 0) do begin
		insertarOrdenado(vec[venta.codSucursal], venta);
		leerReg(venta);
	end;
End;