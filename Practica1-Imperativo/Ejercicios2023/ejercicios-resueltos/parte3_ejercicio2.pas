PROGRAM P3Ej2;
CONST
	FIN = 0;
TYPE
	reg_venta = record
		codProducto: integer;
		fecha: string;
		cantUnidadesVendidas: integer;
	end;
	
	reg_producto = record
		codProducto: integer;
		cantUnidadesVendidas: integer;
	end;
	
	arbolVentas = ^nodoArbolVentas;
	nodoArbolVentas = record
		hi: arbolVentas;
		hd: arbolVentas;
		datos: reg_venta;
	end;
	
	arbolProductos = ^nodoArbolProductos;
	nodoArbolProductos = record
		hi: arbolProductos;
		hd: arbolProductos;
		datos: reg_producto
	end;
	
{______________________________GenerarArboles______________________________}
Procedure GenerarArboles(var abbVentas: arbolVentas; var abbProductos: arbolProductos);

	procedure leerVenta(var venta: reg_venta);
	begin
		write('Ingresar còdigo de producto: ');
		readln(venta.codProducto);
		if (venta.codProducto <> FIN) then begin
			write('Ingresar fecha de venta: ');
			readln(venta.fecha);
			write('Ingresar unidades vendidas: ');
			readln(venta.cantUnidadesVendidas);
		end;
	end;
	
	procedure insertarNodoVenta(var abb: arbolVentas; venta: reg_venta);
	begin
		if (abb <> nil) then begin
			if (abb^.datos.codProducto < venta.codProducto) then
				insertarNodoVenta(abb^.hd, venta)
			else
				insertarNodoVenta(abb^.hi, venta);
		end
		else begin
			new(abb);
			abb^.datos:= venta;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end;
	end;
	
	procedure insertarNodoProducto(var abb: arbolProductos; venta: reg_venta);
	begin
		if (abb <> nil) then
			if (abb^.datos.codProducto = venta.codProducto) then
				abb^.datos.cantUnidadesVendidas:= abb^.datos.cantUnidadesVendidas + venta.cantUnidadesVendidas
			else
				if (abb^.datos.codProducto > venta.codProducto) then
					insertarNodoProducto(abb^.hi, venta)
				else
					insertarNodoProducto(abb^.hd, venta)
		else begin
			new(abb);
			abb^.datos.codProducto:= venta.codProducto;
			abb^.datos.cantUnidadesVendidas:= venta.cantUnidadesVendidas;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end;
	end;
Var
	venta: reg_venta;
	
Begin
	abbVentas:= nil;
	abbProductos:= nil;
	leerVenta(venta);
	
	while (venta.codProducto <> FIN) do begin	
		insertarNodoVenta(abbVentas, venta);
		insertarNodoProducto(abbProductos, venta);
		leerVenta(venta);
	end;
End;

{______________________________Imprimir Ventas______________________________}
Procedure ImprimirAbbVentas(abb: arbolVentas);
Begin
	if (abb <> nil) then begin
		ImprimirAbbVentas(abb^.hi);
		write('PRODUCTO ');
		writeln('codProd: ', abb^.datos.codProducto);
		writeln('fecha: ', abb^.datos.fecha);
		writeln('cantUnidadesVendidas: ', abb^.datos.cantUnidadesVendidas);
		ImprimirAbbVentas(abb^.hd);
	end;
End;
{______________________________Imprimir Productos______________________________}
Procedure ImprimirAbbProductos(abb: arbolProductos);
Begin
	if (abb <> nil) then begin
		ImprimirAbbProductos(abb^.hi);
		write('PRODUCTO ');
		writeln('codProd: ', abb^.datos.codProducto);
		writeln('cantUnidadesVendidas: ', abb^.datos.cantUnidadesVendidas);
		ImprimirAbbProductos(abb^.hd);
	end;
End;
{______________________________2.Retornar unidades vendidas abbVentas______________________________}
{Procedure retornarUnidadesVendidasAbbVentas(abb: arbolVentas; cod: integer; var total: integer);
Begin
	if (abb <> nil) then
		if (cod < abb^.datos.codProducto) then
			retornarUnidadesVendidasAbbVentas(abb^.hi, cod, total)
		else
			if (cod > abb^.datos.codProducto) then 
				retornarUnidadesVendidasAbbVentas(abb^.hd, cod, total)
			else begin
				total:= total + abb^.datos.cantUnidadesVendidas;
				retornarUnidadesVendidasAbbVentas(abb^.hi, cod, total);
				retornarUnidadesVendidasAbbVentas(abb^.hd, cod, total);
			end;
	else
		total:= 0;
End;
}
Function retornarUnidadesVendidasAbbVentas(abb: arbolVentas; cod: integer): integer;
Begin
	if (abb <> nil) then
		if (cod < abb^.datos.codProducto) then
			retornarUnidadesVendidasAbbVentas:= retornarUnidadesVendidasAbbVentas(abb^.hi, cod)
		else
			if (cod > abb^.datos.codProducto) then
				retornarUnidadesVendidasAbbVentas:= retornarUnidadesVendidasAbbVentas(abb^.hd, cod)
			else
				retornarUnidadesVendidasAbbVentas:= abb^.datos.cantUnidadesVendidas + retornarUnidadesVendidasAbbVentas(abb^.hi, cod) + retornarUnidadesVendidasAbbVentas(abb^.hd, cod)
	else
		retornarUnidadesVendidasAbbVentas:= 0;
End;

{______________________________3.Retornar unidades vendidas abbProductos______________________________}
Function retornarUnidadesVendidasAbbProductos(abb: arbolProductos; cod: integer): integer;
Begin
	if (abb <> nil) then
		if (cod = abb^.datos.codProducto) then
			retornarUnidadesVendidasAbbProductos:= abb^.datos.cantUnidadesVendidas
		else
			if (cod < abb^.datos.cantUnidadesVendidas) then
				retornarUnidadesVendidasAbbProductos:= retornarUnidadesVendidasAbbProductos(abb^.hi, cod)
			else
				retornarUnidadesVendidasAbbProductos:= retornarUnidadesVendidasAbbProductos(abb^.hd, cod)
	else
		retornarUnidadesVendidasAbbProductos:= 0;
End;
{______________________________P.P______________________________}
VAR
	abbVentas: arbolVentas;
	abbProductos: arbolProductos;
	cod: integer;
BEGIN
	
	GenerarArboles(abbVentas, abbProductos);
	writeln('');
	
	writeln('ABB VENTAS');
	ImprimirAbbVentas(abbVentas);
	writeln('');
	
	writeln('ABB PRODUCTOS');
	ImprimirAbbProductos(abbProductos);
	writeln('');
	
	writeln('Ingresar cod prod a buscar: ');
	readln(cod);
	writeln('ABB VENTAS');
	writeln('La cantidad de unidades vendidas del arbol ventas es: ', retornarUnidadesVendidasAbbVentas(abbVentas, cod));
	writeln('');
	
	writeln('Ingresar cod prod a buscar: ');
	readln(cod);
	writeln('La cantidad de unidades vendidas del arbol productos es: ', retornarUnidadesVendidasAbbProductos(abbProductos, cod));
	writeln('');

END.
