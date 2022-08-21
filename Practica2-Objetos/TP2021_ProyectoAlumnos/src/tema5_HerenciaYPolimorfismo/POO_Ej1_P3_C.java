/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_HerenciaYPolimorfismo;

import PaqueteLectura.Lector;

/**
 *
 * @author Ernesto
 */
public class POO_Ej1_P3_C {
 
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
