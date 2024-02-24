{
4.- Escribir un programa con:
	a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
		menores a 100.
	b. Un módulo recursivo que devuelva el máximo valor del vector.
	c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}

PROGRAM	P2Ej4;

CONST
	MAX_numeros = 20;
	NUM_MAX = 100;
	NUM_MIN = 0;

TYPE
	rango_vector = 0..MAX_numeros;
	rango_numeros = NUM_MIN..NUM_MAX;
	
	vector_numeros = array[1..MAX_numeros] of rango_vector;

{________________________________a.Generar_VectorRecusivamente________________________________}
Procedure GenerarVectorRecursivamente(var v: vector_numeros; i: rango_numeros);
Begin
	if (i < MAX_numeros) then begin
		i:= i + 1;
		v[i]:= Random(99);
		write(v[i], ' ');
		GenerarVectorRecursivamente(v, i);
	end;
End;

{________________________________a.Generar_VectorRecusivamente________________________________}
Procedure ImprimirVectorRecursivamente(v: vector_numeros; i: rango_numeros);
Begin
	if (i < MAX_numeros) then begin
		i:= i + 1;
		writeln(v[i]);
		ImprimirVectorRecursivamente(v, i);
	end;
End;

{________________________________c.DevolverMinimo________________________________}
Procedure DevolverMinimoRecursivamente(v: vector_numeros; var min: rango_numeros; indice: rango_vector);

Begin
	
	if (indice < MAX_numeros) then begin
		indice:= indice + 1;
		
		if (v[indice] < min) then
			min:= v[indice];
			
		DevolverMinimoRecursivamente(v, min, indice);
	end;
		
End;


{________________________________d.DevolverSuma________________________________}
Procedure DevolverSumaRecursivamente(v: vector_numeros; var suma: integer; i: rango_vector);
Begin
	
	if (i < MAX_numeros) then begin
		i:= i + 1;
		suma:= suma + v[i];
		DevolverSumaRecursivamente(v, suma, i);
	end;
	
End;

{________________________________P.P________________________________}
VAR
	indice, min: rango_numeros;
	suma: integer;
	vecNumeros: vector_numeros;
BEGIN
	indice:= 0;
	{a.}
	GenerarVectorRecursivamente(vecNumeros, indice);
	writeln('');
	ImprimirVectorRecursivamente(vecNumeros, indice);
	writeln('');
	{b.}
	min:= 100;
	DevolverMinimoRecursivamente(vecNumeros, min, indice);
	Writeln('El minimo del vector es: ', min);
	writeln('');
	
	{c.}
	suma:= 0;
	DevolverSumaRecursivamente(vecNumeros, suma, indice);
	writeln('La suma total de los elementos del vector es de: ', suma);
	writeln('');
END.
