/*
3_C.Escriba un programa que instancie un triángulo, un círculo y un cuadrado, con 
información leída desde teclado. Luego muestre en consola el área y perímetro de cada 
uno y su representación en String.
 */
package tema5_HerenciaYPolimorfismo;

import PaqueteLectura.Lector;

public class Ejercicio1C_InstanciarFiguras {
 
    public static void main(String[] args) {
        double base, altura, radio;
        String colorR, colorL;
        
        System.out.println("Ingrese Informacion del Triángulo: ");
        System.out.println("Ingrese Lado: ");
        base = Lector.leerDouble();
        System.out.println("Ingrese Altura: ");
        altura = Lector.leerDouble();
        System.out.println("Ingrese Color de Relleno: ");
        colorR = Lector.leerString();
        System.out.println("Ingrese Color de Linea: ");
        colorL = Lector.leerString();
        Triangulo triangulo = new Triangulo (base, altura, colorR, colorL);
        
        System.out.println("");
        
        System.out.println("Ingrese Informacion del Círculo: ");
        System.out.println("Ingrese Radio: ");
        radio = Lector.leerDouble();
        System.out.println("Ingrese Color de Relleno: ");
        colorR = Lector.leerString();
        System.out.println("Ingrese Color de Linea: ");
        colorL = Lector.leerString();
        Circulo circulo = new Circulo (radio, colorR, colorL);
        
        System.out.println("");
        
        System.out.println("Ingrese Informacion del Cuadrado: ");
        System.out.println("Ingrese Base: ");
        base = Lector.leerDouble();
        System.out.println("Ingrese Color de Relleno: ");
        colorR = Lector.leerString();
        System.out.println("Ingrese Color de Linea: ");
        colorL = Lector.leerString();
        Cuadrado cuadrado = new Cuadrado (base, colorR, colorL);
        
        System.out.println("");
        
        System.out.println(triangulo.toString());
        System.out.println("");
        System.out.println(circulo.toString());
        System.out.println("");
        System.out.println(cuadrado.toString());
        
    }
    
}
