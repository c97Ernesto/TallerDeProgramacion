{
2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
	leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
	recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
	imprimir 2 5 6
}

PROGRAM P2Ej2;

Procedure Descomponer(numero: integer);
Var
	resto: integer;
Begin
	if (numero <> 0) then begin
		resto:= numero mod 10;
		numero:= numero div 10;
		Descomponer(numero);
		write(resto);
	end;
End;

Var
	numero: integer;
BEGIN
	write('Ingresar número a descomponer: ');
	readln(numero);
	Descomponer(numero);
END.
