{
1. Implementar un programa modularizado para una librería que:
	a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
		código de producto. De cada producto deben quedar almacenados la cantidad total de
		unidades vendidas y el monto total. De cada venta se lee código de venta, código del
		producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
		ventas finaliza cuando se lee el código de venta -1.
	b. Imprima el contenido del árbol ordenado por código de producto.
	c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
		código de producto con mayor cantidad de unidades vendidas.
	d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
		producto y retorne la cantidad de códigos menores que él que hay en la estructura.
	e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
		producto y retorne el monto total entre todos los códigos de productos comprendidos
		entre los dos valores recibidos (sin incluir).
}

PROGRAM P4Ej1;

CONST
	FIN = -1;

TYPE
	
	registro_venta = record
		unidadesVendidas: integer;
		montoTotal: integer;
		codigoVenta: integer;
		codigoProducto: integer;
		precioUnitario: integer;
	end;

	Arbol = ^nodo;
	nodo = record
		hi: Arbol;
		hd: Arbol;
		datos: registro_venta;
	end;
	
	
{________________________________a.GenerarArbolVentas________________________________}
Procedure GenerarArbol(var ventas: Arbol);

	procedure leerDatos(var venta: registro_venta);
	begin
		
		write('Ingresar Codigo de Venta <> -1: ');
		readln(venta.codigoVenta);
		if (venta.codigoVenta <> FIN) then begin
			write('Ingresar Unidades Vendidas: ');
			readln(venta.unidadesVendidas);
			write('Ingresar Monto total: ');
			readln(venta.montoTotal);
			write('Ingresar Codigo de Producto: ');
			readln(venta.codigoProducto);
			write('Ingresar Precio unitario: ');
			readln(venta.precioUnitario);
		end;
	end;
	
	procedure insertarNodo(var abb: Arbol; venta: registro_venta);
	begin
		if (abb <> nil) then
			if (abb^.datos.codigoProducto > venta.codigoProducto) then
				insertarNodo(abb^.hi, venta)
			else
				insertarNodo(abb^.hd, venta)
		else begin
			new(abb);
			abb^.datos:= venta;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end;
	end;

Var
	venta: registro_venta;
	
Begin
	ventas:= nil;
	
	leerDatos(venta);
	while (venta.codigoVenta <> FIN) do begin
		insertarNodo(ventas, venta);
		leerDatos(venta);
	end;	
End;

{________________________________MostrarDatos________________________________}
Procedure mostrarDatos(registro: registro_venta);
Begin
	writeln('unidades vendidas: ', registro.unidadesVendidas);
	writeln('monto total: ', registro. montoTotal);
	writeln('codigo de venta: ', registro.codigoVenta);
	writeln('codigo de producto: ', registro.codigoProducto);
	writeln('precio unitario: ', registro.precioUnitario);
End;

{________________________________b.ImprimirArbol________________________________}
Procedure ImprimirArbol(ventas: Arbol);
Begin
	if (ventas <> nil) then begin
		ImprimirArbol(ventas^.hi);
		mostrarDatos(ventas^.datos);
		ImprimirArbol(ventas^.hd);
	end;
End;

{________________________________c.________________________________}
Procedure RetornarMaxCodigoProducto(arbol: Arbol; var maxCodigoProducto: integer; var maxUnidadesVendidas: integer);	
Begin
	if (arbol <> nil) then begin
		RetornarMaxCodigoProducto(arbol^.hi, maxCodigoProducto, maxUnidadesVendidas);
		if (arbol^.datos.unidadesVendidas > maxUnidadesVendidas) then begin
			maxCodigoProducto:= arbol^.datos.unidadesVendidas;
			maxUnidadesVendidas:= arbol^.datos.unidadesVendidas;
		end;
		RetornarMaxCodigoProducto(arbol^.hd, maxCodigoProducto, maxUnidadesVendidas);
	end;
End;

{________________________________d.________________________________}
Procedure RetornarMenores(arbol: Arbol; codigo: integer);
Begin
	
	if (arbol <> nil) then begin
		if (arbol^.datos.codigoProducto >= codigo) then
			RetornarMenores(arbol^.hi, codigo)
		else begin
			RetornarMenores(arbol^.hi, codigo);
			MostrarDatos(arbol^.datos);
			RetornarMenores(arbol^.hd, codigo);
		end;
	end;
End;

{________________________________e.________________________________}
Procedure RetornarEntre(a: Arbol; c1, c2: integer);
Begin
	if (a <> nil) then
		if (a^.datos.codigoProducto > c2) then
			RetornarEntre(a^.hi, c1, c2)
		else
			if (a^.datos.codigoProducto < c1) then
				RetornarEntre(a^.hd, c1, c2)
			else begin
				RetornarEntre(a^.hi, c1, c2);
				MostrarDatos(a^.datos);
				RetornarEntre(a^.hd, c1, c2)
			end;
End;


{________________________________P.P________________________________}
VAR
	ventas: Arbol;
	minCodigoProducto, maxCodigoProducto, maxUnidadesVendidas: integer;
BEGIN
	{a.}
	GenerarArbol(ventas);
	
	{b.}
	ImprimirArbol(ventas);
	writeln('');
	
	{c.}
	maxUnidadesVendidas:= 0;
	RetornarMaxCodigoProducto(ventas, maxCodigoProducto, maxUnidadesVendidas);
	writeln('El codigo de producto con más unidades vendidas fue: ', maxCodigoProducto);
	writeln('');
	
	{d.}
	write('Ingresar codigo producto: ');
	readln(maxCodigoProducto);
	RetornarMenores(ventas, maxCodigoProducto);
	writeln('');
	
	{e.}
	write('Ingresar valor maximo del rango: ');
	readln(maxCodigoProducto);
	write('Ingresar valor minimo del rango: ');
	readln(minCodigoProducto);
	RetornarEntre(ventas, minCodigoProducto, maxCodigoProducto);
	writeln('')
	
END.
