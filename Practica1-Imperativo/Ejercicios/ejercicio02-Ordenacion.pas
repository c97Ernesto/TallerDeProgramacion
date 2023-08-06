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
	MAX_genero = 8;
	
TYPE
	rng_generos = 1..MAX_genero;
	
	reg_pelicula = record
		codPelicula: integer;
		codGenero: rng_generos;
		puntajeProm: real;
	end;	
	lista_peliculas = ^nodo;
	nodo = record
		datos: reg_pelicula;
		sig: lista_peliculas;
	end;
	vec_generos_peliculas = array [rng_generos] of lista_peliculas;

	reg_pelicula2 = record
		codPelicula: integer;
		puntajeProm: real;
	end;    
    vec_generos_puntajes = array [rng_generos] of reg_pelicula2;

//______________________________InicializarVector_______________________________
Procedure InicializarVectorListas(var vectorPeliculas: vec_generos_peliculas);
Var
    i: rng_generos;
Begin
    for i:= 1 to MAX_genero do 
        vectorPeliculas[i]:= nil;
End;

//______________________________Procedimientos_______________________________
Procedure CargarPeliculas(var vecPeliculas: vec_generos_peliculas);

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
	
	procedure agregarAlFinal(var punteroNodoInicial: lista_peliculas; registro: reg_pelicula);
	var
		punteroNodoAct, punteroNodoNuevo: lista_peliculas;
	begin
		new(punteroNodoNuevo);
		punteroNodoNuevo^.datos:= registro;
        punteroNodoNuevo^.sig:= nil;
        
        if (punteroNodoInicial <> nil) then begin     //si la lista no está vacía
            punteroNodoAct:= punteroNodoInicial;
    
            while (punteroNodoAct <> nil) do       //vamos hasta el final
                punteroNodoAct:= punteroNodoAct^.sig;
            punteroNodoAct^.sig:= punteroNodoNuevo;
        end
        else
            punteroNodoInicial:= punteroNodoNuevo;
	end;

Var
	pelicula: reg_pelicula;
Begin
	
	leerRegistro(pelicula);
	
	while (pelicula.codPelicula <> FIN) do begin
		agregarAlFinal(vecPeliculas[pelicula.codGenero], pelicula);
		leerRegistro(pelicula)
	end;
	
End;

//______________________________________Cargar Vector______________________________________
Procedure CargarPuntajes(vPeliculas: vec_generos_peliculas; var vPuntajes: vec_generos_puntajes);
        
    procedure obtenerMejorPelicula(nodo: lista_peliculas; var pelicula: reg_pelicula2);
    begin
        pelicula.puntajeProm:= FIN;
        while (nodo <> nil) do begin    //lista ordenada por codPelicula (no interesa)
            if (nodo^.datos.puntajeProm > pelicula.puntajeProm) then begin
                pelicula.codPelicula:= nodo^.datos.codPelicula;
                pelicula.puntajeProm:= nodo^.datos.puntajeProm;
            end;
            nodo:= nodo^.sig;
        end;
    end;

Var
	mejorPelicula: reg_pelicula2;
	i: rng_generos;
	
Begin
	
    for i:= 1 to MAX_genero do begin
        obtenerMejorPelicula(vPeliculas[i], mejorPelicula);
        vPuntajes[i]:= mejorPelicula;
    end;
	
End;

//______________________________________Ordenar Vector______________________________________
Procedure OrdenarPuntajes(var v: vec_generos_puntajes);
Var
	i, j, min: rng_generos;
	regAux: reg_pelicula2;
Begin

	for i:= 1 to MAX_genero-1 do begin
		min:= i;
		
		for j:= i+1 to MAX_genero do 
			if v[j].puntajeProm < v[min].puntajeProm then
				min:= j;
				
		regAux:= v[min];
		v[min]:= v[i];
		v[i]:= regAux;
	end;
End;

//______________________________________P.P______________________________________
VAR
	generosPeliculas: vec_generos_peliculas;
    generosPuntajes: vec_generos_puntajes;
	
BEGIN
	CargarPeliculas(generosPeliculas);
	CargarPuntajes(generosPeliculas, generosPuntajes);
	OrdenarPuntajes(generosPuntajes);
END.
