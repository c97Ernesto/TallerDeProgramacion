PROGRAM P3Ej1;
CONST
	FIN = 0;
	
TYPE
	str30 = String[30];
	
	rango_edades = 1..130;

	registro_socio = record
		numero: integer;
		nombre: str30;
		edad: rango_edades;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: registro_socio;
		hi: arbol;
		hd: arbol;
	end;
	
{________________________________MostrarRegistro________________________________}
Procedure MostrarDatos(socio: registro_socio);
Begin
	writeln('Numero de Socio: ', socio.numero);
	writeln('Nombre de Socio: ', socio.nombre);
	writeln('Edad de Socio: ', socio.edad);
End;

{________________________________MostrarAbbEnOrden________________________________}
Procedure MostrarAbbEnOrden(a: arbol);
Begin
	if (a <> nil) then begin
		MostrarAbbEnOrden(a^.hi);
		MostrarDatos(a^.dato);
		MostrarAbbEnOrden(a^.hd)
	end;
End;

{________________________________a.Generar_Arbol________________________________}
Procedure GenerarABB(var abb: arbol);

	procedure insertarNodo(var abb: arbol; r: registro_socio);
	begin
		if (abb = nil) then begin
			new(abb);
			abb^.dato:= r;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end
		else begin
			if (abb^.dato.numero >= r.numero) then
				insertarNodo(abb^.hi, r)
			else
				insertarNodo(abb^.hd, r);
		end;
	end;
	
	procedure leerSocio(var socio: registro_socio);
	begin
		write('Ingresar numero de socio: ');
		readln(socio.numero);
		if (socio.numero <> FIN) then begin
			write('Ingresar nombre: ');
			readln(socio.nombre);
			write('Ingresar edad: ');
			readln(socio.edad);
		end;
	end;

Var
	socio: registro_socio;
	
Begin
	abb:= nil;
	
	leerSocio(socio);
	while (socio.numero <> FIN) do begin
		insertarNodo(abb, socio);
		leerSocio(socio);
	end;
End;

{________________________________b.________________________________}
{________________________________i.RetornarNumeroMax________________________________}
Function RetornarNumeroMax(abb: arbol): integer;
Begin
	if (abb^.hd = nil) then
		RetornarNumeroMax:= abb^.dato.numero
	else
		RetornarNumeroMax:= RetornarNumeroMax(abb^.hd);
End;

{________________________________ii.RetornarRegistroMin________________________________}
Function RetornarArbolMin(abb: arbol): arbol;
Begin
	if (abb^.hi = nil) then
		RetornarArbolMin:= abb
	else
		RetornarArbolMin:= RetornarArbolMin(abb^.hi)
End;

{________________________________iii.RetornarArbolEdadMax________________________________}
Procedure RetornarEdadMax(abb: arbol; var edadMax: rango_edades);
Begin
	
	if (abb <> nil) then begin
		RetornarEdadMax(abb^.hi, edadMax);
		if (abb^.dato.edad > edadMax) then
			edadMax:= abb^.dato.edad;
		RetornarEdadMax(abb^.hd, edadMax);
	end;	
End;

{________________________________iv.AumentarEdad________________________________}
Procedure AumentarEdad(abb: arbol);
Begin
	if (abb <> nil) then begin
		AumentarEdad(abb^.hi);
		abb^.dato.edad:= abb^.dato.edad + 1;
		AumentarEdad(abb^.hd);
	end;
End;

{________________________________v.BuscarNumeroSocio________________________________}
Function BuscarNumeroSocio(abb: arbol; x: integer): boolean;
Begin
	if (abb = nil) then
		BuscarNumeroSocio:= false
	
	else
		if (abb^.dato.numero = x) then 
			BuscarNumeroSocio:= true
		else
			if (abb^.dato.numero < x) then
				BuscarNumeroSocio:= BuscarNumeroSocio(abb^.hi, x)
			else
				BuscarNumeroSocio:= BuscarNumeroSocio(abb^.hd, x);
End;

{________________________________P.P________________________________}
VAR
	abb: arbol;
	edadMax: rango_edades;
	n: integer;

BEGIN
	Writeln('Ingresar Socios');
	GenerarABB(abb);
	Writeln('');
	
	if (abb <> nil) then begin
		Writeln('Mostrar Socios');
		MostrarAbbEnOrden(abb);
		Writeln('');
		
		Writeln('El numero de Socio mas grande es: ', RetornarNumeroMax(abb));
		Writeln('');
		
		Writeln('Los datos del Socio con numero mas chico son: ');
		MostrarDatos(RetornarArbolMin(abb)^.dato);
		Writeln('');
		
		edadMax:= 1;
		RetornarEdadMax(abb, edadMax);
		Writeln('La edad maxima encontrada es: ', edadMax);
		Writeln('');
		
		AumentarEdad(abb);
		Writeln('Mostrar Socios');
		MostrarAbbEnOrden(abb);
		Writeln('');
		
		Writeln('Ingresar numero de socio a buscar: ');
		readln(n);
		BuscarNumeroSocio(abb, n);
		
	end;
END.
