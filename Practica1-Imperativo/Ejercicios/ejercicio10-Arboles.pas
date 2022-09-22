{10. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.
b. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo sea inferior a 15853.
c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.}
PROGRAM ejercicio10;
CONST
	MINanio = 2010;
TYPE
	rng_legajos = 1258..7692;
	str50 = string[50];
	
	reg_alumno = record
		legajo: integer;
		apellido: str50;
		nombre: str50;
		DNI: integer;
		ingreso: integer;
	end;
	
	Arbol = ^nodo;
	nodo = record
		datos: reg_alumno;
		HI: Arbol;
		HD: Arbol;
	end;

//________________________Generar Arbol________________________
{a. Un módulo que lea información de alumnos de Taller de Programación y almacene
en una estructura de datos sólo a aquellos alumnos que posean año de ingreso posterior
al 2010. Esta estructura debe estar ordenada por legajo y debe ser eficiente para la
búsqueda por dicho criterio. De cada alumno se lee legajo, apellido, nombre, DNI y año de
ingreso.}
Procedure GenerarArbol(var A: Arbol);

	procedure leerReg ( var r: reg_alumno);
	begin
		with r do begin
			write('NUMERO DE LEGAJO: ');
			readln(legajo);
			if (legajo <> -1) then begin
				write('NOMBRE: ');
				readln(nombre);
				write('APELLIDO: ');
				readln(apellido);
				write('DNI: ');
				readln(dni);
				write('AÑO DE INGRESO: ');
				readln(ingreso);
			end;
		end;	
	end;
	
	procedure crearNodo(var a: Arbol; r: reg_alumno);
	begin
		if (a = nil) then begin
			new(a);
			a^.datos:= r;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (a^.datos.legajo > r.legajo) then
				crearNodo(a^.HI, r)
			else
				crearNodo(a^.HD, r);
	end;
	
Var
	alumno: reg_alumno;
Begin
	leerReg(alumno);
	while (alumno.legajo <> -1) do begin
		if (alumno.ingreso > MINanio) then 
			crearNodo(A, alumno);
		leerReg(alumno);
	end;	
End;

//________________________En Rango________________________
{c. Un módulo que reciba la nueva estructura e informe el nombre y apellido de
aquellos alumnos cuyo legajo esté comprendido entre 1258 y 7692.}
Procedure EnRango(A: Arbol);
Begin
	if (A <> nil) then
		 if (A^.datos.legajo > 1258) and (A^.datos.legajo < 7692)then begin 
			 EnRango(A^.HI);
			 writeln ('NOMBRE: ',A^.datos.nombre,' APELLIDO: ',A^.datos.apellido);
			 EnRango(A^.HD);
		end;
End;
//________________________P.P________________________
VAR
	ABB: Arbol;
BEGIN
	GenerarArbol(ABB);
	EnRango(ABB);
END.
