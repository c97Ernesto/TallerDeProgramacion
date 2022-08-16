{5. Escribir un programa que:
a. Implemente un módulo que genere un vector de 20 números enteros.
b. Implemente un módulo recursivo que devuelva el máximo valor del vector.
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector.}
PROGRAM Ejercicio5;
CONST
	DimF = 5;
TYPE
	vec_Enteros = array [1..DimF] of integer;
	
//________________________GenerarVector________________________
{a. Implemente un módulo que genere un vector de 20 números enteros.}
Procedure GenerarVec(var v: vec_Enteros);
Var 
	i: integer;
Begin
	for i:= 1 to DimF do begin
		writeln('Ingresar Numero: ');
		readln(v[i]);
	end;
	writeln('');
End;

//________________________MostrarVector________________________
Procedure MostrarVec(v: vec_Enteros);
var
	i: integer;
Begin
	for i:= 1 to DImF do
		write(' ', v[i]);
	writeln('');
End;

//________________________Maximo________________________
{b. Implemente un módulo recursivo que devuelva el máximo valor del vector.}

{procedure  maximoRecursivo(v:vector; var max:integer; diml:integer);
begin
	 if (diml < dimf) then begin
		 diml:=diml+1;
		 if (v[diml] > max) then
			 max:= v[diml];
		 maximoRecursivo (v,max,diml);
	 end;
end;}
Procedure Maximo(v: vec_Enteros);

	function maximoRecursivo(v: vec_Enteros; i, max: integer): integer;
	begin
		if (i <= dimf) then begin
			if (v[i] > max) then
				max:= v[i];
			maximoRecursivo:= maximoRecursivo(v, i+1, max);
		end
		else
			maximoRecursivo:= max;
	end;
	
Var
	i, max: integer;
Begin
	max:= -1;
	i:= 1;
	writeln('El maximo es: ',maximoRecursivo(v, i, max));
	writeln('');
End;

//________________________Suma________________________
{c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos
en el vector.}
{function sumador(v: vector; suma: integer; pos: integer): integer;
begin
	if (pos < 1) or (pos > dimF) then begin
		sumador:= suma;
	end;
	else begin
		suma:= suma + v[pos];
		sumador:= sumador(v, suma, pos+1);
	end;
end;}
Procedure Suma(v: vec_Enteros);

	function sumaRecursiva(v: vec_Enteros; i: integer): integer;
	begin
		if (i = 0) then
			sumaRecursiva := 0
		else
			sumaRecursiva := sumaRecursiva(v, i-1) + v[i]
	end;
	{	1	2	1	1	1	}
	
Var
	i: integer;
Begin
	i:= DimF;
	writeln('La suma total es: ', sumaRecursiva(v, i));
End;

//________________________P.P________________________
VAR
	vEnteros: vec_Enteros;
BEGIN
	GenerarVec(vEnteros);
	MostrarVec(vEnteros);
	Maximo(vEnteros);
	Suma(vEnteros);
END.
