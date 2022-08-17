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
public class POO_Ej2P1 {
public static void main(String[] args) {
        
    int i;
    int fact;
    int j;
    
    for (i = 9; i > 0; i = i-2) {
        
        fact = 1;
         
        for (j = i; j > 0; j--)
            fact = fact * j;
            
        System.out.println("El factorial de "+ i +" es: " + fact);
            
        
    }
}
}
