{MERGE-ACUMULADOR CREAR LISTA}
CONST
	VALOR_ALTO = 'ZZZ';
	MAX_listas = 5;

Type
	str20 = string[20];

	rango_listas = 1..MAX_listas;
	
	registro = record
		nombre: str20;
		precio: real;
	end;

	lista = ^nodo;
	nodo = record
		datos: registro;
		sig: lista;
	end;
	
	vec_listas = array [rango_listas] of lista;
	
	lista_de_carga = ^nodo_de_carga;
	nodo_de_carga = record
		total: real;
		sig:lista_de_carga;
	end;
	
	
{______________________________Merge______________________________}
Procedure MergeAcumulador(listas: vec_listas; var listaNueva: lista_de_carga);

	procedure minimo(var v: vec_listas; var min: registro);			//Minimo
	{v es pasado por referencia porque hay que ir avanzando en las listas del vector}
	var
		posMin, i: rango_listas;
	begin
		min.nombre:= VALOR_ALTO;
		
		for i:= 1 to MAX_listas do
			if ((v[i] <> nil) and (v[i]^.datos.nombre <= min.nombre)) then begin
				{si no se terminó la lista de la posición determinada del vector y el 
				contenido del nodo es menor al dato que tengo, actualizo el mínimio}
				posMin:= i;
				min:= v[i]^.datos;
			end;
			
		if (min.nombre <> VALOR_ALTO) then
			{una vez que conseguimos el nodo mínimo en el vector, avanzamos en la lista
			asociada al nodo}
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure agregarAtras(var l: lista_de_carga; dato: real); 
	var  
	   act, nodo : lista_de_carga;
	begin 
	   new (nodo);
	   nodo^.total:= dato;
	   nodo^.sig := nil;
	   if l <> nil then begin
		   act := l ;
		   while  (act^.sig <> nil) do 
		       act := act^.sig ;
		   act^.sig := nodo ;
	   end
	   else
		   l:= nodo;
	end;

Var																		//Merge
	actNombre: str20;
	
	totalDeAcumular: real;
	
	minRegistro: registro;
	
Begin
	listaNueva:= nil;
	
	minimo(listas, minRegistro);
	
	while (minRegistro.nombre <> VALOR_ALTO) do begin
		actNombre:= minRegistro.nombre;
		totalDeAcumular:= 0;
				
		while ((minRegistro.nombre <> VALOR_ALTO) and (minRegistro.nombre = actNombre)) do begin
			totalDeAcumular:= totalDeAcumular + minRegistro.precio;
			minimo(listas, minRegistro);
		end;
		
		agregarAtras(listaNueva, totalDeAcumular);		
	end;
End;
VAR
	listas: vec_listas;
	listaNueva: lista_de_carga;
BEGIN
	MergeAcumulador(listas, listaNueva);
END.

