{
* Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
* diciembre de 2021. De cada película se conoce: código de película, código de género (1:
* acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: 
* terror) y puntaje promedio otorgado por las críticas.
* Implementar un programa modularizado que:
* 	a. Lea los datos de películas y los almacene por orden de llegada y agrupados por 
* 	código de género, en una estructura de datos adecuada. La lectura finaliza cuando se 
* 	lee el código de la película -1.
* 	b. Una vez almacenada la información, genere un vector que guarde, para cada género, 
* 	el código de película con mayor puntaje obtenido entre todas las críticas. 
* 	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de 
* 	los dos métodos vistos en la teoría.
* 	d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
* 	código de película con menor puntaje.
}

PROGRAM ejercicio02;
CONST
	FIN = -1;
	MAXgenero = 8;
	
TYPE
	rng_genero = 1..MAXgenero;
	
	reg_pelicula = record
		codPelicula: integer;
		codGenero: rng_genero;
		puntajeProm: real;
	end;
	
	lista_peliculas = ^nodo;
	nodo = record
		datos: reg_pelicula;
		sig: lista_peliculas;
	end;
	
	vec_generos = array [rng_genero] of reg_pelicula;

//______________________________Procedimientos_______________________________
Procedure CargarPeliculas(var l: lista_peliculas);

	procedure leerRegistro(var registro: reg_pelicula);
	begin
		with registro do begin
			write('Ingrese código de película: ');
			readln(codPelicula);
			
			if (codPelicula <> FIN) then begin
				write('Ingrese código de género: ');
				readln(codGenero);
				write('Ingrese puntaje promedio: ');
				readln(puntajeProm);
			end;
		end;
	end;
	
	procedure insertarOrdenado(var nodoInicial: lista_peliculas; registro: reg_pelicula);
	var
		act, nodo, ant: lista_peliculas;
	begin
		new(nodo);
		nodo^.datos:= registro;
		act:= nodoInicial;
		while ((act <> nil) and (act^.datos.codGenero <= registro.codGenero)) do begin
			ant:= act;
			act:= act^.sig;
		end;
		{si apuntan a la misma dirección (nil) -> lista solamente inicializada}
		if (act = nodoInicial) then
			nodoInicial:= nodo	//hago que el primer elemento de la lista sea el nodo creado
			
		{si no era el primer elemento}	
		else
			ant^.sig:= nodo;
			
		nodo^.sig:= act; //si "nodo" es el primero el campo sig tendrá nil, sino el que le sigue
	end;

Var
	pelicula: reg_pelicula;
Begin
	l:= nil;
	
	leerRegistro(pelicula);
	
	while (pelicula.codPelicula <> FIN) do begin
		insertarOrdenado(l, pelicula);
		leerRegistro(pelicula)
	end;
	
End;

//______________________________________Cargar Vector______________________________________
Procedure CargarVectorGeneros(l: lista_peliculas; var v: vec_generos);
Var
	mejorPelicula: reg_pelicula;
	codAct: rng_genero;
	
Begin
	mejorPelicula.puntajeProm:= 0;
	
	while (l <> nil) do begin
		codAct:= l^.datos.codGenero;
	
		while (l <> nil) and (codAct = l^.datos.codGenero) do begin
		
			if (l^.datos.puntajeProm > mejorPelicula.puntajeProm) then
				mejorPelicula:= l^.datos;
				
			l:= l^.sig;
		end;
		
		v[mejorPelicula.codGenero]:= mejorPelicula;	
	end;
	
End;

//______________________________________Cargar Vector______________________________________
Procedure OrdenarVectorGeneros(var v: vec_generos);
Var
	i, j, min: rng_genero;
	regAux: reg_pelicula;
Begin

	for i:= 1 to MAXgenero-1 do begin
		min:= i;
		
		for j:= i+1 to MAXgenero do 
			if v[j].puntajeProm < v[min].puntajeProm then
				min:= j;
				
		regAux:= v[min];
		v[min]:= v[i];
		v[i]:= regAux;
	end;
End;

//______________________________________P.P______________________________________
VAR
	L: lista_peliculas;
	generos: vec_generos;
	
BEGIN
	CargarPeliculas(L);
	CargarVectorGeneros(L, generos);
	OrdenarVectorGeneros(generos);
END.
