{
10. Implementar un programa que contenga:
	a. Un módulo que lea información de alumnos de Taller de Programación y almacene
	en una estructura de datos sólo a aquellos alumnos que posean año de ingreso 
	posterior al 2010. Esta estructura debe estar ordenada por legajo y debe ser 
	eficiente para la búsqueda por dicho criterio. De cada alumno se lee legajo, 
	apellido, nombre, DNI y año de ingreso.
	b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
	aquellos alumnos cuyo legajo sea inferior a 15853.
	c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
	aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.
}
PROGRAM ejercicio09;
CONST
	FIN = -1;

TYPE
	str20 = string[20];
	
	rango_anio = 2000..2050;
	
	reg_alumno = record
		legajo: integer;
		apellido: str20;
		nombre: str20;
		dni: integer;
		anioIngreso: rango_anio;
	end;
	
	arbol = ^nodo;
	nodo = record
		datos: reg_alumno;
		hi: arbol;
		hd: arbol;
	end;

//________________________Generar Arbol________________________
Procedure GenerarArbol(var abb: arbol);

	procedure leerRegistro(var r: reg_alumno);
	begin
		write('Ingresar Legajo: ');
		readln(r.legajo);
		if (r.legajo <> FIN) then begin
			write('Ingresar Apellido: ');
			readln(r.apellido);
			write('Ingresar Nombre: ');
			readln(r.nombre);
			write('Ingresar Dni: ');
			readln(r.dni);
			write('Ingresar Año de Ingreso: ');
			readln(r.anioIngreso);
		end;
	end;
	
	procedure crearNodo(var nodo: arbol; registro: reg_alumno);
	begin
		if (nodo = nil) then begin
			new(nodo);
			nodo^.datos:= registro;
			nodo^.hi:= nil;
			nodo^.hd:= nil;
		end
		else begin
			if (registro.legajo < nodo^.datos.legajo) then
				crearNodo(nodo^.hi, registro)
			else
				crearNodo(nodo^.hd, registro);
		end;
	end;

Var
	alumno: reg_alumno;
	
Begin
	abb:= nil;
	
	leerRegistro(alumno);
	
	while (alumno.legajo <> FIN) do begin
	    if (alumno.anioIngreso > 2010) then
		    crearNodo(abb, alumno);
		leerRegistro(alumno);
	end;
End;

//________________________Imprimir Alumno________________________
procedure imprimirAlumno(alumno: reg_alumno);   //impresión en orden
begin
	with (alumno) do begin
        writeln('Legajo: ', legajo);
        writeln('Apellido: ', apellido);
        writeln('Nombre: ', nombre);
        writeln('Dni: ', dni);
        writeln('Año de ingreso: ', anioIngreso);
    end;
end;

//________________________Mostrar Abb________________________
Procedure MostrarAbb(abb: arbol);
Begin
	if (abb <> nil)	then begin
		MostrarAbb(abb^.hi);
		writeln('___________________Alumno___________________');
		imprimirAlumno(abb^.datos);
		MostrarAbb(abb^.hd);
	end;
End;

//________________________Informar Legajos Mayores________________________
Procedure InformarLegajosMayores(abb: arbol);   //impresión en orden
Begin
	
	if (abb <> nil) then begin
	    if (abb^.datos.legajo < 15853) then	//era al revés
	        informarLegajosMayores(abb^.hd)
	    else begin
	        informarLegajosMayores(abb^.hi);
	        writeln('___________________Alumno de legajo mayor___________________');
		    imprimirAlumno(abb^.datos);
		    informarLegajosMayores(abb^.hd);
		end;
	end;
End;

//________________________Informar EnRango________________________
Procedure EnRango(abb: arbol);  //impresión en orden
Begin
	if (abb <> nil) then begin
		if (abb^.datos.legajo < 1258) then
			EnRango(abb^.hd)
		else
			if (abb^.datos.legajo > 7692) then
				EnRango(abb^.hi)
		else begin
			EnRango(abb^.hi);
			writeln('___________________Alumno En Rango___________________');
			imprimirAlumno(abb^.datos);
			EnRango(abb^.hd);
		end;
	end;
End;

//________________________P.P________________________
VAR
	arbolBinarioBusqueda: arbol;
BEGIN
	GenerarArbol(arbolBinarioBusqueda);
	MostrarAbb(arbolBinarioBusqueda);
	InformarLegajosMayores(arbolBinarioBusqueda);
	EnRango(arbolBinarioBusqueda);
END.

