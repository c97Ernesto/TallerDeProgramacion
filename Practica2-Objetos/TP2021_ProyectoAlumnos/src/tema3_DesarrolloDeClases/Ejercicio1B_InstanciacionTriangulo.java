/*
 B_Realizar un programa principal que instancie un triángulo, le cargue información leída 
desde teclado e informe en consola el perímetro y el área. 
 */
package tema3_DesarrolloDeClases;

import PaqueteLectura.Lector;

public class Ejercicio1B_InstanciacionTriangulo {

	public static void main(String[] args) {
		
		Triangulo triangulo = new Triangulo();
		
		System.out.println("Ingresar Lado 1");
		triangulo.setLado1(Lector.leerDouble());
		
		System.out.println("Ingresar Lado 2");
		triangulo.setLado2(Lector.leerDouble());
				
		System.out.println("Ingresar Lado 3");
		triangulo.setLado3(Lector.leerDouble());
		
		System.out.println("Ingresar color de relleno");
		triangulo.setColorRelleno(Lector.leerString());
		
		System.out.println("Ingresar color de línea");
		triangulo.setColorLinea(Lector.leerString());
		
				
		System.out.println("El Área es: "+ triangulo.calcularArea());
		
		System.out.println("El Perímetro es: "+ triangulo.calcularPerimetro());
		
		
		Triangulo triangulo2 = new Triangulo(3, 3, 3, "rojo", "amarillo");
		
		System.out.println("El Área es: "+ triangulo2.calcularArea());
		
		System.out.println("El Perímetro es: "+ triangulo2.calcularPerimetro());		
					
    }		
}
