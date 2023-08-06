{
1. El administrador de un edificio de oficinas cuenta, en papel, con la información del 
pago de las expensas de dichas oficinas.
Implementar un programa modularizado que:
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De
	cada oficina se ingresa el código de identificación, DNI del propietario y valor de 
	la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, 
	el cual no se procesa.
	b. Ordene el vector, aplicando el método de inserción, por código de identificación
	de la oficina.
	c. Ordene el vector aplicando el método de selección, por código de identificación
	de la oficina.
}
PROGRAM ejercicio01_Administracion;
CONST
	dimF = 300;
	FIN = -1;
	
TYPE
	
	rng_oficinas = 0..dimF;

	reg_oficina = record
		codIdentificacion: integer;
		dniPropietario: integer;
		valorExpensa: real;
	end;
	
	vec_oficinas = array [rng_oficinas] of reg_oficina;
	
//______________________________P.P_______________________________
Procedure GenerarVector(var v: vec_oficinas; var dL: rng_oficinas);
	
	procedure leerRegistro(var registro: reg_oficina);
	begin
		write('Ingresar código: ');
		readln(registro.codIdentificacion);
		
		if (registro.codIdentificacion <> FIN) then begin
			with (registro) do begin
				write('Ingresar Dni propietario: ');
				readln(registro.dniPropietario);
				write('Valor Expensa: ');
				readln(registro.valorExpensa);
			end;
		end;
	end;
	
Var
	oficina: reg_oficina;
	
Begin
	dL:= 0;
	leerRegistro(oficina);
	while (oficina.codIdentificacion <> FIN) and (dL < dimF) do begin
		dL:= dL + 1;
		v[dL]:= oficina;
		leerRegistro(oficina);
	end;
End;

//______________________________P.P_______________________________
Procedure OrdenarPorInsercion(var v: vec_oficinas; dimL: rng_oficinas);
var
	i, j: rng_oficinas;
	actOficina: reg_oficina;
	
begin
	for i:= 2 to dimL do begin
		actOficina:= v[i];
		j:= i-1;
		while (j > 0) and (v[j].codIdentificacion > actOficina.codIdentificacion) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= actOficina;
	end;
end;

//______________________________P.P_______________________________
Procedure OrdenarPorSeleccion(var v: vec_oficinas; dimL: rng_oficinas);
var
	i, j, min: rng_oficinas;
	regAux: reg_oficina;
	
begin
	{busca el min y guarda en p la pos}
	for i:= 1 to dimL-1 do begin 
		min:= i;	//almaceno en p la pos actual del arreglo
		
		for j:= i+1 to dimL do
			if (v[j].codIdentificacion < v[min].codIdentificacion) then
				min:= j;	//almaceno en p la pos del menor elemento del arreglo
				
		{intercambio los elementos}
		regAux:= v[min];
		v[min]:= v[i];
		v[i]:= regAux;
	end;
end;

//______________________________P.P_______________________________
VAR
	oficinas: vec_oficinas;
	dimL: rng_oficinas;
	
BEGIN
	GenerarVector(oficinas, dimL);
	OrdenarPorInsercion(oficinas, dimL);
	OrdenarPorSeleccion(oficinas, dimL);
END.
