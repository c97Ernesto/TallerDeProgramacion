{
2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
	las expensas de dichas oficinas.
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
		se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
		finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
	b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
		oficina.
	c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}
PROGRAM P1Ej2;
CONST
	
	FIN = -1;
	MAX_oficinas = 300;

TYPE

	rango_vector = 0..MAX_oficinas;

	registro_oficina = record
		codId: integer;
		DniPropietario: integer;
		valorExpensa: real;
	end;
	
	vector_oficinas = array[1..MAX_oficinas] of registro_oficina;
	
{________________________________a.CargarVector________________________________}
Procedure CargarVector(var vecOficinas: vector_oficinas; var dL: rango_vector);

	procedure leerDatos(var r: registro_oficina);
	
	begin
		write('Codigo de identificacion: ');
		readln(r.codId);
		
		if (r.codId <> FIN) then begin
			write('Ingresar dni del propietario: ');
			readln(r.DniPropietario);
			write('Valor de la expensa: ');
			readln(r.valorExpensa);
		end;
				
	end;

Var
	oficina: registro_oficina;
Begin
	dL:= 0;
	leerDatos(oficina);
	
	while(oficina.codId <> FIN) and (dL < MAX_oficinas) do begin
		dL:= dL + 1;
		vecOficinas[dL]:= oficina;
		
		leerDatos(oficina);
	end;
		
	
End;
	
{________________________________b.OrdenarVectorInserción________________________________}
Procedure OrdenarVectorInsercion(var v: vector_oficinas; dimL: rango_vector);
Var
	i, j: rango_vector;
	oficina: registro_oficina;
	
Begin
	for i:= 2 to dimL do begin
		oficina:= v[i];
		j:= i-1;
		
		while (j > 0) and (v[j].codId > oficina.codId) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		
		v[j+1]:= oficina;
	end;
End;

{________________________________c.OrdenarVectorSelección________________________________}
Procedure OrdenarVectorSeleccion(var v: vector_oficinas; dimL: rango_vector);
Var
	oficina: registro_oficina;
	i, j, p: rango_vector;
Begin
	
	for i:= 1 to dimL-1 do begin
		p:= i;
		
		for j:= i to dimL do begin
			if (v[j].codId < v[p].codId) then
				p:= j;
				
		end;	
		oficina:= v[p];
		v[p]:= v[i];
		v[i]:= oficina;
	end;
End;

{________________________________Imprimir_Vector________________________________}

Procedure ImprimirVector(v: vector_oficinas; dimL: rango_vector);

	procedure mostrarDatosRegistro(r: registro_oficina);
	begin
		writeln('Codigo identificacion: ', r.codId);
		writeln('Dni propietario: ', r.DniPropietario);
		writeln('Valor Expensa: ', r.valorExpensa);
		writeln('');
	end;

Var
	i: rango_vector;
Begin
	for i:= 1 to dimL do 
		mostrarDatosRegistro(v[i]);
	
End;
	
{________________________________P.P________________________________}
Var
	oficinas: vector_oficinas;
	dimensionLogica: rango_vector;
	
BEGIN
	CargarVector(oficinas, dimensionLogica);
	writeln('');
	ImprimirVector(oficinas, dimensionLogica);
	
	OrdenarVectorInsercion(oficinas, dimensionLogica);
	writeln('');
	writeln('Pos seleccion');
	ImprimirVector(oficinas, dimensionLogica);
	
	OrdenarVectorSeleccion(oficinas, dimensionLogica);
	writeln('');
	writeln('Pos Insercion');
	ImprimirVector(oficinas, dimensionLogica);
END.
