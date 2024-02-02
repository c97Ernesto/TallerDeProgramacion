{
1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
	50).
	Implementar un programa que invoque los siguientes módulos:
	a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
		día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
		unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
		ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
	b. Un módulo que muestre el contenido del vector resultante del punto a).
	c. Un módulo que ordene el vector de ventas por código.
	d. Un módulo que muestre el contenido del vector resultante del punto c).
	e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
		valores que se ingresan como parámetros.
	f. Un módulo que muestre el contenido del vector resultante del punto e).
	g. Un módulo que retorne la información (ordenada por código de producto de menor a
		mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
	h. Un módulo que muestre la información obtenida en el punto g).
}

PROGRAM P1Ej1
CONST
	MAX_ventas = 50;
	FIN = 0;
	
TYPE
	
	rng_vecVentas = 1..MAX_ventas;
	
	rng_cantVentas = 1..99;
	
	rng_codProductos = 1..15;
	
	rng_cantDias = FIN..31;
	
	reg_venta = record
		diaVenta: rng_dias;
		codProducto: rng_codProductos;
		cantVendida: integer;
	
	vec_ventas = array [rng_vecVentas] of reg_venta;
	
	
function aleatorio(): integer;
begin
    randomize;
    aleatorio:= random(14) + 1;
end;

Procedure CargarVector(var ventas: vec_ventas)
	procedure cargarDatos(var registro: reg_venta; dia: rng_dias)
	begin
		if (dia <> FIN) then begin
			registro.diaVenta:= dia;
			registro.codProducto:= aleatorio();
			write('Ingresar cantidad vendida: ');
			readln(registro.cantVendida);
	end

Var
	dia: rng_dias
	venta: reg_venta;
	i: integer;

Begin
	write('Ingresar dia (<> 0):');
	readln(dia);
	
	i:= 1;
	while ((dia <> FIN) and (i <= MAX_ventas)) do begin
		cargarDatos(venta, dia);
		
		ventas[i]:= venta;
		i:= i + 1;
		
		write('Ingresar dia (<> 0):');
		readln(dia);
	end;
	
End;


VAR
	vectorDeVentas: vec_ventas;

BEGIN
	CargarVector(vectorDeVentas);
END
