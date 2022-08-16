{Ordenacion-Insercion}
Procedure Ordenar( var v: vector; dimL: indice);
var
	i, j, p: indice;
	item: tipoElem;
begin
	for i:= 2 to dimL do begin
		act:= v[i];
		j:= i-1;
		while (j > 0) and (v[j] > act) do begin
			v[j+1]:= v[j];
			j:= j-1;
		end;
		v[j+1]:= act;
	end;

end;