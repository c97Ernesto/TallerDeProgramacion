PROGRAM P5Ej4;
CONST

    FIN_reclamo = -1;

TYPE
    
    registro_reclamo = record
        codigoReclamo: integer;
        dni: integer;
        anio: integer;
        tipoReclamo: integer;
    end;
    
    lista_reclamos = ^nodo_reclamos;
    nodo_reclamos = record
        sig: lista_reclamos;
        datosReclamo: registro_reclamo;
    end;
    
    registro_DNI = record
        dni: integer;
        cantReclamos: integer;
        listaReclamos: lista_reclamos;
    end;
    
    arbol_DNIs = ^nodo_DNI;
    nodo_DNI = record
        hi: arbol_DNIs;
        hd: arbol_DNIs;
        datosDni: registro_DNI;
    end;

{________________________________Retornar estructura adecuada________________________________}
Procedure Punto_a(var abbDnis: arbol_DNIs);

    procedure leerReclamo(var r: registro_reclamo);
    begin
        with r do begin
            write('Codigo Reclamo: ');
            readln(codigoReclamo);
            if (codigoReclamo <> FIN_reclamo) then begin
                write('Dni Reclamo: ');
                readln(dni);
                write('Anio Reclamo: ');
                readln(anio);
                write('Tipo Reclamo: ');
                readln(tipoReclamo);
            end;
        end;
    end;
    
    procedure insertarOrdenado(var l: lista_reclamos; r: registro_reclamo);
    var
        antNodo, actNodo, nodo: lista_reclamos;
    begin
        new(nodo);
        nodo^.datosReclamo:= r;
        actNodo:= l;
        while(actNodo <> nil) and (r.codigoReclamo < actNodo^.datosReclamo.codigoReclamo) do begin
            actNodo:= actNodo^.sig;
            antNodo:= actNodo;
        end;
        
        if (actNodo = l) then
            l:= nodo
        else
            antNodo^.sig:= nodo;
            
        nodo^.sig:= actNodo;
    end;

    procedure agregarReclamo(var a: arbol_DNIs; reclamo: registro_reclamo);
    begin
        if (a <> nil) then
            if (a^.datosDni.dni = reclamo.dni) then begin
                a^.datosDni.cantReclamos:= a^.datosDni.cantReclamos + 1;
                insertarOrdenado(a^.datosDni.listaReclamos, reclamo);
            end
            else
                if (a^.datosDni.dni > reclamo.dni) then
                    agregarReclamo(a^.hi, reclamo)
                else
                    agregarReclamo(a^.hd, reclamo)
        else begin
            new(a);
            a^.datosDni.dni:= reclamo.dni;
            a^.datosDni.cantReclamos:= 1;
            a^.datosDni.listaReclamos:= nil;
            insertarOrdenado(a^.datosDni.listaReclamos, reclamo);
            a^.hi:= nil;
            a^.hd:= nil;
        end;
    end;

Var
    reclamo: registro_reclamo;
Begin
    abbDnis:= nil;
    leerReclamo(reclamo);
    while (reclamo.codigoReclamo <> FIN_reclamo) do begin
        agregarReclamo(abbDnis, reclamo);
        leerReclamo(reclamo);
    end;
    
End;

{________________________________Existe el dni?________________________________}
Function existeDni(a: arbol_DNIs; dni: integer): boolean;
    Begin
        if (a <> nil) then begin
            if (a^.datosDni.dni = dni) then
                existeDni:= true
            else
                if (a^.datosDni.dni > dni) then
                    existeDni:= existeDni(a^.hi, dni)
                else
                    existeDni:= existeDni(a^.hd, dni);
        end
        else
            existeDni:= false;
    End;

{________________________________b.________________________________}
Procedure Punto_b(abbDnis: arbol_DNIs);

    function retornarCantReclamos(a:arbol_DNIs; dni: integer): integer;
    begin
        if (a^.datosDni.dni = dni) then
            retornarCantReclamos:= a^.datosDni.cantReclamos
        else
            if (a^.datosDni.dni > dni) then
                retornarCantReclamos:= retornarCantReclamos(a^.hi, dni)
            else
                retornarCantReclamos:= retornarCantReclamos(a^.hd, dni);
    end;

Var
    dni: integer;
Begin
    
    write('Ingresar Dni: ');
    readln(dni);
    
    if (existeDni(abbDnis, dni)) then
        write('La cantidad de reclamos del DNI ', dni, ' es de: ', retornarCantReclamos(abbDnis, dni))
    else
        writeln('No existen reclamos del dni ', dni);
    
End;


{________________________________c.________________________________}
Procedure Punto_c(abbDnis: arbol_DNIs);

    function retornarCantReclamos(a: arbol_DNIs; n1, n2: integer): integer;
    begin
        if (a <> nil) then
            if (a^.datosDni.dni < n1) then
                retornarCantReclamos:= retornarCantReclamos(a^.hd, n1, n2)
            else
                if (a^.datosDni.dni > n2) then
                    retornarCantReclamos:= retornarCantReclamos(a^.hi, n1, n2)
                else
                    retornarCantReclamos:= retornarCantReclamos(a^.hi, n1, n2) + retornarCantReclamos(a^.hd, n1, n2) + a^.datosDni.cantReclamos
        else
            retornarCantReclamos:= 0;
    end;
    
    {procedure retornarCantReclamos(a: arbol_DNIs; n1, n2: integer; var cantReclamos: integer);
    begin
        if (a <> nil) then
            if (a^.datosDni.dni < n1) then
                retornarCantReclamos(a^.hd, n1, n2, cantReclamos)
            else
                if (a^.datosDni.dni > n2) then
                    retornarCantReclamos(a^.hi, n1, n2, cantReclamos)
                else begin
                    cantReclamos:= cantReclamos + a^.datosDni.cantReclamos;
                    retornarCantReclamos(a^.hd, n1, n2, cantReclamos);
                    retornarCantReclamos(a^.hi, n1, n2, cantReclamos);
                end;
    end;}

Var
    dni1, dni2, cantReclamos: integer;
Begin
    write('Ingresar 1er DNI: ');
    readln(dni1);
    write('Ingresar 2do DNI: ');
    readln(dni2);
    cantReclamos:= 0;
    writeln('La cantidad de reclamos es: ', retornarCantReclamos(abbDnis, dni1, dni2));
    {retornarCantReclamos(abbDnis, dni1, dni2, cantReclamos);
    writeln('La cantidad de reclamos es: ', cantReclamos);}
End;


{________________________________d.________________________________}
Procedure Punto_d(abbDnis: arbol_DNIs; var listaReclamos: lista_reclamos);

    procedure recorrerLista(listaReclamos:lista_reclamos; anio: integer; var listaNueva: lista_reclamos);
    
        procedure insertarAdelante(var l: lista_reclamos; r: registro_reclamo);
        var
            nodo: lista_reclamos;
        begin
            new(nodo);
            nodo^.datosReclamo:= r;
            nodo^.sig:= l;
            l:= nodo;
        end;
    
    begin
        while (listaReclamos <> nil) do begin
            if (listaReclamos^.datosReclamo.anio = anio) then
                insertarAdelante(listaNueva, listaReclamos^.datosReclamo);
            listaReclamos:= listaReclamos^.sig;
        end;
    end;

    procedure recorrerArbol(a: arbol_DNIs; anio: integer; var l: lista_reclamos);
    begin
        if (a <> nil) then begin
            recorrerArbol(a^.hi, anio, l);
            recorrerLista(a^.datosDni.listaReclamos, anio, l);
            recorrerArbol(a^.hd, anio, l);
        end;    
    end;

Var
    anio: integer;
Begin
    
    write('Ingresar Año : ');
    readln(anio);
    
    listaReclamos:= nil;
    recorrerArbol(abbDnis, anio, listaReclamos);
    
End;

{________________________________P.P________________________________}
VAR
    abbDnis: arbol_DNIs;
    
    listaReclamos: lista_reclamos;
    
BEGIN

    Punto_a(abbDnis);
    writeln('');
    writeln('');
    
    Punto_b(abbDnis);
    writeln('');
    writeln('');
    
    Punto_c(abbDnis);
    writeln('');
    writeln('');
    
    Punto_d(abbDnis, listaReclamos);
    writeln('');
    writeln('');

END.
