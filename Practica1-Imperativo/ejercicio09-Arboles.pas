{9. Implemente un programa que invoque a un módulo que genere un árbol binario de
búsqueda con nombres de personas que se leen desde teclado. La lectura finaliza con el
nombre ‘ZZZ’ que no debe procesarse. También debe invocar a otro módulo que reciba el
árbol generado y un nombre, y retorne verdadero si existe dicho nombre en el árbol o falso
en caso contrario}

PROGRAM ejercicio09;
CONST
	FIN = 'ZZZ';
	
TYPE
	Arbol = ^nodo;
	nodo = record
		nombre: string;
		HI: Arbol;
		HD:Arbol;
	end;
	
//________________________Generar Arbol________________________
Procedure GenerarArbol(var a: Arbol);

	procedure crearArbol(var a: Arbol; str: string);
	begin
		if (a = nil) then begin
			new(a);
			a^.nombre:= str;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (str < a^.nombre) then
				crearArbol(a^.HI, str)
			else
				crearArbol(a^.HD, str);
			
	end;

Var
	nombre: string;
Begin
	writeln('Ingresar Nombres: ');
	readln(nombre);
	while (nombre <> FIN) do begin
		crearArbol(a, nombre);
		readln(nombre);
	end;
End;

//________________________Listar Arbol________________________
Procedure ListarArbol(a: Arbol);
Begin
	if (a <> nil) then begin
		ListarArbol(a^.HI);
		writeln(a^.nombre);
		ListarArbol(a^.HD);
	end;
End;

//________________________Existe Nombre________________________
Procedure ExisteNombre(a: Arbol; buscado: string; var ok: boolean);
Begin
	if (a <> nil) then
		if (a^.nombre = buscado) then
			ok:= true
		else begin
			ExisteNombre(a^.HI, buscado, ok);
			ExisteNombre(a^.HD, buscado, ok);
		end
	else
		ok:= false;
		
End;

//________________________P.P________________________
VAR
	abb: Arbol;
	nombre: string;
	ok: boolean;
BEGIN
	GenerarArbol(abb);
	ListarArbol(abb);
	
	writeln();
	
	ok:= false;
	write('Ingresar Nombre a Buscar: ');
	readln(nombre);
	ExisteNombre(abb, nombre, ok);
	if ok then
		writeln('Se encontró')
	else
		writeln('No se encontró');
END.
