/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author Ernesto
 */
public class POO_Ej1P1 {
    
public static void main(String[] args) {
    int i;
    
    System.out.println("Ingrese un Numero");
    int n = Lector.leerInt();
    
    for (i = (n-1); i > 0; i--)
        n = n * i;
    System.out.println("El factorial de el numero ingresado es: " + n);
    
}
}