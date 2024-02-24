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

PROGRAM P1Ej1;
CONST
	MAX_ventas = 50;
	FIN = 0;
	
TYPE
	
	rng_vector = 1..MAX_ventas;
	
	rng_cantVentas = 1..99;
	
	rng_codProductos = 1..15;
	
	rng_cantDias = FIN..31;
	
	reg_venta = record
		diaVenta: rng_cantDias;
		codProducto: rng_codProductos;
		cantVendida: integer;
	end;
	
	vec_ventas = array [rng_vector] of reg_venta;
	
	
function aleatorio(): integer;
begin
    randomize;
    aleatorio:= random(14) + 1;
end;

{________________________________a.CargarVector________________________________}
Procedure CargarVector(var ventas: vec_ventas; var dimL: rng_vector);

	procedure cargarDatos(var registro: reg_venta; dia: rng_cantDias);
	begin
		if (dia <> FIN) then begin
			registro.diaVenta:= dia;
			registro.codProducto:= aleatorio();
			write('Ingresar cantidad vendida: ');
			readln(registro.cantVendida);
		end;
	end;

Var
	dia: rng_cantDias;
	venta: reg_venta;
	indice: integer;

Begin
	write('Ingresar dia (<> 0):');
	readln(dia);
	
	indice:= 1;
	while ((dia <> FIN) and (indice <= MAX_ventas)) do begin
		
		cargarDatos(venta, dia);
		
		ventas[indice]:= venta;
		indice:= indice + 1;
		
		write('Ingresar dia (<> 0):');
		readln(dia);
	end;
	
	dimL:= indice - 1;
	
End;

{________________________________byc.MostrarVector________________________________}
Procedure ImprimirVector(v: vec_ventas; dimL: rng_vector);

	procedure mostrarDatosRegistro(r: reg_venta);
	begin
		writeln('Dia: ', r.diaVenta);
		writeln('Codigo de producto: ', r.codProducto);
		writeln('Cantidad vendida: ', r.cantVendida);
		writeln('');
	end;

Var
	i: rng_vector;
Begin
	for i:= 1 to dimL do 
		mostrarDatosRegistro(v[i]);
	
End;


{________________________________c.OrdenarVector________________________________}
Procedure OrdenarVector(var v: vec_ventas; dimL: rng_vector);
Var
	i, j, p: rng_vector;
	r: reg_venta;
Begin
	for i:= 1 to dimL-1 do begin
		p:= i;
		
		for j:= i+1 to dimL do begin
			if (v[j].codProducto >= v[p].codProducto) then
				p:= j;
		end;
		
		r:= v[p];
		v[p]:= v[i];
		v[i]:= r;
	end;
End;

{________________________________e.EliminarDelVector________________________________}
Procedure EliminarEntreDelVector(var v: vec_ventas; var dimL: rng_vector);
	procedure eliminar(var v: vec_ventas; var dimL: rng_vector; n1, n2: integer);
	var
		i, j: integer;
	begin
		j:= 1;
		
		for i:= 1 to dimL do begin
			if (v[i].codProducto < n1) or (v[i].codProducto > n2) then begin
				v[j]:= v[i];
				j:= j + 1;
			end;
		end;
		
		dimL:= j - 1;
	end;
	
Var
	val1, val2: integer;
Begin
	Write('Ingresar valor 1: '); readln(val1);
	Write('Ingresar valor 2: '); readln(val2);
	
	eliminar(v, dimL, val1, val2);
End;


{________________________________g.OrdenarParesDelVector________________________________}

{________________________________P.P________________________________}

VAR
	vectorDeVentas: vec_ventas;
	dimLogica: rng_vector;
BEGIN
	CargarVector(vectorDeVentas, dimLogica);
	ImprimirVector(vectorDeVentas, dimLogica);
	OrdenarVector(vectorDeVentas, dimLogica);
	ImprimirVector(vectorDeVentas, dimLogica);
	EliminarEntreDelVector(vectorDeVentas, dimLogica);
	ImprimirVector(vectorDeVentas, dimLogica);
END.
