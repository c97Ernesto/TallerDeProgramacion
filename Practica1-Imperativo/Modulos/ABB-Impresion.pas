{Impresion}
Procedure enOrden(a: Arbol);
begin
	if (a <> nil) then begin
		enOrden(a^.HI);
		write(a^.dato);
		enOrden(a^.HD);
	end;
end;