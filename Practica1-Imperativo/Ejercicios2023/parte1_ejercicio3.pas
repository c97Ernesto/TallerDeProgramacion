{
3.- Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
	diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
	2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
	promedio otorgado por las críticas.
	
	Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
	
	a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
		género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
		código de la película -1.
		
	b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
		obtenido entre todas las críticas, a partir de la estructura generada en a).
		
	c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
		métodos vistos en la teoría.
		
	d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
		del vector obtenido en el punto c).
}

PROGRAM P1Ej3;
CONST

	FIN = -1;

	MAX_generos = 8;
TYPE
	rango_generos = 1..MAX_generos;

	registro_pelicula = record
		codPelicula: integer;
		codGenereo: rango_generos;
		puntajeProm: real;
	end;
	
	lista_peliculas = ^nodo;
	nodo = record
		sig: lista_peliculas;
		datos: registro_pelicula;
	end;
	
	vector_puntajes = array [rango_generos] of real;
	
{________________________________MostrarDatos________________________________}
Procedure MostrarDatosPelicula(pelicula: registro_pelicula);
Begin
	with pelicula do begin
		writeln('Codigo de Pelcula: ', codPelicula);
		writeln('Codigo de Genero: ', codGenereo);
		writeln('Puntaje Promedio: ', puntajeProm);
	end;
End;

{________________________________ImprimirVector________________________________}
Procedure ImprimirVector(v: vector_puntajes);
Var
	i: rango_generos;
Begin
	for i:= 1 to MAX_generos do
		writeln('PuntajePromedio de codGenereo ', i, ' : ', v[i]);
End;
	
{________________________________ImprimirLista________________________________}
Procedure ImprimirLista(l: lista_peliculas);
Begin
	while (l <> nil) do begin
		writeln('Pelicula 1: ');
		MostrarDatosPelicula(l^.datos);
		l:= l^.sig;
		writeln('');
	end;
End;
	
{________________________________a.GenerarEstructura________________________________}
Procedure GenerarLista(var peliculas: lista_peliculas);
	procedure leerInfo(var p: registro_pelicula);
	begin
		write('Ingresar codPelicula: ');
		readln(p.codPelicula);
		if (p.codPelicula <> FIN) then begin
			write('Ingresar codGenereo: ');
			readln(p.codGenereo);
			write('Ingresar puntajeProm: ');
			readln(p.puntajeProm);
		end;
	end;
	
	procedure crearNodo(var l: lista_peliculas; r: registro_pelicula);
	var
		ant, act, nodo: lista_peliculas;
	begin
		new(nodo);
		nodo^.datos:= r;
		act:= l;
		while (act <> nil) and (act^.datos.codGenereo <= r.codGenereo) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= nodo
		else
			ant^.sig:= nodo;
		nodo^.sig:= act;
	end;

Var
	pelicula: registro_pelicula;
	
Begin
	peliculas:= nil;
	
	leerInfo(pelicula);
	while (pelicula.codPelicula <> FIN) do begin
		crearNodo(peliculas, pelicula);
		leerInfo(pelicula);
	end;

End;

{________________________________b.GenerarVectorDeMaximos________________________________}
Procedure GenerarVectorDeMaximos(var v: vector_puntajes; l: lista_peliculas);

	procedure calcularMaximo(var l: lista_peliculas; genero: rango_generos; var maxPuntajeProm: real);
	
		procedure maximo(var max: real; n: real);
		begin
			if (max < n) then
				max:= n;
		end;
		
	begin
		maxPuntajeProm:= 0;
		
		while (l <> nil) and (l^.datos.codGenereo = genero) do begin
			maximo(maxPuntajeProm, l^.datos.puntajeProm);
			l:= l^.sig;
		end;
	end;

Var
	i: rango_generos;
	
Begin
	for i:= 1 to MAX_generos do begin
		calcularMaximo(l, i, v[i]);
	end;
End;

{________________________________b.GenerarVectorDeMaximos________________________________}


{________________________________P.P________________________________}
VAR
	peliculas: lista_peliculas;
	puntajes: vector_puntajes;
BEGIN
	GenerarLista(peliculas);
	Writeln('Datos de Lista: ');
	ImprimirLista(peliculas);
	
	Writeln('');
	GenerarVectorDeMaximos(puntajes, peliculas);
	Writeln('Datos del vector:');
	ImprimirVector(puntajes);
	
	
END.


