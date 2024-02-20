PROGRAM P5Ej2;
CONST
	FIN = 'fin';
	
TYPE
	
	str30 = string[30];
	rango_anios = 2010..2018;
	
	registro_auto = record
		patente: str30;
		anioFabricacion: rango_anios;
		marca: str30;
		modelo: str30;
	end;	
	
	lista_autos = ^nodo_listaAutos;
	nodo_listaAutos = record
		sig: lista_autos;
		datos: registro_auto;
	end;
	
	registro_marca = record
		marca: str30;
		autos: lista_autos;
	end;
	
	arbol_patentes = ^nodo_arbolPatente;
	nodo_arbolPatente = record
		hi: arbol_patentes;
		hd: arbol_patentes;
		datos: registro_auto;
	end;
	
	arbol_marcas = ^nodo_arbolMarca;
	nodo_arbolMarca = record
		hi: arbol_marcas;
		hd: arbol_marcas;
		datos: registro_marca;
	end;
	
	
{________________________________a.GenerarArboles________________________________}
Procedure GenerarArboles(var abbPatente: arbol_patentes; var abbMarca: arbol_marcas);
	
	procedure leerAuto(var auto: registro_auto);
	begin
		write('Patente: ');
		readln(auto.patente);
		if (auto.patente <> FIN) then begin
    		with (auto) do begin
    			write('Año de fabricacion: ');
    			readln(anioFabricacion);
    			write('Modelo: ');
    			readln(modelo);
    			write('Marca: ');
    			readln(marca);
    		end;
    	end;
	end;
	
	procedure insertarAdelante(var l: lista_autos; auto: registro_auto);
	var
		nodo: lista_autos;
	begin
		new(nodo);
		nodo^.datos:= auto;
		nodo^.sig:= l;
		l:= nodo;
	end;

	procedure porPatente(var a: arbol_patentes; datos: registro_auto);
	begin
		if (a <> nil) then
			if (a^.datos.patente > datos.patente) then
				porPatente(a^.hi, datos)
			else
				porPatente(a^.hd, datos)
		else begin
			new(a);
			a^.datos:= datos;
			a^.hi:= nil;
			a^.hd:= nil;
		end;				
	end;
	
	procedure porMarca(var a: arbol_marcas; auto: registro_auto);
	begin
		if (a <> nil) then
			if (a^.datos.marca = auto.marca) then
				insertarAdelante(a^.datos.autos, auto)
			else 
				if (a^.datos.marca > auto.marca) then
					porMarca(a^.hi, auto)
				else
					porMarca(a^.hd, auto)
		else begin
			new(a);
			a^.datos.marca:= auto.marca;
			a^.datos.autos:= nil;
			insertarAdelante(a^.datos.autos, auto);
			a^.hi:= nil;
			a^.hd:= nil
		end;
	end;
	
Var
	auto: registro_auto;
	
Begin
	abbPatente:= nil;
	abbMarca:= nil;
	leerAuto(auto);
	while (auto.patente <> FIN) do begin
		porPatente(abbPatente, auto);
		porMarca(abbMarca, auto);
		leerAuto(auto);
	end;
End;

{________________________________mostrarDatosAuto________________________________}
Procedure mostrarDatosAuto(auto: registro_auto);
Begin
	writeln('Patente: ', auto.patente);
	writeln('Anio de Fabricacion: ', auto.anioFabricacion);
	writeln('Modelo: ', auto.modelo);
	writeln('Marca: ', auto.marca);
	writeln('');
End;
{________________________________ImprimirArbolPatentes________________________________}
Procedure ImprimirArbolPatentes(a: arbol_patentes);
Begin
	if (a <> nil) then begin
		ImprimirArbolPatentes(a^.hi);
		mostrarDatosAuto(a^.datos);
		ImprimirArbolPatentes(a^.hd);
	end;
End;

{________________________________RecorrerLista________________________________}
Procedure recorrerListaAutos(l: lista_autos);
Begin
	while (l <> nil) do begin
		mostrarDatosAuto(l^.datos);
		l:= l^.sig;
	end;
End;
{________________________________ImprimirArbolMarcas________________________________}
Procedure ImprimirArbolMarcas(a: arbol_marcas);
Begin
	if (a <> nil) then begin
		ImprimirArbolMarcas(a^.hi);
		writeln('MARCA: ', a^.datos.marca);
		recorrerListaAutos(a^.datos.autos);
		ImprimirArbolMarcas(a^.hd);
	end;
End;
	
{________________________________b.________________________________}
Function RetornarCantAutosPorPatente_1(a: arbol_patentes; marca: str30): integer;
Begin
	if (a <> nil) then
		if (a^.datos.marca = marca) then
			RetornarCantAutosPorPatente_1:= RetornarCantAutosPorPatente_1(a^.hi, marca) + RetornarCantAutosPorPatente_1(a^.hd, marca) + 1
		else
			RetornarCantAutosPorPatente_1:= RetornarCantAutosPorPatente_1(a^.hi, marca) + RetornarCantAutosPorPatente_1(a^.hd, marca)
	else
		RetornarCantAutosPorPatente_1:= 0;
End;

Procedure RetornarCantAutosPorPatente_2(a: arbol_marcas; marca: str30; var total: integer);
Begin
	if (a <> nil) then begin
		RetornarCantAutosPorPatente_2(a^.hi, marca, total);
		if (a^.datos.marca = marca) then
			total:= total + 1;
		RetornarCantAutosPorPatente_2(a^.hd, marca, total);
	end;
End;

{________________________________c.________________________________}
Procedure RetornarCantAutosPorMarca(a: arbol_marcas; marca: str30; var total: integer);
    
    procedure recorrerListaAutos(l: lista_autos; var cantidad: integer);
    begin
        while (l <> nil) do begin
            cantidad:= cantidad + 1;
            l:= l^.sig;
        end;
    end;
    
Begin
	if (a <> nil) then begin
		RetornarCantAutosPorMarca(a^.hi, marca, total);
		if (a^.datos.marca = marca) then
			recorrerListaAutos(a^.datos.autos, total);
		RetornarCantAutosPorMarca(a^.hi, marca, total);
	end;
End;

{________________________________P.P________________________________}

{________________________________P.P________________________________}

{________________________________P.P________________________________}
	
VAR
	arbolPorMarca: arbol_marcas;
	arbolPorPatente: arbol_patentes;
	marca: str30;
	cantidad: integer;

BEGIN
	{a.}
	GenerarArboles(arbolPorPatente, arbolPorMarca);
	writeln('');	
	writeln('');
	ImprimirArbolPatentes(arbolPorPatente);
	writeln('');
	writeln('');
	ImprimirArbolMarcas(arbolPorMarca);
	writeln('');
	writeln('');
	
	{b.}
	write('Ingresar Marca: ');
	readln(marca);
	writeln('La cantidad de autos con esa marca es: ', RetornarCantAutosPorPatente_1(arbolPorPatente, marca));
	writeln('');
	writeln('');
	
	{c.}
	write('Ingresar Marca: ');
	readln(marca);
	cantidad:= 0;
	RetornarCantAutosPorMarca(arbolPorMarca, marca, cantidad);
	writeln('La cantidad de autos con esa marca es: ', cantidad);
	writeln('');
	writeln('');
    
END.


