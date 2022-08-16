{Busqueda-Dicotomica}
procedure busquedadicotomica(v:vector; pri:integer; ult:integer; dato:integer; var pos:integer);
begin
   if (pri > ult) then
     writeln('El numero ingresado no se encuentra en el vector', -1)
   else begin
     pos:=(pri + ult) div 2;
     if (v[pos] = dato) then
       writeln('El numero ingresado se encuentra en la posicion ', pos, ' del vector.')
     else begin
       if (dato < v[pos]) then begin
          ult:= pos-1;
          busquedadicotomica (v, pri, ult, dato, pos);
       end
       else begin
         pri:=pos+1;
         busquedadicotomica (v, pri, ult, dato, pos);
       end;
     end;
   end;
end;