{
* ORDENACIÓN-INSERCIÓN
* Inicialmente se considera un solo elemento, que obviamente es un conjunto ordenado.
* Después cuando hay k elementos ordenados de menor a mayor, se toma el elemento k+1
* y se compara con todos los elementos ya ordenados, deteniendose cuando se encuentra
* un elemento menor (todos los elementos mayores se desplazan una posición a la derecha)
* o cuando ya no se encuentran elementos (todos los elementos ya fueron desplazados y
* éste es el mas pequeño). En este punto se inserta el elemento k+1 debiendo desplazarse
* los demás elementos.
* Consideraciones:
* 	-No es tan sencillo de implementar.
* 	-Orden(n²), siendo n el tamaño del arreglo.
* 	-Si el vector está previamente ordenado el while no se ejecuta ya que no se cumpliría
* 	la segunda condición por lo tanto cambiaría el Orden a O(n).
* }
Procedure OrdenarPorInsercion(var v: vector; dimL: indice);
var
	i, j: indice;
	act: tipoElem;
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
