{Creacion}
Procedure Crear(var a: Arbol; num: dato);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:= num;
		a^.HI:= nil; 
		a^.HD:= nil
	end
	else
		if (num < a^.dato) then
			crear(a^HI, num);
		else
			crear(a^.HD, num);
end;
