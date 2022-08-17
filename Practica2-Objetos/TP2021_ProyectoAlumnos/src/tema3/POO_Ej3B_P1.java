/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author Ernesto
 */
public class POO_Ej3B_P1 {
    
    public static void main(String[] args) {
        
//        Entrenador entrenador = new Entrenador ("Pepe", 11111, 11);
        
        Entrenador entrenador = new Entrenador ();

        System.out.println("Ingrese nombre");
        entrenador.setNombre(Lector.leerString());
        System.out.println(entrenador.getNombre());
        
        
        System.out.println("Ingrese Sueldo");
        entrenador.setSueldo(Lector.leerDouble());
        System.out.println(entrenador.getSueldo());
        
        System.out.println("Ingrese cantidad de Campeonatos");
        entrenador.setCampeonatos(Lector.leerInt());
        System.out.println(entrenador.getCampeonatos());
        
        System.out.println(entrenador.toString());
        
        System.out.println("Nombre del entrenador " +entrenador.getNombre());
        System.out.println("El Total del Sueldo es: " +entrenador.calcularSueldoACobrar());
    }
    
}
