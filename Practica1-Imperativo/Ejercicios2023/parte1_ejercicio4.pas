{
4.- Una librería requiere el procesamiento de la información de sus productos. De cada
	producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
	
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	
	a. Lea los datos de los productos y los almacene ordenados por código de producto y
		agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
		cuando se lee el precio 0.
		
	b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
	
	c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
		puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
		es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
		
	d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
		métodos vistos en la teoría.
		
	e. Muestre los precios del vector resultante del punto d).
	
	f. Calcule el promedio de los precios del vector resultante del punto d).
}

PROGRAM P1Ej4;

CONST
	MAX_rubros = 8;
	MAX_prodRubro3 = 30;
	FIN = 0;
	
TYPE
	rango_rubros = 1..MAX_rubros;
	rango_prodRubro3 = 0..MAX_prodRubro3;

	registro_producto = record
		codProducto: integer;
		codRubro: rango_rubros;
		precio: real;
	end;
	
	lista_productos = ^nodo;
	nodo = record
		datos: registro_producto;
		sig: lista_productos;
	end;
	
	vector_rubros = array [rango_rubros] of lista_productos;
	
	vector_productosRubro3 = array [rango_prodRubro3] of registro_producto;
	
{________________________________IniciarlizarVector________________________________}
Procedure InicializarVectorDeListas(var v: vector_rubros);
Var
	i: rango_rubros;
Begin
	for i:= 1 to MAX_rubros do
		v[i]:= nil;
End;

{________________________________a.GenerarEstructura________________________________}
Procedure GenerarListaOrdenada(var productos: lista_productos; producto: registro_producto);
Var
	prodAnt, prodAct, prodNuevo: lista_productos;
Begin
	new(prodNuevo);
	prodNuevo^.datos:= producto;
	prodAct:= productos;
	while (prodAct <> nil) and (prodAct^.datos.codProducto < producto.codProducto) do begin
		prodAnt:= prodAct;
		prodAct:= prodAct^.sig;
	end;
	if (prodAct = productos) then
		productos:= prodNuevo
	else
		prodAnt^.sig:= prodNuevo;
	
	
End;

Procedure GenerarVector(var rubros: vector_rubros);
	
	procedure leerProducto(var producto: registro_producto);
	begin
		with producto do begin
			writeln('Ingresar Datos del Producto');
			write('Ingresar precio de producto: '); readln(precio);
			if precio <> FIN then begin
				write('Ingresar codigo de producto: '); readln(codProducto);
				write('Ingresar codigo de rubro: '); readln(codRubro);
			end;
			writeln('');
		end;
	end;
	
Var
	producto: registro_producto;
	
Begin
	
	
	leerProducto(producto);
	while (producto.precio <> FIN) do begin
		GenerarListaOrdenada(rubros[producto.codRubro], producto);
		leerProducto(producto);
	end;
End;

{________________________________MostrarDatos________________________________}
Procedure MostrarDatos(producto: registro_producto);
Begin
	writeln('Codigo de Producto: ', producto.codProducto);
	writeln('Codigo de Rubro: ', producto.codRubro);
	writeln('Precio: ', producto.precio);
	writeln('');
End;

{________________________________RecorrerLista________________________________}
Procedure RecorrerLista(productos: lista_productos);
Begin
	while (productos <> nil) do begin
		MostrarDatos(productos^.datos);
		productos:= productos^.sig;
	end;
End;

{________________________________b.ImprimirDatos________________________________}
Procedure ImprimirDatosDelVectorDeListas(v: vector_rubros);
	
Var
	i: rango_rubros;
Begin
	
	for i:= 1 to MAX_rubros do
		RecorrerLista(v[i]);
End;

{________________________________ImprimirDatosDelVectorDeProductos________________________________}
Procedure ImprimirDatosDeVector(v: vector_productosRubro3; dimL: rango_prodRubro3);
Var
	i: rango_prodRubro3;
Begin
	writeln('Productos del rubro 3: ');
	for i:= 1 to dimL do
		MostrarDatos(v[i]);
End;


{________________________________c.GenerarVectorDelRubro3________________________________}
Procedure GenerarVectorRubro3(var v: vector_productosRubro3; l: lista_productos; var dimL: rango_prodRubro3);
Begin
	dimL:= 0;
	while (l <> nil) and (dimL < MAX_prodRubro3) do begin
		dimL:= dimL + 1;
		v[dimL]:= l^.datos;
		l:= l^.sig;
	end;
End;


{________________________________d.GenerarVectorDeMaximos________________________________}
Procedure OrdenarVector(var v: vector_productosRubro3; dimL: rango_prodRubro3);
Var
	indiceMin, i, j: rango_prodRubro3;
	registroAux: registro_producto;
Begin
	
	for i:= 1 to dimL-1 do begin
		indiceMin:= i;
		
		for j:= i to dimL do
			if (v[j].precio > v[indiceMin].precio) then
				indiceMin:= j;
		
		registroAux:= v[indiceMin];
		v[indiceMin]:= v[i];
		v[i]:= registroAux;
	end;
End;


{________________________________P.P________________________________}
VAR
	vectorDeRubros: vector_rubros;
	
	vectorProdRubro3: vector_productosRubro3;
	dimL: rango_prodRubro3;

BEGIN
	{a.}
	InicializarVectorDeListas(vectorDeRubros);
	GenerarVector(vectorDeRubros);
	{b.}
	ImprimirDatosDelVectorDeListas(vectorDeRubros);
	writeln('');
	{c.}
	GenerarVectorRubro3(vectorProdRubro3, vectorDeRubros[3], dimL);
	ImprimirDatosDeVector(vectorProdRubro3, dimL);
	writeln('');
	{d.}
	OrdenarVector(vectorProdRubro3, dimL);
	ImprimirDatosDeVector(vectorProdRubro3, dimL);
	writeln('');
	{f.}
	
END.
