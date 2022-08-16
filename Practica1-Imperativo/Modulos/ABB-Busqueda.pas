{Busqueda}
function Buscar(a: Arbol; x: elemento): arbol;
begin
	if (a = nil) then 
		Buscar:= nil
	else
		if (x = a^.dato) then
			Buscar:= a;
		else
			if (x < a^.dato) then
				Buscar:= Buscar(a^.HI, x)
			else
				Buscar:= Buscar(a^.HD, x)
	

end;
