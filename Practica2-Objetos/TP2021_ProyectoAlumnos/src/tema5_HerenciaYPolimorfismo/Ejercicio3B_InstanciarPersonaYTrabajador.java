/*
3_B.Genere un programa que instancie una persona y un trabajador con datos leídos de 
teclado y muestre la representación de cada uno en consola. 
NOTA: reutilice la clase Persona (tema 2).
 */
package tema5_HerenciaYPolimorfismo;

import PaqueteLectura.Lector;

public class Ejercicio3B_InstanciarPersonaYTrabajador {
    public static void main(String[] args) {
        String nombre, laburo;
        int dni, edad;
        
        System.out.println("Ingrese Persona: ");
        System.out.println("Nombre: ");
        nombre = Lector.leerString();
        System.out.println("Dni: ");
        dni = Lector.leerInt();
        System.out.println("Edad: ");
        edad = Lector.leerInt();
        
        Persona per = new Persona (nombre, dni, edad);
        System.out.println("");
        
        
        System.out.println("Ingrese Trabajador: ");
        System.out.println("Nombre: ");
        nombre = Lector.leerString();
        System.out.println("Dni: ");
        dni = Lector.leerInt();
        System.out.println("Edad: ");
        edad = Lector.leerInt();
        System.out.println("Trabajo: ");
        laburo = Lector.leerString();
        
        Trabajador tr = new Trabajador (nombre, dni, edad, laburo);
        System.out.println("");
        System.out.println("");
        
        System.out.println(per.toString());
        System.out.println("");
        System.out.println(tr.toString());
    }
    
}
