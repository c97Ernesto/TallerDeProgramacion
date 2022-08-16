{CREAR VECTOR A PARTIR DE ARBOL}
Procedure RetornarVec(A: Arbol; numA, numB: integer; numCat: rng_categoria; var v: vecEmpleados; var dimL);

Begin
	if (A <> nil) then
		if (A^.datos.nroLegajo > numA) then
			if(A^.datos.nroLegajo < numB) then begin
				if(A^.datos.categoria = numCat) and (dimL < dimF) then begin
					dimL:= dimL + 1;
					v[dimL].Dni:= a^.datos.Dni;
					v[dimL].nroLegajo:= a^.datos.nroLegajo;
					end;
				RetornarVec(A^.hi, numA, numB, numCat, v, dimL);
				RetornarVec(A^.hd, numA, numB, numCat, v, dimL);
			end;
		else
			RetornarVec(A^.hi, numA, numB, numCat, v, dimL)
		else
			RetornarVec(A^.hd, numA, numB, numCat, v, dimL);
				

End