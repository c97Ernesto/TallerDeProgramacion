package tema3_DesarrolloDeClases;

import PaqueteLectura.Lector;

public class Ejercicio2B_InstanciarBalanza {
	
	public static void main(String[] args) {
		
		Balanza balanza = new Balanza();
		balanza.iniciarCompra();
		
		System.out.print("Ingresar peso del producto: ");
		double pesoProducto = Lector.leerDouble();
		
		while (pesoProducto != 0) {
			
			System.out.print("Ingresar precio en Kg del producto: ");
			double precioEnKg = Lector.leerDouble();
			
			balanza.registrarProducto(precioEnKg, pesoProducto);
			
			System.out.print("Ingresar peso del producto: ");
			pesoProducto = Lector.leerDouble();
			
		}
		
		System.out.println(balanza.devolverResumenDeCompra());
		
	}
	
}
