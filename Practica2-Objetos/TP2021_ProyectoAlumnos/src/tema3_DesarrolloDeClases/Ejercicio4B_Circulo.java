package tema3_DesarrolloDeClases;

import PaqueteLectura.Lector;

public class Ejercicio4B_Circulo {

	public static void main(String[] args) {
		
		double radio = Lector.leerDouble();
		
		String colorRelleno = Lector.leerString();
		
		String colorLinea = Lector.leerString();
		
		Circulo circulo = new Circulo(radio, colorRelleno, colorLinea);
		
		System.out.println("El Perímetro es: "+ circulo.calcularPerimetro());
		System.out.println("El Área es: "+ circulo.calcularArea());
		
		
		
		Circulo circulo2 = new Circulo();
		
		circulo2.setRadio(Lector.leerDouble());
		
		circulo2.setColorRelleno(Lector.leerString());
		
		circulo2.setColorLinea(Lector.leerString());
		
		
	}
	
}
