{
3. El administrador de un edificio de oficinas, cuenta en papel, con la información 
del pago de las expensas de dichas oficinas.
Implementar un programa que:
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. 
	De cada oficina se ingresa código de identificación, DNI del propietario y valor 
	de la expensa. La lectura finaliza cuando llega el código de identificación -1.
	b. Ordene el vector, aplicando alguno de los métodos vistos en la teoría, para 
	obtener el vector ordenado por código de identificación de la oficina.
	c. Realice una búsqueda dicotómica que recibe el vector generado en b) y un 
	código de identificación de oficina y retorne si dicho código está en el vector. 
	En el caso de encontrarlo, se debe informar el DNI del propietario y en caso 
	contrario informar que el código buscado no existe.
}

PROGRAM Adicional3;
CONST 
	MAX_oficinas = 300;
    FIN = -1;
	
TYPE
	rng_oficinas = 1..MAX_oficinas;
	indice = 0..MAX_oficinas;
	
	reg_oficina = record
		codId: integer;
		dniPropietario: integer;
		valorExpensa: real;
	end;
	
	vec_oficinas = array [rng_oficinas] of reg_oficina;

//_____________________________GenerarVector_____________________________

Procedure GenerarVec(var v: vec_oficinas; var dimL: indice);
	
	procedure leerReg(var r: reg_oficina);
	begin
		with r do begin
			readln(codId);
			if (codId <> FIN) then begin
				readln(dniPropietario);
				readln(valorExpensa);
			end;
		end;
	end;
	
Var
	oficina: reg_oficina;
Begin
	dimL:= 0;
	leerReg(oficina);
	while (oficina.codId <> FIN) and (dimL < MAX_oficinas) do begin
		dimL:= dimL + 1;
		v[dimL]:= oficina;
		leerReg(oficina);
	end;
End;

//_____________________________OrdenarVector_____________________________
Procedure OrdenarVec(var v: vec_oficinas; dimL: rng_oficinas);		{Incersion}
Var
	i: rng_oficinas;
	j, act: indice;
Begin
	for i:= 2 to dimL do begin
		act:= i;
		j:= i - 1;
		while (j > 0) and (v[j].codId > v[act].codId) do begin
			v[j + 1]:= v[j];
			j:= j - 1;
		end;
		v[j + 1]:= v[act];
	end;
End;



//_____________________________PP_____________________________
VAR
	vector: vec_oficinas;
	dimL: indice;
BEGIN
	GenerarVec(vector, dimL);
	OrdenarVec(vector, dimL);
END.
