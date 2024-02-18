{
1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
	de las expensas de dichas oficinas. Implementar un programa con:

	a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
		administra. Se debe leer, para cada oficina, el código de identificación, DNI del
		propietario y valor de la expensa. La lectura finaliza cuando llega el código de
		identificación -1.

	b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
		código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
		vistos en la cursada.

	c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
		generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
		retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
		Luego el programa debe informar el DNI del propietario o un cartel indicando que no
		se encontró la oficina.

	d) Un módulo recursivo que retorne el monto total de las expensas.
}

PROGRAM P5Ej1;
CONST
	MAX_oficinas = 300;
	FIN_oficinas = -1;
	
TYPE

	rango_oficinas = 1..MAX_oficinas;
	
	indice_oficinas = 0..MAX_oficinas;
	
	registro_oficina = record
		codigoIdentificacion: integer;
		dniPropietario: integer;
		valorExpensa: integer;
	end;
	
	vector_oficinas = array[rango_oficinas] of registro_oficina;
	

{________________________________a.GenerarVectorOficinas________________________________}	
Procedure GenerarVectorOficinas(var oficinas: vector_oficinas; var dimL: indice_oficinas);
	
	procedure leerOficina(var oficina: registro_oficina);
	begin
		write('Codigo de Identificacion: ');
		readln(oficina.codigoIdentificacion);
		if (oficina.codigoIdentificacion <> FIN_oficinas) then
			with oficina do begin
				write('Dni Propietario: ');
				readln(dniPropietario);
				write('Valor Expensa: ');
				readln(valorExpensa);
			end;
	end;
	
Var
	oficina: registro_oficina;
Begin
	dimL:= 0;
	
	leerOficina(oficina);
	while (oficina.codigoIdentificacion <> FIN_oficinas) do begin
		dimL:= dimL + 1;
		oficinas[dimL]:= oficina;
		leerOficina(oficina);
	end;
End;

{________________________________Vector________________________________}
Procedure ImprimirVectorOficinas(v: vector_oficinas; dL: indice_oficinas);
	
	procedure mostrarDatosOficina(oficina: registro_oficina);
	begin
		writeln('Codigo de Identificacion: ', oficina.codigoIdentificacion);
		writeln('Dni del Propietario: ', oficina.dniPropietario);
		writeln('Valor de la Expensa: ', oficina.valorExpensa);
		writeln('');
	end;
	
Var
	i: rango_oficinas;
Begin
	for i:= 1 to dL do
		mostrarDatosOficina(v[i]);
End;

{________________________________OrdenarVectorOficinas________________________________}
Procedure OrdenarVectorOficinas(var v: vector_oficinas; dL: indice_oficinas);
Var
	i, j, indiceMin: rango_oficinas;
	registroAux: registro_oficina;
Begin
	
	for i:= 1 to dL-1 do begin
		indiceMin:= i;
		
		for j:= i+1 to dL do
			if (v[j].codigoIdentificacion < v[indiceMin].codigoIdentificacion) then
				indiceMin:= j;
				
		registroAux:= v[i];
		v[i]:= v[indiceMin];
		v[indiceMin]:= registroAux;
	end;
End;

{________________________________c.RealizarBusquedaDicotomica________________________________}
Procedure RealizarBusquedaDicotomica(v: vector_oficinas; dL: indice_oficinas);

	procedure busquedaDicotomica(vector: vector_oficinas; inicio, fin: indice_oficinas; codigo: integer; var posicion: integer);
	var
		mitad: integer;
	begin
		if (inicio > fin) then
			posicion:= -1
			
		else begin
			mitad:= (inicio + fin) div 2;
			
			if (vector[mitad].codigoIdentificacion = codigo) then
				posicion:= mitad
				
			else
				if (vector[mitad].codigoIdentificacion > codigo) then
					busquedaDicotomica(vector, inicio, (mitad - 1), codigo, posicion)
				else
					busquedaDicotomica(vector, (mitad + 1), fin, codigo, posicion)
		end;
	end;

Var
	cod, pos: integer;
Begin
	
	write('Ingresar Codigo: ');
	readln(cod);
	busquedaDicotomica(v, 1, dL, cod, pos);
	writeln('El codigo ingresado: ', cod);
	writeln('Se encuentra en la posicion: ', pos);
	writeln('');
End;

{________________________________d.RetornarExpenas________________________________}
Procedure RetornarTotalExpensas(oficinas: vector_oficinas; dL: indice_oficinas);
	
	function retornarSuma(v: vector_oficinas; i: indice_oficinas; dL: indice_oficinas): integer;
	begin
		if (i < dL) then begin
			i:= i + 1;
			retornarSuma:= v[i].valorExpensa + retornarSuma(v, i, dL);
		end
		else
			retornarSuma:= 0;
	end;
	
Var
	i: indice_oficinas;
Begin
	
	i:= 0;
	Writeln('El total de las expensas es de: ', retornarSuma(oficinas, i, dL));
	
End;

{________________________________P.P________________________________}
VAR
	oficinas: vector_oficinas;
	dimensionLogica: indice_oficinas;
	
BEGIN
	{a.}
	GenerarVectorOficinas(oficinas, dimensionLogica);
	writeln('VECTOR GENERADO');
	ImprimirVectorOficinas(oficinas, dimensionLogica);
	writeln('');
	
	{b.}
	OrdenarVectorOficinas(oficinas, dimensionLogica);
	writeln('VECTOR ORDENADO');
	ImprimirVectorOficinas(oficinas, dimensionLogica);
	writeln('');
	
	{c.}
	writeln('BUSCAR CODIGO');
	RealizarBusquedaDicotomica(oficinas, dimensionLogica);
	writeln('');
	
	{b.}
	RetornarTotalExpensas(oficinas, dimensionLogica);
	
END.
