{12. Implementar un programa que procese la información de las ventas de productos de una
librería que tiene 4 sucursales. De cada venta se lee fecha de venta, código del producto
vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza cuando se
lee el código de sucursal 0.
Implementar un programa que:
a. Almacene las ventas ordenadas por código de producto y agrupados por sucursal,
en una estructura de datos adecuada.
b. Contenga un módulo que reciba la estructura generada en el punto a y retorne
una estructura donde esté acumulada la cantidad total vendida para cada código de
producto.
}
PROGRAM ejercicio12;
CONST
	MAXsucursales = 4;
	FINingresoVentas = 0;
	VALOR_ALTO = 999;
	
TYPE
	indice_sucursal = 0..MAXsucursales;
	rng_sucursal = 1..MAXsucursales;
	
	reg_Venta = record
		fechaVenta: string;
		codProd: integer;
		codSucursal: rng_sucursal;
		cantVendida: integer;
	end;
	reg_VentaTotal = record
		codProd: integer;
		cantTotalVendido: integer;
	end;
	
	lista_Ventas = ^nodo;
	nodo = record
		datos: reg_Venta;
		sig: lista_Ventas;
	end;
	
	lista_VentaTotal = ^nodo2;
	nodo2 = record
		datos: reg_VentaTotal;
		sig: lista_VentaTotal;
	end;
	
	vec_Sucursales = array [rng_sucursal] of lista_Ventas;
	
//_______________________IniVecListas_______________________	
Procedure IniVecListas(var vL: vec_Sucursales);
Var
	i: rng_sucursal;
Begin
	for i:= 1 to MAXsucursales do
		vL[i]:= nil;
End;

//_______________________GenerarVector_______________________	
{a. Almacene las ventas ordenadas por código de producto y agrupados por 
sucursal, en una estructura de datos adecuada.}
Procedure GenerarVectorListas(var vS: vec_Sucursales);

	procedure leerInfo(var reg: reg_Venta);
	begin
		with reg do begin
			write('Codigo Sucursal: ');
			readln(codSucursal);
			if (codSucursal <> FINingresoVentas) then begin
				write('Fecha Venta: ');
				readln(fechaVenta);
				write('Codigo Codigo Producto: ');
				readln(codProd);
				write('Cantidad Vendida: ');
				readln(cantVendida);
			end;
		end;
	end;
	
	procedure generarLista(var l: lista_Ventas; reg: reg_Venta);
	var
		act, nodo, ant: lista_Ventas;
	begin
		new(nodo);
		nodo^.datos:= reg;
		act:= l;
		while ((act <> nil) and (act^.datos.codProd > reg.codProd)) do begin
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
	venta: reg_Venta;
Begin
	leerInfo(venta);
	while(venta.codProd <> FINingresoVentas) do begin
		generarLista(vS[venta.codSucursal], venta);
		leerInfo(venta);
	end;
End;
//_______________________Merge_______________________
{b. Contenga un módulo que reciba la estructura generada en el punto a y 
retorne una estructura donde esté acumulada la cantidad total vendida 
para cada código de producto.}
Procedure Merge(vS: vec_Sucursales; var lista: lista_VentaTotal);
	procedure minimo(var v: vec_Sucursales; var min: reg_Venta);
	var
		posMin, i: rng_sucursal;
	begin
		min.codProd:= VALOR_ALTO;
		for i:= 1 to MAXsucursales do 
			if (v[i] <> nil) then
				if (min.codProd > v[i]^.datos.codProd) then begin
					min:= v[i]^.datos;
					posMin:= i;
				end;
		if (min.codProd <> VALOR_ALTO) then 
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure insertarAtras(var l: lista_VentaTotal; reg: reg_VentaTotal);
	var
		act, nodo: lista_VentaTotal;	
	begin
		new(nodo);
		nodo^.datos:= reg;
		nodo^.sig:= nil;
		if(l <> nil) then begin
			act:= l;
			while(act^.sig <> nil) do 
				act:= act^.sig;
			act^.sig:= nodo;
		end
		else
			l:= nodo;
	end;
	
Var
	min: reg_Venta;
	regAct: reg_VentaTotal;
Begin
	minimo(vS, min);
	while (min.codProd <> VALOR_ALTO) do begin
		regAct.codProd:= min.codProd;
		regAct.cantTotalVendido:= 0;
		
		while((min.codProd <> VALOR_ALTO) and (min.codProd = regAct.codProd)) do begin
			regAct.cantTotalVendido:= regAct.cantTotalVendido + min.cantVendida;
			minimo(Vs, min);
		end;
		
		insertarAtras(lista, regAct);
	end;
End;

//_______________________P.P_______________________
VAR
	vecS: vec_Sucursales;
	listaVentas: lista_VentaTotal;
BEGIN
	IniVecListas(vecS);
	GenerarVectorListas(vecS);
	Merge(vecS, listaVentas);
END.
