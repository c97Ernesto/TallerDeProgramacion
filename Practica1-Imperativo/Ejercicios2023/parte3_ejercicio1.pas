{
1. Escribir un programa que:
	a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
		binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
		con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
		
	b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
		parámetro y que :
		i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
			retorne dicho valor.
		ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
			recursivo que retorne dicho socio.
		iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
			retorne dicho valor.
		iv. Aumente en 1 la edad de todos los socios.
		v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
			un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
		vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
			un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
		vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
			cantidad.
		viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
			vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
		ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
			número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
			recursivo que reciba los dos valores leídos y retorne dicha cantidad.
		x. Informe los números de socio en orden creciente.
		xi. Informe los números de socio pares en orden decreciente.
}

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

{________________________________vi.BuscarNombreSocio________________________________}
Procedure BuscarNombreSocio(abb: arbol; nombre: str30; var ok: boolean);
Begin
	if (abb <> nil) and (not ok) then begin
		BuscarNombreSocio(abb^.hi, nombre, ok);
		if (abb^.dato.nombre = nombre) then
			ok:= true;
		BuscarNombreSocio(abb^.hi, nombre, ok);
	end;
End;

{________________________________vii.RetornarCantSocios________________________________}
Procedure RetornarCantSocios(abb: arbol; var total: integer);
Begin
	if (abb <> nil) then begin
		RetornarCantSocios(abb^.hi, total);
		total:= total + 1;
		RetornarCantSocios(abb^.hd, total);
	end;
End;

{________________________________viii.RetornarSumaEdades________________________________}
Procedure RetornarSumaEdades(abb: arbol; var suma: integer);
Begin
	if (abb <> nil) then begin
		RetornarCantSocios(abb^.hi, suma);
		suma:= suma + abb^.dato.edad;
		RetornarCantSocios(abb^.hd, suma);
	end;
End;

{________________________________ix.RetornarSociosEntre________________________________}
Procedure RetornarSociosEntre(abb: arbol; n1, n2: integer; var cant: integer);
Begin
	if (abb <> nil) then begin
		RetornarSociosEntre(abb^.hi, n1, n2, cant);
		if (abb^.dato.numero > n1) and (abb^.dato.numero < n2) then
			MostrarDatos(abb^.dato);
		RetornarSociosEntre(abb^.hd, n1, n2, cant)
	end;
End;


{________________________________x.InformarDecreciente________________________________}
Procedure InformarEnOrdenDecreciente(a: arbol);
Begin
	if (a <> nil) then begin
		InformarEnOrdenDecreciente(a^.hd);
		MostrarDatos(a^.dato);
		InformarEnOrdenDecreciente(a^.hi);
	end;
End;


{________________________________P.P________________________________}
VAR
	abb: arbol;
	edadMax: rango_edades;
	n, m, total: integer;
	nombre: str30;
	ok: boolean;

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
		if BuscarNumeroSocio(abb, n) then 
			writeln('Existe un socio con ese numero.')
		else
			writeln('No existe un socio con ese numero.');
		Writeln('');
		
		Writeln('Ingresar nombre de socio a buscar: ');
		readln(nombre);
		ok:= false;
		BuscarNombreSocio(abb, nombre, ok);
		if ok then 
			writeln('Existe un socio con ese nombre.')
		else
			writeln('No existe un socio con ese nombre.');
		Writeln('');
		
		n:= 0;
		RetornarCantSocios(abb, n);
		Writeln('La cantidad de socios es de: ', n);
		Writeln('');
		
		m:= 0;
		RetornarSumaEdades(abb, m);
		Writeln('El promedio de edades es de: ', m div n);
		Writeln('');
	
		Writeln('Ingresar rango: ');
		Write('n1: ');
		readln(n);
		Write('n2: ');
		readln(m);
		RetornarSociosEntre(abb, n, m, total);
		Writeln('La cantidad de socios entre ', n, ' y ', m, ' es de: ', total);
		Writeln('');
		Writeln('');
		
		InformarEnOrdenDecreciente(abb);
	end;
END.
