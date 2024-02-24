{	
2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
	durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
	y mes del préstamo y cantidad de días prestados. Implementar un programa con:
	a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
		los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
		ser eficientes para buscar por ISBN.
		i. En una estructura cada préstamo debe estar en un nodo.
		ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
			(prestar atención sobre los datos que se almacenan).
			
	b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
		grande.
		
	c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
		pequeño.
		
	d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
		módulo debe retornar la cantidad de préstamos realizados a dicho socio.
		
	e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
		módulo debe retornar la cantidad de préstamos realizados a dicho socio.
		
	f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
		ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
		que se prestó.
}
PROGRAM P4Ej2;
CONST
	
	FIN_ISBN = -1;
	
TYPE

	registro_prestamo = record
		numeroISBN: integer;
		numeroSocio: integer;
		dia: integer;
		mes: integer;
		diasPrestados: integer;
	end;
	
	arbol_prestamos = ^nodo_arbolPrestamos;
	nodo_arbolPrestamos = record
		hijoIzquierdo: arbol_prestamos;
		hijoDerecho: arbol_prestamos;
		datos: registro_prestamo;
	end;
	
	lista_prestamos = ^nodo_listaPrestamos;
	nodo_listaPrestamos = record
		siguiente: lista_prestamos;
		datos: registro_prestamo;
	end;
	
	registro_ISBN = record
		numeroISBN: integer;
		listaPrestamos: lista_prestamos;
	end;
		
	
	arbol_ISBN = ^nodo_arbolISBN;
	nodo_arbolISBN = record
		hijoIzquierdo: arbol_ISBN;
		hijoDerecho: arbol_ISBN;
		datos: registro_ISBN;
	end;

{________________________________GenerarArboles________________________________}	
Procedure GenerarArboles(var arbolPrestamos: arbol_prestamos; var arbolISBN: arbol_ISBN);
	
	procedure leerPrestamo(var prestamo: registro_prestamo);
	begin
		with prestamo do begin
			write('Numero de ISBN: ');
			readln(numeroISBN);
		
			if (numeroISBN <> FIN_ISBN) then begin
				write('Numero de Socio: ');
				readln(numeroSocio);
				write('Dia: ');
				readln(dia);
				write('Mes: ');
				readln(mes);
				write('Dias prestados: ');
				readln(diasPrestados);
			end;
		end;
	end;
	
	procedure crearArbolPrestamos(var abb: arbol_prestamos; prestamo: registro_prestamo);
	begin
		if (abb <> nil) then
			if (abb^.datos.numeroISBN > prestamo.numeroISBN) then
				crearArbolPrestamos(abb^.hijoIzquierdo, prestamo)
			else
				crearArbolPrestamos(abb^.hijoDerecho, prestamo)
		else begin
			new(abb);
			abb^.datos:= prestamo;
			abb^.hijoIzquierdo:= nil;
			abb^.hijoDerecho:= nil;
		end;
	end;
	
	procedure crearNodoLista(var l: lista_prestamos; prestamo: registro_prestamo);
	var
		nodo: lista_prestamos;
	begin
		new(nodo);
		nodo^.datos:= prestamo;
		nodo^.siguiente:= l;
		l:= nodo;
	end;
	
	procedure crearArbolISBN(var abb: arbol_ISBN; prestamo: registro_prestamo);
	begin
	
		if (abb = nil) then begin
			new(abb);
			
			abb^.datos.numeroISBN:= prestamo.numeroISBN;
			abb^.datos.listaPrestamos:= nil;
			crearNodoLista(abb^.datos.listaPrestamos, prestamo);
			
			abb^.hijoIzquierdo:= nil;
			abb^.hijoDerecho:= nil;
		end
		else 
			if (abb^.datos.numeroISBN = prestamo.numeroISBN) then
				crearNodoLista(abb^.datos.listaPrestamos, prestamo)
			else
				if (abb^.datos.numeroISBN < prestamo.numeroISBN) then
					crearArbolISBN(abb^.hijoDerecho, prestamo)
				else
					crearArbolISBN(abb^.hijoIzquierdo, prestamo);
	end;

Var
	prestamo: registro_prestamo;
	
Begin
	arbolPrestamos:= nil;
	arbolISBN:= nil;
	
	leerPrestamo(prestamo);
	
	while (prestamo.numeroISBN <> FIN_ISBN) do begin
		crearArbolPrestamos(arbolPrestamos, prestamo);
		crearArbolISBN(arbolISBN, prestamo);
		
		leerPrestamo(prestamo);
	end;
			
End;

{________________________________mostrarDatos________________________________}
Procedure MostrarDatosPrestamos(r: registro_prestamo);
Begin
	writeln('Numero ISBN: ', r.numeroISBN);
	writeln('Numero Socio: ', r.numeroSocio);
	writeln('Dia: ', r.dia);
	writeln('Mes: ', r.mes);
	writeln('Dias Prestados: ', r.diasPrestados);
End;

{________________________________ImprimirPrestamos________________________________}
Procedure ImprimirArbolPrestamos(a: arbol_prestamos);
Begin
	if (a <> nil) then begin
		ImprimirArbolPrestamos(a^.hijoIzquierdo);
		MostrarDatosPrestamos(a^.datos);
		ImprimirArbolPrestamos(a^.hijoDerecho);
	end;
	
End;


{________________________________RecorrerLista________________________________}
Procedure RecorrerListaPrestamos(l: lista_prestamos);
Begin
	while (l <> nil) do begin
		MostrarDatosPrestamos(l^.datos);
		l:= l^.siguiente;
	end;
End;

{________________________________RecorrerLista________________________________}
Procedure RecorrerListaPrestamosTotal(l: lista_prestamos; num: integer; var total: integer);
Begin
	while (l <> nil) do begin
		if (l^.datos.numeroSocio = num) then
			total:= total + 1;
			
		l:= l^.siguiente;
	end;
End;

{________________________________ImprimirISBNs________________________________}
Procedure ImprimirArbolISBN(a: arbol_ISBN);
Begin
	if (a <> nil) then begin
		ImprimirArbolISBN(a^.hijoIzquierdo);
		writeln('Numero de ISBN de la lista: ', a^.datos.numeroISBN);
		RecorrerListaPrestamos(a^.datos.listaPrestamos);
		writeln('');
		ImprimirArbolISBN(a^.hijoDerecho)
	end;
End;

{________________________________RetornarISBNMasGrande________________________________}
Function RetornarIsbnMasGrande(abb: arbol_prestamos): integer;
Begin
	if (abb^.hijoDerecho = nil) then
		RetornarIsbnMasGrande:= abb^.datos.numeroISBN
	else
		RetornarIsbnMasGrande:= RetornarIsbnMasGrande(abb^.hijoDerecho);
End;

{________________________________RetornarISBNMasPequeño________________________________}
Function RetornarIsbnMasPequenio(abb: arbol_ISBN): integer;
Begin
	if (abb^.hijoIzquierdo = nil) then
		RetornarIsbnMasPequenio:= abb^.datos.numeroISBN
	else
		RetornarIsbnMasPequenio:= RetornarIsbnMasPequenio(abb^.hijoIzquierdo);
End;

{________________________________RetornarCantPrestamos_i________________________________}
Procedure RetornarCantPrestamos_i(abb: arbol_prestamos; numeroSocio: integer; var total: integer);
Begin

	if (abb <> nil) then begin
		RetornarCantPrestamos_i(abb^.hijoIzquierdo, numeroSocio, total);
		if (abb^.datos.numeroSocio = numeroSocio) then
			total:= total + 1;
		RetornarCantPrestamos_i(abb^.hijoDerecho, numeroSocio, total);
	end;
End;

{________________________________RetornarCantPrestamos_ii________________________________}
Procedure RetornarCantPrestamos_ii(abb: arbol_ISBN; numeroSocio: integer; var total: integer);
Begin
	
	if (abb <> nil) then begin
		RetornarCantPrestamos_ii(abb^.hijoIzquierdo, numeroSocio, total);
		RecorrerListaPrestamosTotal(abb^.datos.listaPrestamos, numeroSocio, total);
		RetornarCantPrestamos_ii(abb^.hijoDerecho, numeroSocio, total);
	end;
	
End;

{________________________________P.P________________________________}

VAR
	arbolPrestamos: arbol_prestamos;
	arbolISBN: arbol_ISBN;

	numeroSocio, total: integer;
BEGIN
	
	{a.}
	GenerarArboles(arbolPrestamos, arbolISBN);
	if (arbolPrestamos <> nil) then begin
		writeln('ARBOL PRESTAMOS: ');
		ImprimirArbolPrestamos(arbolPrestamos);
		writeln('');
		writeln('');
		writeln('ARBOL ISBN: ');
		ImprimirArbolISBN(arbolISBN);
		writeln(''); 
		writeln('');
		
		{b.}
		writeln('El numero de ISBN mas grande es: ', RetornarIsbnMasGrande(arbolPrestamos));
		writeln('');
		writeln('');
		{c.}
		writeln('El numero de ISBN mas pequenio es: ', RetornarIsbnMasPequenio(arbolISBN));
		writeln('');
		writeln('');
		
		{d.}
		total:= 0;
		write('Ingresar numero de socio: ');
		readln(numeroSocio);
		RetornarCantPrestamos_i(arbolPrestamos, numeroSocio, total);
		writeln('La cantidad de prestamos_i del socio con numero ', numeroSocio, ' es de: ', total);
		{e.}
		total:= 0;
		RetornarCantPrestamos_i(arbolPrestamos, numeroSocio, total);
		writeln('La cantidad de prestamos_ii del socio con numero ', numeroSocio, ' es de: ', total);
		writeln('');
		writeln('');
		
		{}
		
	end;
END.

