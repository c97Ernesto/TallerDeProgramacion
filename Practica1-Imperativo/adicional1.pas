{1. Una aerolínea dispone de un árbol binario de búsqueda con la información de sus
empleados. De cada empleado se conoce: Número de legajo, Dni, Categoría (1..20) y año de
ingreso a la empresa. El árbol se encuentra ordenado por número de legajo. Se solicita:
a. Implementar un módulo que reciba el árbol de empleados, número de legajo “A”,
número de legajo “B” y un número de categoría, y retorne un vector ordenado por
número de legajo. El vector debe contener el número de legajo y Dni de aquellos
empleados cuyo número de legajo se encuentra comprendido entre los números de
legajo recibidos (“A” y “B”, siendo “A” menor que “B”) y la categoría se corresponda con
la recibida por parámetro. Por norma de la empresa, cada categoría puede contar con
a lo sumo 250 empleados.
b. Implementar un módulo recursivo que reciba la información generada en “b” y retorne
el promedio de los números de Dni.}
PROGRAM Adicional1;
CONST
	MAXcategoria = 20;
	MAXempleados = 5;
TYPE
	rng_categoria = 1..MAXcategoria;
	
	reg_Empleado = record
		NroLegajo: integer;
		Dni: integer;
		Categoria: rng_categoria;
		AnioIngreso: integer;
	end;
	
	Arbol = ^nodo;
	nodo = record
		datos: reg_Empleado;
		HI: Arbol;
		HD: Arbol;
	end;
		
	
	rng_empleados = 1..MAXempleados;
	
	reg_Empleado2 = record
		NroLegajo: integer;
		Dni: integer;
	end;
	
	vec_Empleado2 = array [rng_Empleados] of reg_Empleado2;

//_____________________________GenerarArbol_____________________________
Procedure GenerarArbol(var A: Arbol);	//Se dispone

	procedure leerReg (var r: reg_Empleado);
	begin
		writeln('INGRESAR EMPLEADO');
		with r do begin
			writeln('Ingresar NroLegajo');
			readln(NroLegajo);
			if (NroLegajo <> -1) then begin
				writeln('Ingresar DNI');
				readln(Dni);
				writeln('Ingresar Categoria');
				readln(Categoria);
				writeln('Ingresar Año ingreso');
				readln(AnioIngreso);
			end;
		end;
		writeln('');
	end;
	
	procedure crearNodo(var a: arbol; r: reg_Empleado);
	begin
		if (a = nil) then begin
			new(a);
			a^.datos:= r;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (a^.datos.NroLegajo > r.NroLegajo) then
				crearNodo(a^.HI, r)
			else
				if (a^.datos.NroLegajo < r.NroLegajo) then
					crearNodo(a^.HD, r)
		end;
	end;
	
Var
	empleado: reg_Empleado;
Begin
	A:= nil;
	leerReg(empleado);
	while (empleado.NroLegajo <> -1) do begin
		crearNodo(A, empleado);
		leerReg(empleado);
	end;
End;
//_____________________________MostrarArbol_____________________________
Procedure MostrarArbol(A: Arbol);
Begin
	if (A <> nil) then begin
		MostrarArbol(A^.HI);
		writeln('Numero de Legajo: ',A^.datos.NroLegajo);
		writeln('Dni: ', A^.datos.Dni);
		writeln('Numero de Categoria: ',A^.datos.Categoria);
		writeln('Anio Ingreso: ', A^.datos.anioIngreso);
		writeln('');
		MostrarArbol(A^.HD);
	end;
End;
//_____________________________IncisoA_____________________________
Procedure IncisoA(A: Arbol; var vec: vec_Empleado2; var dimL: rng_Empleados);

	procedure GenerarVec(a: Arbol; var v: vec_Empleado2; var i: rng_empleados; cat: rng_categoria; nA, nB: integer);
	begin
		if (a <> nil) then 
			if (a^.datos.NroLegajo > nA) then 
				if (a^.datos.NroLegajo < nB) then begin
					if ((a^.datos.Categoria = cat) and (i < MAXempleados)) then begin
						v[i].NroLegajo:= a^.datos.NroLegajo;
						v[i].Dni:= a^.datos.Dni;
						i:= i+1;
					end;
					GenerarVec(a^.HI, v, i, cat, nA, nB);
					GenerarVec(a^.HD, v, i, cat, nA, nB);
				end
				else
					GenerarVec(a^.HI, v, i, cat, nA, nB)
			else
				GenerarVec(a^.HD, v, i, cat, nA, nB)
	end;
	
Var
	dimL: rng_empleados;
	categoria: rng_categoria;
	numA, numB: integer;
Begin
	writeln('______________________DATOS EMPLEADOS A VECTOR______________________');
	dimL:= 1;
	writeln('Ingresar categoria');
	readln(categoria);
	writeln('Ingresar rango de NroLegajo');
	writeln('NumA');
	readln(numA);
	writeln('NumB');
	readln(numB);
	writeln('_________________________________');
	GenerarVec(A, vec, dimL, categoria, numA, numB);	
End;

//_____________________________MostrarVec_____________________________
Procedure MostrarVec(vec: vec_Empleado2; dimL: rng_Empleados);
Var
	i: rng_empleados;
Begin
	for i:= 1 to dimL do begin
		writeln('Numero de Legajo: ',vec[i].NroLegajo);
		writeln('Numero de DNI: ',vec[i].Dni);
		writeln('');
	end;
End;

//_____________________________IncisoB_____________________________
Function PromedioDni(var v: vec_Empleado2; dimL: rng_Empleados): real;
Var
	promedio: real;
Begin
	if (dimL = 1) then begin
		PromedioDni:= v[dimL];
	else
		dimL:= dimL - 1;
		promedio:= v[dimL] + PromedioDni(v);
		
End;
//_____________________________P.P_____________________________
VAR
	ABB: Arbol;
	vecEmpleado: vec_Empleado2;
	dimL: rng_Empleados;
BEGIN
	GenerarArbol(ABB);
	MostrarArbol(ABB);
	IncisoA(ABB, vecEmpleado, dimL);
	MostrarVec(vecEmpleado, dimL);
	
END.
