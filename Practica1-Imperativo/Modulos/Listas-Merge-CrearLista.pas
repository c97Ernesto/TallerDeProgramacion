{MERGE CREAR LISTA}
CONST
	VALOR_ALTO = 'ZZZ';
	MAX_listas = 5;

Type
	str20 = string[20];

	rango_listas = 1..MAX_listas;

	lista = ^nodo;
	nodo = record
		dato: string;
		sig: lista;
	end;
	
	vec_listas = array [rango_listas] of lista;
	
{______________________________Merge______________________________}
Procedure Merge(listas: vec_listas; var listaNueva: lista);

	procedure minimo(var v: vec_listas; var min: str20);			//Minimo
	{v es pasado por referencia porque hay que ir avanzando en las listas del vector}
	var
		posMin, i: rango_listas;
	begin
		min:= VALOR_ALTO;
		
		for i:= 1 to MAX_listas do
			if ((v[i] <> nil) and (v[i]^.dato <= min)) then begin
				{si no se terminó la lista de la posición determinada del vector y el 
				contenido del nodo es menor al dato que tengo, actualizo el mínimio}
				posMin:= i;
				min:= v[i]^.dato;
			end;
			
		if (min <> VALOR_ALTO) then
			{una vez que conseguimos el nodo mínimo en el vector, avanzamos en la lista
			asociada al nodo}
			v[posMin]:= v[posMin]^.sig;
	end;
	
	procedure agregarAtras(var l: lista; dato: str20); 
	var  
	   act, nodo : lista;
	begin 
	   new (nodo);
	   nodo^.dato:= dato;
	   nodo^.sig := nil;
	   if l <> nil then 
	   begin
		   act := l ;
		   while  (act^.sig <> nil) do 
		       act := act^.sig ;
		   act^.sig := nodo ;
	   end
	   else
		   l:= nodo;
	end;

Var																		//Merge
	min: str20;
	
Begin
	listaNueva:= nil;
	minimo(listas, min);
	while (min <> VALOR_ALTO) do begin
		agregarAtras(listaNueva, min);
		minimo(listas, min);
	end;
End;

