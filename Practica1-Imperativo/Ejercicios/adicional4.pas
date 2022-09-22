{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone 
en papel de la información de los autos en venta. Implementar un programa que:
a. Genere un árbol binario de búsqueda ordenado por patente identificatoria 
del auto en venta. Cada nodo del árbol debe contener patente, año de fabricación 
(2010..2018), la marca y el modelo.
b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva 
la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.
c. Contenga un módulo que reciba el árbol generado en a) y retorne una estructura 
con la información de los autos agrupados por año de fabricación.
d. Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva 
el año de fabricación del auto con dicha patente. Mostrar el resultado.}
PROGRAM Adicional4;
CONST

TYPE
	str10 = string[10];
	str50 = string[50];
	rng_anio = 2010..2018;
	
	reg_auto = record
		patente: str10;
		anio: rng_anio;
		marca: str50;
		modelo: str50;
	end;
	
	Arbol = ^nodo;
	nodo = record 
		datos: reg_auto;
		Hi: Arbol;
		Hd: Arbol;
	end;
	
//_____________________________GenerarArbol_____________________________

Procedure GenerarArbol (var A: Arbol);
	procedure leerReg(var r: reg_auto);
	begin
		with r do begin
			readln(patente);
			if (patente <> -1) then begin
				readln(anio);
				readln(marca);
				readln(modelo);
			end;
		end;
	end;
	
	procedure crearNodo(var a: Arbol; r: reg_auto);
	begin
		if (a = nil) then begin
			new(a);
			a^.datos:= r;
			a^.Hi:= nil;
			a^.Hd:= nil;
		end
		else begin
			if (a^.datos.patente > r.patente) then
				crearNodo(a^.Hi, r)
			else
				if (a^.datos.patente < r.patente) then
					crearNodo(a^.Hd, r)
		end;
		
	end;

Var
	auto: reg_auto;
Begin
	A:= nil;
	leerReg(auto);
	while (auto.patente <> -1) do begin
		crearNodo(A, auto);
		leerReg(auto);
	end;
End;

//_____________________________RecorrerArbol_____________________________

Procedure RecorrerArbol(A: Arbol);	{inciso b, c, d}
Var

Begin
	
End;


//_____________________________P.P_____________________________
VAR

BEGIN

END.