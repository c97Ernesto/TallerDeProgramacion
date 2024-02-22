PROGRAM P5Ej3;
CONST

    MAX_rubros = 10;
    FIN = -1;
TYPE
    rango_rubros = 1..MAX_rubros;
    
    registro_producto = record
        codigoProducto: integer;
        codigoRubro: rango_rubros;
        stock: integer;
        precioUnitario: integer;
    end;
    
    arbol_codigoProducto = ^nodo_codigoProductos;
    nodo_codigoProductos = record
        hi: arbol_codigoProducto;
        hd: arbol_codigoProducto;
        datosProductos: registro_producto;
    end;
    
    vector_rubros = array [rango_rubros] of arbol_codigoProducto;

{________________________________InicializarArbol________________________________}
Procedure InicializarVectorArboles(var v: vector_rubros);
Var
    i: rango_rubros;
Begin
    for i:= 1 to MAX_rubros do 
        v[i]:= nil;
End;
    
{________________________________P.P________________________________}
Procedure GenerarVectorDeArboles(var v: vector_rubros);

    procedure leerProducto(var r: registro_producto);
    begin
        write('Codigo de Producto: ');
        readln(r.codigoProducto);
        
        if (r.codigoProducto <> FIN) then begin
            write('Codigo de Rubro: ');
            readln(r.codigoRubro);
            write('Stock: ');
            readln(r.stock);
            write('Precio Unitario: ');
            readln(r.precioUnitario);
        end;
    end;
    
    procedure insertarNodo(var a: arbol_codigoProducto; producto: registro_producto);
    begin
        if (a <> nil) then
            if (a^.datosProductos.codigoProducto > producto.codigoProducto) then
                insertarNodo(a^.hi, producto)
            else
                insertarNodo(a^.hd, producto)
        else begin
            new(a);
            a^.hi:= nil;
            a^.hd:= nil;
            a^.datosProductos:= producto;
        end;
    end;

Var
    producto: registro_producto;
    
Begin
    leerProducto(producto);
    while (producto.codigoProducto <> FIN) do begin
        insertarNodo(v[producto.codigoRubro], producto);
        leerProducto(producto);
    end;
End;

{________________________________P.P________________________________}
Procedure MostrarVectorArboles(v: vector_rubros);
    
    procedure mostrarDatos(r: registro_producto);
    begin
        writeln('Codigo Producto: ', r.codigoProducto);
        writeln('Codigo de Rubro: ', r.codigoRubro);
        writeln('Stock: ', r.stock);
        writeln('Precio Unitario: ', r.precioUnitario);
        writeln('');
    end;

    procedure recorrerArbol(a: arbol_codigoProducto);
    begin
        if (a <> nil) then begin
            recorrerArbol(a^.hi);
            mostrarDatos(a^.datosProductos);
            recorrerArbol(a^.hd);
        end;
    end;

Var
    i: rango_rubros;
Begin
    for i:= 1 to MAX_rubros do begin
        writeln('Rubros con código: ', i);
        recorrerArbol(v[i]);
        writeln('');
    end;
End;



{________________________________b.________________________________}
Procedure BuscarCodigo(v: vector_rubros);

    function existeCodigoParaRubro(a: arbol_codigoProducto; codigo: integer): boolean;
    begin
        if (a <> nil) then
            if (a^.datosProductos.codigoProducto = codigo) then
                existeCodigoParaRubro:= true
            else
                if (a^.datosProductos.codigoProducto > codigo) then
                    existeCodigoParaRubro:= existeCodigoParaRubro(a^.hi, codigo)
                else
                    existeCodigoParaRubro:= existeCodigoParaRubro(a^.hd, codigo)
        else
            existeCodigoParaRubro:= false;
    end;
    

Var
    cR: rango_rubros;
    cP: integer;
Begin
    write('Ingresar Codigo de Rubro: ');
    readln(cR);
    write('Ingresar codigo de Producto: ');
    readln(cP);
    if (existeCodigoParaRubro(v[cR], cP)) then
        writeln('Hay un codigo de producto para el rubro ingresado.')
    else
        writeln('No existe codigo de producto para el rubro ingresado');
End;



{________________________________P.P________________________________}


{________________________________P.P________________________________}

Procedure EjercicioC(v: vector_rubros);

    function codigoMayor(a: arbol_codigoProducto): arbol_codigoProducto;
    begin
        if (a^.hd = nil) then
            codigoMayor:= a
        else
            codigoMayor:= codigoMayor(a^.hd);
    end;
    
Var
    i: rango_rubros;
    nodoMax: arbol_codigoProducto;
Begin    
    for i:= 1 to MAX_rubros do Begin
        if (v[i] <> nil) then
            nodoMax:= codigoMayor(v[i]);
            writeln('El mayor codigoProducto para el rubro ', i, ' es: ',nodoMax.datosProductos.codigoProducto);
            writeln('La cantidad de stock para el mayor codigoProducto es: ', nodoMax.datosProductos.stock);
        else
            writeln('No hay datos en el rubro ', i);
    end;
End;

{________________________________P.P________________________________}
VAR
    rubros: vector_rubros;
BEGIN

    InicializarVectorArboles(rubros);
    
    GenerarVectorDeArboles(rubros);
    writeln('');
    writeln('');
    
    MostrarVectorArboles(rubros);
    writeln('');
    writeln('');
    
    BuscarCodigo(rubros);
    writeln('');
    writeln('');
    
    EjercicioC(rubros);
END.








