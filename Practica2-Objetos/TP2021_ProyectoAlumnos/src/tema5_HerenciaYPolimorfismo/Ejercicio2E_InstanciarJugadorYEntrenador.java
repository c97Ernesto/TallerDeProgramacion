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
public class Ejercicio2E_InstanciarJugadorYEntrenador {
    
     public static void main(String[] args) {
         String nombre;
         double sueldoBasico;
         
         System.out.println("Ingrese Nombre del Entrenador: ");
         nombre = Lector.leerString();
         System.out.println("Ingrese Sueldo del Entrenador: ");
         sueldoBasico = Lector.leerDouble();
         System.out.println("Ingrese cant de Campeonatos Ganados del Entrenador: ");
         int campGanados = Lector.leerInt();
         
         Entrenador entrenador = new Entrenador (nombre, sueldoBasico, campGanados);
         
         System.out.println("");
         
         System.out.println("Ingrese Nombre del Jugador: ");
         nombre = Lector.leerString();
         System.out.println("Ingrese Sueldo del Jugador: ");
         sueldoBasico = Lector.leerDouble();
         System.out.println("Ingrese cant de Partidos Jugados del Jugador: ");
         int partJugados = Lector.leerInt();
         System.out.println("Ingrese cant de Goles del Jugador: ");
         int goles = Lector.leerInt();
         
         Jugador jugador = new Jugador (nombre, sueldoBasico, partJugados, goles);
         
         System.out.println("");
         
         System.out.println(entrenador.toString());
         System.out.println("");
         System.out.println(jugador.toString());
         
         
         
     }
     
     
}
