{
3. Implementar un programa que contenga:
	a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
		una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
		notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
		número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
		de las materias finaliza con el código de materia -1.
		
	b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
		aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
		
	c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
	
	d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
	
	e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
		legajo impar.
		
	e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
		alumno con mayor promedio.
		
	f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
		retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}

PROGRAM P3Ej3;
CONST
	
	FIN_alumnos = 0;
	FIN_materias = -1;
	
TYPE
	
	registro_materia = record
		codigoMateria: integer;
		notaMateria: integer;
	end;

	lista_materias = ^nodo_materia;
	nodo_materia = record
		sig: lista_materias;
		datos: registro_materia;
	end;
	
	registro_alumno = record
		legajo: integer;
		DNI: integer;
		anioIngreso: integer;
		materias: lista_materias;
	end;
	
	arbol_alumnos = ^nodo_alumno;
	nodo_alumno = record
		hd: arbol_alumnos;
		hi: arbol_alumnos;
		datos: registro_alumno;
	end;
	
	
	
{________________________________a. GenerarEstructura________________________________}
Procedure GenerarAbbAlumnos(var abb: arbol_alumnos);

	procedure leerAlumno(var alumno: registro_alumno);
	
		procedure leerMateria(var materia: registro_materia);
		begin
			write('Codigo de materia: ');
			readln(materia.codigoMateria);
			if materia.codigoMateria <> FIN_materias then begin
				write('Nota de materia: ');
				readln(materia.notaMateria);
			end;
		end;
		
		procedure insertarMateria(var l: lista_materias; r: registro_materia);
		var
			nodo: lista_materias;
		begin
			new(nodo);
			nodo^.datos:= r;
			nodo^.sig:= l;
			l:= nodo;
		end;
	
	var
		materia: registro_materia;
	begin
		write('Número de Legajo: ');
		readln(alumno.legajo);
		if alumno.legajo <> FIN_alumnos then begin
			write('DNI: ');
			readln(alumno.DNI);
			write('Anio de Ingreso: ');
			readln(alumno.anioIngreso);
			
			alumno.materias:= nil;
			leerMateria(materia);
			while (materia.codigoMateria <> FIN_materias) do begin
				insertarMateria(alumno.materias, materia);	//insertar adelante
				leerMateria(materia);
			end;
		end;
	end;
	
	procedure insertarAlumno(var abb: arbol_alumnos; alumno: registro_alumno);
	begin
		if (abb <> nil) then begin
			if (abb^.datos.legajo < alumno.legajo) then
				insertarAlumno(abb^.hd, alumno)
			else
				insertarAlumno(abb^.hi, alumno);
		end
		else begin
			new(abb);
			abb^.datos:= alumno;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end;
	end;

Var
	alumno: registro_alumno;
Begin

	leerAlumno(alumno);
	while(alumno.legajo <> FIN_alumnos) do begin
		insertarAlumno(abb, alumno);
		leerAlumno(alumno);
	end;

End;

{________________________________Mostrar Datos de Alumnos________________________________}

Procedure mostrarDatosAlumnos(alumno: registro_alumno);

	procedure recorrerLista(l: lista_materias);
	
		procedure mostrarDatosMaterias(materia: registro_materia);
		begin
			writeln('Codigo Materia: ', materia.codigoMateria);
			writeln('Nota: ', materia.notaMateria);
			writeln('');
		end;
	
	begin
		while(l <> nil) do begin
			mostrarDatosMaterias(l^.datos);
			l:= l^.sig;
		end;
	end;

Begin
	writeln('Legajo: ', alumno.legajo);
	writeln('DNI: ', alumno.DNI);
	writeln('Anio Ingreso; ', alumno.anioIngreso);
	recorrerLista(alumno.materias);
	writeln('');
End;

{________________________________Imprimir Datos de Alumnos________________________________}
Procedure ImprimirAbbAlumnos(abb: arbol_alumnos);

Begin
	if (abb <> nil) then begin
		ImprimirAbbAlumnos(abb^.hi);
		mostrarDatosAlumnos(abb^.datos);
		ImprimirAbbAlumnos(abb^.hd);
	end;
End;

{________________________________b.________________________________}
Procedure PuntoB(abb: arbol_alumnos);

	procedure imprimirMenores(abb: arbol_alumnos; n: integer);
	begin
		if (abb <> nil) then begin
			if (abb^.datos.legajo > n) then
				imprimirMenores(abb^.hi, n)
			else begin
				imprimirMenores(abb^.hi, n);
				mostrarDatosAlumnos(abb^.datos);
				imprimirMenores(abb^.hd, n);
			end;
		end;	
	end;
	
Var
	legajo: integer;
Begin
	write('Ingresar legajo máximo: ');
	readln(legajo);
	if (abb <> nil) then
		imprimirMenores(abb, legajo)
	else
		writeln('No hay alumnos');
End;

{________________________________c.________________________________}
Procedure PuntoC(abb: arbol_alumnos);

	function retornarMayorLegajo(abb: arbol_alumnos): integer;
	begin
		if (abb^.hd = nil) then
			retornarMayorLegajo:= abb^.datos.legajo
		else
			retornarMayorLegajo:= retornarMayorLegajo(abb^.hd);
	end;

Begin
	
	if (abb <> nil) then writeln('El mayor legajo es: ', retornarMayorLegajo(abb)) else writeln('No hay alumnos');
	
End;

{________________________________d.________________________________}
Procedure PuntoD(abb: arbol_alumnos);

	procedure retornarMayorDni(abb: arbol_alumnos; var maxDni: integer);
	begin
		if (abb <> nil) then begin
			retornarMayorDni(abb^.hi, maxDni);
			if (abb^.datos.DNI > maxDni) then
				maxDni:= abb^.datos.DNI;
			retornarMayorDni(abb^.hd, maxDni);
		end;
	end;

Var
	dni: integer;
Begin
	dni:= 0;
	if (abb <> nil) then begin
		retornarMayorDni(abb, dni);
		writeln('El DNI mayor es: ', dni);
	end;
End;

{________________________________e.________________________________}
Procedure PuntoE(abb: arbol_alumnos);

	procedure retornarCantLegajosImpar(abb: arbol_alumnos; var cant: integer);
	begin
		if (abb <> nil) then begin
			retornarCantLegajosImpar(abb^.hi, cant);
			if ((abb^.datos.legajo mod 2) = 1) then
				cant:= cant + 1;
			retornarCantLegajosImpar(abb^.hd, cant)
		end;
	end;

Var
	cant: integer;
Begin
	if (abb <> nil) then begin
		retornarCantLegajosImpar(abb, cant);
		writeln('La cantidad de legajos impar es de: ', cant);
	end
	else
		writeln('No hay alumnos.');
End;

{________________________________f.________________________________}

{________________________________P.P________________________________}
VAR
	
	alumnos: arbol_alumnos;
	
BEGIN
	{a.}
	GenerarAbbAlumnos(alumnos);
	writeln('');
	writeln('');
	
	ImprimirAbbAlumnos(alumnos);
	writeln('');
	writeln('');
	
	{b.}
	
	PuntoB(alumnos);
	writeln('');
	writeln('');
	
	{c.}
	PuntoC(alumnos);
	writeln('');
	writeln('');
	
	{d.}
	PuntoD(alumnos);
	writeln('');
	writeln('');
	
	{e.}
	PuntoE(alumnos);
	writeln('');
	writeln('');

	{f.}
	
	{g.}
END.
