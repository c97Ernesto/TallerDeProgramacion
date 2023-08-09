{Impresion}

Procedure enOrden(a: Arbol);	{enOrden}
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		write(a^.dato);
		enOrden(a^.HD);
	end;
end;

Procedure preOrden(a: Arbol);	{preOrden}
begin
	if (a <> nil) then begin
		write(a^.dato);
		preOrden(a^.HI);
		preOrden(a^.HD);
	end;
end;

Procedure posOrden(a: Arbol);	{posOrden}
begin
	if (a <> nil) then begin
		posOrden(a^.HI);
		posOrden(a^.HD);
		write(a^.dato);
	end;
end;
