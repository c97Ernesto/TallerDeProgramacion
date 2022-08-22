package tema3_DefiniciosDeClases;

import PaqueteLectura.Lector;

public class Ejercicio3B_InstanciarEntrenador {
    
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
