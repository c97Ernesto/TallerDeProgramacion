{4. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone 
en papel de la información de los autos en venta. Implementar un programa que:
	a. Genere un árbol binario de búsqueda ordenado por patente identificatoria 
	del auto en venta. Cada nodo del árbol debe contener patente, año de 
	fabricación (2010..2018), la marca y el modelo.
	b. Contenga un módulo que recibe el árbol generado en a) y una marca y devuelva 
	la cantidad de autos de dicha marca que posee la agencia. Mostrar el resultado.
	c. Contenga un módulo que reciba el árbol generado en a) y retorne una 
	estructura con la información de los autos agrupados por año de fabricación.
	d. Contenga un módulo que reciba el árbol generado en a) y una patente y 
	devuelva el año de fabricación del auto con dicha patente. Mostrar el resultado.
}
CONST
	MAX_anio = 2018;
	INICIO_anio = 2010;
	
	FIN = -1;
	
TYPE
	str10 = string[10];
	str50 = string[50];
	rango_anios = INICIO_anio..MAX_anio;
	
	reg_auto = record
		patente: integer;
		anio: rango_anios;
		marca: str50;
		modelo: str50;
	end;
	
	arbol = ^nodo_arbol;
	nodo_arbol = record 
		datos: reg_auto;
		Hi: arbol;
		Hd: arbol;
	end;
	
	lista = ^nodo_lista;
	nodo_lista = record
		datos: reg_auto;
		sig: lista;
	end;
	vec_listas = array [rango_anios] of lista;
	
//________________________imprimirAutos________________________
procedure imprimirCoches(auto: reg_auto);
begin
	with (auto) do begin
        writeln('Patente: ', patente);
        writeln('Año: ', anio);
        writeln('Marca: ', marca);
        writeln('Modelo: ', modelo);
    end;
end;

//________________________Mostrar Abb________________________
Procedure MostrarAbb(abb: arbol);
Begin
	if (abb <> nil)	then begin
		MostrarAbb(abb^.hi);
		writeln('___________________Auto___________________');
		imprimirCoches(abb^.datos);
		MostrarAbb(abb^.hd);
	end;
End;
	
//_____________________________GenerarArbol_____________________________
Procedure GenerarArbol(var a: arbol);
	procedure leerReg(var r: reg_auto);
	begin
		with r do begin
		    write('Ingresar patente: '); readln(r.patente);
		    if (r.patente <> FIN) then begin
		        write('Ingresar Año: '); readln(r.anio);
		        write('Ingresar Marca: '); readln(r.marca);
		        write('Ingresar Modelo: '); readln(r.modelo);
		    end;
		end;
	end;
	
	procedure crearNodo(var nodo: arbol; r: reg_auto);
	begin
		if (nodo = nil) then begin
			new(nodo);
			nodo^.datos:= r;
			nodo^.hi:= nil;
			nodo^.hd:= nil;
		end
		else
			if (nodo^.datos.patente <= r.patente) then
				crearNodo(nodo^.hi, r)
			else
				crearNodo(nodo^.hd, r);			
	end;

Var
    auto: reg_auto;
    
Begin
	a:= nil;
	
	leerReg(auto);
	while (auto.patente <> FIN) do begin
	    crearNodo(a, auto);
	    leerReg(auto);
	end;
	
End;

//_____________________________ImprimirAutosDeMarca_____________________________
Procedure ImprimirCantAutos(a: arbol);

	function devolverCantAutosDeMarca(a: arbol; m: str50): integer;
	begin
		if (a <> nil) then begin
			if (a^.datos.marca = m) then
				devolverCantAutosDeMarca:= (devolverCantAutosDeMarca(a^.hi, m) + devolverCantAutosDeMarca(a^.hd, m) + 1)
			else
			    devolverCantAutosDeMarca:= (devolverCantAutosDeMarca(a^.hi, m) + devolverCantAutosDeMarca(a^.hd, m));
		end
		else
			devolverCantAutosDeMarca:= 0;
	end;
	
var
	marca: str50;
begin
	write('Ingresar marca: '); readln(marca);
	writeln('La cantidad de autos con esa marca es: ', devolverCantAutosDeMarca(a, marca));
end;

//_____________________________P.P_____________________________
Procedure GenerarVecListas(abb: arbol; var vL: vec_listas);
	
	procedure agregarAdelante(var nodo: lista; dato: reg_auto);
	var
		nuevoNodo: lista;
	begin
		new (nuevoNodo);
		nuevoNodo^.datos:= dato;
		nuevoNodo^.sig:= nil;
		nodo:= nuevoNodo;
	end;

Begin
	if (abb <> nil) then begin
		GenerarVecListas(abb^.hd, vL);
		agregarAdelante(vL[abb^.datos.anio], abb^.datos);
		GenerarVecListas(abb^.hi, vL);
	end;
End;

//_____________________________Mostrar Vector_____________________________
Procedure MostrarVectorListas(vL: vec_listas);
Var
    i: rango_anios;
Begin
    writeln('       Vector:');
    
    for i:= INICIO_anio to MAX_anio do
    
        while (vL[i] <> nil) do begin
            imprimirCoches(vL[i]^.datos);
            vL[i]:= vL[i]^.sig;
        end;
End;

//_____________________________P.P_____________________________
VAR
	abb: arbol;
	vecListas: vec_listas;
BEGIN
	GenerarArbol(abb);
	MostrarAbb(abb);
	ImprimirCantAutos(abb);
	//solo se imprime primera ocurrencia
	GenerarVecListas(abb, vecListas);
	MostrarVectorListas(vecListas);
END.
