{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2021. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror)
y puntaje promedio otorgado por las críticas.
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por
código de género, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de la película -1.
b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el
código de película con menor puntaje.}
PROGRAM Netflix;
CONST
	FIN = -1;
	MAXgenero = 8;
	
TYPE
	rng_genero = 1..MAXgenero;
	
	reg_Peli = record
		codPeli: integer;
		codGenero: rng_genero;
		puntajeProm: real;
	end;
	
	reg_Peli2 = record
		codPeli2: integer;
		puntajeProm2: real;
	end;
	
	lista: ^nodo;
	nodo = record
		datos: regPeli;
		sig: lista;
	end;
	
	vec_CodGenero = array [rng_genero] of lista;
	vec_PeliMayorPuntaje = array [rng_genero] of reg_Peli2;

//______________________________Procedimientos_______________________________
//______________________________Inicializar Vectores_______________________________
Procedure IniVecListas (var v: vec_CodGenero);
Var
	i: rng_genero;
Begin
	for i:= 1 to MAXgenero do
		v[i]:= nil;
End;

Procedure IniVecReg(var v: vec_PeliMayorPuntaje);
Var
	i: rng_genero;
Begin
	for i:= 1 to MAXgenero do
		v[i].codPeli2:= -1;
		v[i].puntajeProm2:= -1;
End;
	
//______________________________CargarVecPelis_______________________________
Procedure CargarVecPelis(var v: vec_CodGenero);
{a. Lea los datos de películas y los almacene por orden de llegada y •agrupados por
código de género•, en una estructura de datos adecuada. La lectura finaliza cuando se lee
el código de la película -1.}

	procedure leerInfo(var r: reg_Peli);
	begin
		with r do begin
			write('INGRESE CÓDIGO DE LA PELÍCULA: ');
			readln(codPeli)
			if (codPeli <> FIN) then begin
				write('INGRESE EL CÓDIGO DE GÉNERO: ');
				readln(codGenero);
				write('INGRESE EL PUNTAJE PROMEDIO: ');
				readln(puntajeProm);
			end;
		end;
	end;
	
	procedure agregarAtras(var l: Lista; r: reg_Peli);
	var
		aux, nodo: Lista;
	begin
		new(nodo);		//creamos nodo
		nodo^.datos:= r;	//insertamos los datos
		nodo^.sig:= nil;	//hacemos que el nodo sea el último
		if (l <> nil) then begin 	//si la lista no está vacía
			aux:= l;
			while (aux^.sig <> nil) do 		//mientras no estemos en el último nodo
				aux:= aux^.sig;
			aux^.sig = nodo			//al último nodo lo hacemos apuntar al nuevo
		end;
		else
			l:= nodo;
	end;
	
Var
	peli: reg_Peli;
Begin
	leerInfo(peli);
	while (peli.codPeli <> FIN) do begin
		agregarAtras(v[peli.codGenero], peli);
		leerInfo(peli);
		writeln('Siguiente Pelicula');
		writeln('')
	end;
End;
//______________________________CargarVecPuntajes_______________________________
Procedure CargarVecPuntajes(vGen: vec_CodGenero; var vPuntajes: vec_PeliMayorPuntaje);
{b. Una vez almacenada la información, genere un vector que guarde, para cada
género, el código de película con mayor puntaje obtenido entre todas las críticas.}
	procedure maximo (l: lista; var max: reg_Peli);
	begin
		while (l <> nil) do begin
			if (l^.datos.puntajeProm > max.puntajeProm2) then
				max:= l^.datos;		//solo se puede hacer asigancion de registros del mismo tipo
			l:= l^.sig;
		end;
	end;
	
Var
	i: rng_genero;
	max: reg_Peli;
Begin
	for i:= 1 to MAXgenero do begin
		max.puntajeProm:= -1;
		maximo(vGen[i], max);
		vPuntajes[i].codPeli2:= max.codPeli;
		vPuntajes[i].puntajeProm2:= max.puntajeProm;
	end;
End;
//______________________________OrdenarVector_______________________________
Procedure OrdenarVec(var v: vec_PeliMayorPuntaje);
{c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de
los dos métodos vistos en la teoría.}
Var
	i, j, p: rng_genero;
Begin
	for i:= 1 to (MAXgenero - 1) do begin
		p:= i;				
		for j:= i+1 to MAXgenero do
			if v[j] < v[p] then
				p:= j
		elem:= v[p];
		v[p]:= v[i];
		v[i]:= elem;
	end;
End;

//______________________________________P.P__________________________________________
VAR
	vecPelis: vec_CodGenero;
	vecMayorPuntaje: vec_PeliMayorPuntaje;
BEGIN
	InicializarVecListas(vecPelis);
	CargarVecPelis(vecPelis);
	InicializarVecEnteros(vecMayorPuntaje);
	CargarVecPuntajes(vecPelis, vecMayorPuntaje);
	OrdenarVec(vecMayorPuntaje);
END.



















