{
* ORDENACIÓN-SELECCIÓN
* Dado un arreglo (v) y una dimensión lógica (dimL), el algoritmo repite "dimL-1" veces
* buscar el elemento mínimo y ubicarlo en la posición correspondiente. Es decir, en la
* primera vuelta busca el mínimo desde la posición 1 hasta la "dimL" y ubica al mínimo
* en la primera posición. En la vuelta "i" busca el mínimo desde la posición "i" hasta 
* la "dimL" y lo ubica en la posición "i".
* }
Procedure OrdenarSeleccion(var v: vector; dimL: indice);
var
	i, j, p: indice;
	item: tipoElem;
	
begin
	{busca el min y guarda en p la pos}
	for i:= 1 to dimL-1 do begin 
		p:= i;	//almaceno en p la pos actual del arreglo
		
		for j:= i+1 to dimL do
			if v[j] < v[p] then
				p:= j;	//almaceno en p la pos del menor elemento del arreglo
				
		{intercambio los elementos}
		item:= v[p];
		v[p]:= v[i];
		v[i]:= item;
	end;

end;
