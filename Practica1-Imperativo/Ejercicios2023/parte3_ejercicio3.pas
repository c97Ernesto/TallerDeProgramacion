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
	
	FIN_alumno = 0;
	FIN_materia = -1;

TYPE

	registro_final = record
		codigoMateria: integer;
		nota: integer;
	end;

	lista_finales = ^nodo_final;
	nodo_final = record
		datosFinales: registro_final;
		sig: lista_finales;
	end;
	
	registro_alumno = record
		legajo: integer;
		DNI: integer;
		anioIngreso: integer;
		finales: lista_finales;
	end;
	
	arbol = ^nodo_alumnos;
	nodo_alumnos = record
		hi: arbol;
		hd: arbol;
		datosAlumnos: registro_alumno;
	end;


{________________________________RecorrerListaFinales________________________________}
Procedure RecorrerListaFinales(l: lista_finales);
	procedure mostrarDatosFinales(rFinal: registro_final);
	begin
		Write('FINAL ');
		writeln('Codigo de Materia: ', rFinal.codigoMateria);
		writeln('Nota: ', rFinal.codigoMateria);
		writeln('');
	end;
Begin
	while (l <> nil) do begin
		mostrarDatosFinales(l^.datosFinales);
		l:= l^.sig;
	end;
End;
{________________________________MostrarDatosAlumnos________________________________}	
Procedure MostrarDatosAlumnos(alumno: registro_alumno);
Begin
	Write('ALUMNO ');
	writeln('Legajo: ', alumno.legajo);
	writeln('Dni: ', alumno.DNI);
	writeln('Anio de ingreso: ', alumno.anioIngreso);
	RecorrerListaFinales(alumno.finales);
	writeln('');
End;

{________________________________MostrarAbbAlumnos________________________________}
Procedure MostrarAbbAlumnos(abb: arbol);
Begin
	if (abb <> nil) then begin
		MostrarAbbAlumnos(abb^.hi);
		MostrarDatosAlumnos(abb^.datosAlumnos);
		MostrarAbbAlumnos(abb^.hd);
	end;
End;

	
{________________________________GenerarArbolALumnos________________________________}
Procedure GenerarAbbAlumnos(var abb: arbol);
	
	procedure leerAlumno(var alumno: registro_alumno);
	
		procedure generarListaDeFinales(var listaFinales: lista_finales);
		
			procedure leerFinal(r: registro_final);
			begin
				write('Ingresar codigo materia <> -1: '); readln(r.codigoMateria);
				if (r.codigoMateria <> FIN_materia) then
					write('Ingresar nota: '); readln(r.nota);	
			end;
		
			procedure insertarAdelante(var l: lista_finales; r: registro_final);
			var
				nuevo: lista_finales;
			begin
				new (nuevo);
				nuevo^.datosFinales:= r;
				nuevo^.sig:= l;
				l:= nuevo;
			end;
		
		var
			registroFinal: registro_final;
		begin
			listaFinales:= nil;
			
			leerFinal(registroFinal);
			while (registroFinal.codigoMateria <> FIN_materia) do begin
				insertarAdelante(listaFinales, registroFinal);
				leerFinal(registroFinal);
			end;
		end;
	
	begin
		with alumno do begin
			write('Ingresar Legajo: '); readln(legajo);
			if (legajo <> FIN_alumno) then begin
				write('Ingresar DNI: '); readln(DNI);
				write('Ingresar Anio de Ingreso: '); readln(anioIngreso);
				GenerarListaDeFinales(finales);
			end;
		end;
	end;
	
	procedure insertarNodo(var abb: arbol; a: registro_alumno);
	begin
		if (abb = nil) then begin
			new(abb);
			abb^.datosAlumnos:= a;
			abb^.hi:= nil;
			abb^.hd:= nil;
		end
		else 
			if (a.legajo < abb^.datosAlumnos.legajo) then
				insertarNodo(abb^.hi, a)
			else
				insertarNodo(abb^.hd, a)
	end;

Var
	alumno: registro_alumno;
Begin
	abb:= nil;
	leerAlumno(alumno);
	
	while(alumno.legajo <> FIN_alumno) do begin
		insertarNodo(abb, alumno);
		leerAlumno(alumno);
	end;
End;

{________________________________.b________________________________}
Procedure PuntoB(abb: arbol; legajo: integer);
Begin
	
	if (abb <> nil) then begin
		if (abb^.datosAlumnos.legajo > legajo) then
			PuntoB(abb^.hi, legajo)
			
		else begin
			PuntoB(abb^.hi, legajo);
			MostrarDatosAlumnos(abb^.datosAlumnos);
			PuntoB(abb^.hd, legajo);
		end;
	end;
End;


{________________________________.e CalcularLegajoPromedio________________________________}
Procedure CalcularLegajoPromedio(alumno: registro_alumno; maxLegajo: integer; maxPromedio: integer);

	procedure recorrerLista(l: lista_finales; var promedio: integer);
	var
		sumaNotas: integer;
		cantNotas: integer;
	begin
		sumaNotas:= 0;
		cantNotas:= 0;
		while (l <> nil) do begin
			sumaNotas:= sumaNotas + l^.datosFinales.nota;
			cantNotas:= cantNotas + 1;
			l:= l^.sig;
		end;
		promedio:= sumaNotas div cantNotas;
	end;

Var
	promedio: integer;
Begin
	promedio:= 0;
	recorrerLista(alumno.finales, promedio);
	if (promedio > maxPromedio) then begin
		maxPromedio:= promedio;
		maxLegajo:= alumno.legajo;
	end;
End;

{________________________________.e________________________________}
Procedure PuntoE(abb: arbol; var maxLegajo: integer; var maxPromedio: integer);
Begin
	if (abb <> nil ) then begin
		PuntoE(abb^.hi, maxLegajo, maxPromedio);
		CalcularLegajoPromedio(abb^.datosAlumnos, maxLegajo, maxPromedio);
		PuntoE(abb^.hd, maxLegajo, maxPromedio);
	end;
End;

{________________________________P.P________________________________}
Procedure PuntoF(abb: arbol; valorEntero: integer);
Begin
	if (abb <> nil) then begin
		PuntoF(abb^.hi, valorEntero);
		PuntoF(abb^.hd, valorEntero);
	end;
End;

{________________________________P.P________________________________}
VAR
	alumnos: arbol;
	legajo, maxLegajo, maxPromedio: integer;
BEGIN
	GenerarAbbAlumnos(alumnos);
	
	MostrarAbbAlumnos(alumnos);
	writeln('');
	
	writeln('Ingresar legajo max');
	readln(legajo);
	PuntoB(alumnos, legajo);
	writeln('');
	
	maxLegajo:= 0;
	maxPromedio:= 0;
	PuntoE(abb, maxLegajo, maxPromedio);
	
	
END.
