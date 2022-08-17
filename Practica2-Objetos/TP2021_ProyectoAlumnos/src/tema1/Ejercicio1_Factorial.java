/*
1_Escriba un programa que imprima en consola el factorial de un número N 
(ingresado por teclado, N > 0). Ejemplo: para N=5 debería imprimir 5! = 120
 */
package tema1;

import PaqueteLectura.Lector;

public class Ejercicio1_Factorial {
    
public static void main(String[] args) {
    int i;
    
    System.out.println("Ingrese un Numero");
    int n = Lector.leerInt();
    
    for (i = (n-1); i > 0; i--)
        n = n * i;
    System.out.println("El factorial del numero ingresado es: " + n);
    
}
}