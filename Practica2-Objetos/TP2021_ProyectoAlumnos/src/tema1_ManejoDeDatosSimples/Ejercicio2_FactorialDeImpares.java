/*
2_Escriba un programa que imprima en consola el factorial de todos los números 
entre 1 y 9. ¿Qué modificación debe hacer para imprimir el factorial de los 
números impares solamente?
 */
package tema1_ManejoDeDatosSimples;

public class Ejercicio2_FactorialDeImpares {
    
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
