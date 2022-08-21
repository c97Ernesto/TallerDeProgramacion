/*
 B_Realizar un programa principal que instancie un triángulo, le cargue información leída 
desde teclado e informe en consola el perímetro y el área. 
 */
package tema3_DefiniciosDeClases;

import PaqueteLectura.Lector;

public class Ejercicio1B_InstanciacionTriangulo {

    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo();
        
        System.out.println("Lado 1");
        triangulo.setLado1(Lector.leerInt());
        System.out.println("Lado 2");
        triangulo.setLado2(Lector.leerInt());
        System.out.println("Lado 3");
        triangulo.setLado3(Lector.leerInt());
        
        System.out.println("El Área del Triangulo es: "+ triangulo.area());
        System.out.println("El Perímetro del Triangulo es: "+ triangulo.perimetro());
    }
}
