{3. Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
finaliza cuando se lee el precio 0.
Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.
c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de
los dos métodos vistos en la teoría.
d. Muestre los precios del vector ordenado.
}

PROGRAM ejercicio03;
CONST
	MAXrubro = 8;
	MAXrubro3 = 30;

TYPE
	rng_Rubros = 1..MAXrubro;
	rng_Rubro3 = 1..MAXrubro3;
	reg_Producto = record
		codProducto: integer;
		codRubro: rng_Rubros;
		precio: real;
	end;
	
	Lista = ^nodo;
	nodo = record
		datos: reg_Producto;
		sig: lista;
	end;
	
	vec_Rubros = array[rng_Rubros] of lista;
	vec_Rubro3 = array[1..MAXrubro3] of reg_Producto;
	
	
//_______________________InicializarVectorRubros_______________________
Procedure IniVecRubros (var v: vec_Rubros);
Var
	i: rng_Rubros;
Begin
	for i:= 1 to MAXrubro do
		v[i]:= nil
end;

//_______________________LeerDatos_Almacenar_______________________
Procedure CargarProductos (var v: vec_Rubros);
{a. Lea los datos de los productos y los almacene •ordenados por código de producto y
agrupados por rubro•, en una estructura de datos adecuada. El ingreso de los productos
finaliza cuando se lee el precio 0.}
	procedure leerProducto(var r: reg_Producto);
	begin
		with r do begin
			readln(precio);
			if (precio <> 0) then begin
				readln(codProducto);
				readln(codRubro);
			end;
		end;
	end;
	
	procedure insertarOrdenado (var l: Lista; r: reg_Producto);
	var
		ant, nodo, act: lista;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (r.codProducto > l^.datos.codProducto) do begin
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
	producto: reg_Producto;
Begin
	leerProducto(producto);
	while (producto.precio <> 0) do begin
		insertarOrdenado(v[producto.codRubro], producto);
		leerProducto(producto);
	end;
End;

//_______________________GenerarVectorRubro3_______________________
{b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.}
Procedure GenerarVecRubro3(l: Lista; var vRubro3: vec_Rubro3; var dl: integer);
Begin
	dl:= 0;
	while ((l <> nil) or (dl <= MAXrubro3)) do begin
		dl:= dl + 1;
		vRubro3[dl]:= l^.datos;	
		l:= l^.sig;
	end;
End;

//_______________________OrdenarVectorRubro3_______________________
{c. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de
los dos métodos vistos en la teoría.}
Procedure OrdenarVecRubro3(var v: vec_Rubro3; dimL: integer);
Var
	i, j, x : rng_Rubro3;
	aux: reg_Producto;
Begin
	for i:= 1 to dimL-1 do begin	{buscamos el minimo y lo guardamos en la pos x}
		x:= i;
		
		for j:= i+1 to dimL do
			if (v[j].codProducto < v[x].codProducto) then
				x:= j;
				
		{intercambiamos elementos con variable auxiliar}
		aux:= v[x];	
		v[x]:= v[i];
		v[i]:= aux;
	end;
End;
//_______________________P.P_______________________
VAR
	vecRubros: vec_Rubros;
	vecRubro3: vec_Rubro3;
	dl: integer;
BEGIN
	IniVecRubros(vecRubros);
	CargarProductos(vecRubros);
	GenerarVecRubro3(vecRubros[3], vecRubro3, dl);
END.


