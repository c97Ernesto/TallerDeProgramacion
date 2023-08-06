{
3. Una librería requiere el procesamiento de la información de sus productos. De cada
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
PROGRAM ejercicio03_Libreria;
CONST
    MAX_rubros = 8;
    FIN = 0;
    MAX_productos = 30;

TYPE

    rng_rubros = 1..MAX_rubros;
    
    rng_productos = 0..MAX_productos;

    reg_producto = record
        codProducto: integer;
        codRubro: integer;
        precio: real;    
    end;    

    lista_productos = ^nodo;
    nodo = record
        datos: reg_producto;
        sig: lista_productos;
    end;

    vec_rubros = array [rng_rubros] of lista_productos;

    vec_productos = array [rng_productos] of reg_producto;

//______________________________InicilizarListas_______________________________
Procedure InicializarListasDelVector(var v: vec_rubros);
Var
    i: rng_rubros;
Begin
    for i:= 1 to MAX_rubros do 
        v[i]:= nil;
End;

//______________________________GenerarVectorDeListas_______________________________
Procedure GenerarVectorDeListas(var vRubros: vec_rubros);

    procedure leerRegistro(var registro: reg_producto);
	begin
		with registro do begin
			write('Ingrese precio: ');
			readln(precio);			

			if (precio <> FIN) then begin
			    write('Ingrese código de producto: ');
			    readln(codProducto);
				write('Ingrese código de rubro: ');
				readln(codRubro);

			end;
		end;
	end;
	
	procedure insertarOrdenado(var punteroNodoInicial: lista_productos; registro: reg_producto);
	var
		punteroNodoAct, punteroNodoNuevo, punteroNodoAnterior: lista_productos;
	begin
		new(punteroNodoNuevo);
		punteroNodoNuevo^.datos:= registro;
		punteroNodoAct:= punteroNodoInicial;
		while ((punteroNodoAct <> nil) and (punteroNodoAct^.datos.codProducto <= registro.codProducto)) do begin
			punteroNodoAnterior:= punteroNodoAct;
			punteroNodoAct:= punteroNodoAct^.sig;
		end;
		{si apuntan a la misma dirección (nil) -> lista solamente inicializada}
		if (punteroNodoAct = punteroNodoInicial) then
			punteroNodoInicial:= punteroNodoNuevo	//hago que el primer elemento de la lista sea el nodo creado
			
		{si no era el primer elemento}	
		else
			punteroNodoAnterior^.sig:= punteroNodoNuevo;
			
		punteroNodoNuevo^.sig:= punteroNodoAct; //si nodo nuevo es el primero el campo sig tendrá nil, sino el que le sigue
	end;

Var
    producto: reg_producto;
Begin

    leerRegistro(producto);

    while (producto.precio <> FIN) do begin
        insertarOrdenado(vRubros[producto.codRubro], producto);
        leerRegistro(producto);
    end;

End;

//______________________________GenerarVecRubro3_______________________________
Procedure GenerarVectorProductos(l: lista_productos; var v: vec_productos; var dimL: rng_productos);
Begin
    dimL:= 0;
    while ((l <> nil) and (dimL < MAX_productos)) do begin
        dimL:= dimL + 1;
        v[dimL]:= l^.datos;
        l:= l^.sig;
    end;
End;

//______________________________OrdenarVectorProductos_______________________________
Procedure OrdenarVectorProductos(var v: vec_productos);
Var
    i, j, minPos: rng_productos;
    regAux: reg_producto;
Begin
    
    for i:= 1 to MAX_productos-1 do begin
        minPos:= i;
        
        for j:= i+1 to MAX_productos do begin
            if (v[minPos].precio < v[j].precio) then
                minPos:= j;
        end;
        
        regAux:= v[minPos];
        v[minPos]:= v[i];
        v[i]:= regAux;
    
    end;
End;

//______________________________P.P_______________________________
VAR
    vecDeRubros: vec_rubros;
    vectorProductos: vec_productos;
    dimLogica: rng_productos;

BEGIN
    InicializarListasDelVector(vecDeRubros);
    GenerarVectorDeListas(vecDeRubros);
    GenerarVectorProductos(vecDeRubros[3] ,vectorProductos, dimLogica);
END.
