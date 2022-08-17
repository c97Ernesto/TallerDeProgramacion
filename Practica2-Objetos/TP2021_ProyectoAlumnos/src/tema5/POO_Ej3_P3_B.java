/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

import PaqueteLectura.Lector;
/**
 *
 * @author Ernesto
 */
public class POO_Ej3_P3_B {
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
