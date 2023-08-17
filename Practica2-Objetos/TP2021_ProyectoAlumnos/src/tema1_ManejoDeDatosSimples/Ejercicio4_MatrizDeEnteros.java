/*
4_Escriba un programa que defina una matriz de enteros de tamaño 10x10. 
Inicialice la matriz con números aleatorios entre 0 y 200. 
Luego realice las siguientes operaciones: 
    - Mostrar el contenido de la matriz en consola. 
    - Calcular e informar la suma de todos los elementos almacenados entre las 
    filas 2 y 9 y las columnas 0 y 3
    - Generar un vector de 10 posiciones donde cada posición i contiene la suma 
    de los elementos de la columna i de la matriz.
    - Lea un valor entero e indique si se encuentra o no en la matriz. En caso de 
    encontrarse indique su ubicación (fila y columna) en caso contrario 
    imprima “No se encontró el elemento”.
 */
package tema1_ManejoDeDatosSimples;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4_MatrizDeEnteros {
    
    public static void main(String[] args) {
     
        //1. definir la matriz de enteros de tamaño 10x10 e iniciarla con números aleatorios entre 0 y 200 
        int tabla[][] = new int [10][10]; 
        int i, j;
        for (i = 0; i < 10; i++)
            for (j = 0; j < 10; j++)
                tabla[i][j] = GeneradorAleatorio.generarInt(200);

        //2. mostrar el contenido de la matriz en consola
        for (i = 0; i < 10; i++) 
            for (j = 0; j < 10; j++){
                System.out.print("Elemento en la posicion '" +i+j+ "' : ");
                System.out.println(tabla[i][j] + " ");
            }

        //3. calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
        int suma = 0;   
        for (i = 2; i < 10; i++) 
            for (j = 0; j < 4; j++)
                suma = suma + tabla[i][j];
        System.out.println("La suma total de los elementos entre Fil 2y9 y Col 0y3 es: " + suma);

        //4. generar un vector de 10 posiciones donde cada posición i contiene la suma de la columna i de la matriz 
        int vec[] = new int [9];
        for (j = 0; j < 9; j++){
            for (i = 0; i < 9; i++)
                vec[j] = vec[j] + tabla[i][j];
            System.out.println("La suma total de la Columna J es: " + vec[j]);
        }

        //5. lea un valor entero e indique si se encuentra o no en la matriz. En caso 
        //de encontrarse indique su ubicación (fila y columna) y en caso contrario 
        //imprima "No se encontró el elemento".
        System.out.print("Ingresar elemento a buscar: ");
        int num = Lector.leerInt();
        int posi = -1; int posj = 0;
        for (i = 0; i < 9; i++)     
            for (j = 0; j < 9; j++)
                if (num == tabla[i][j]){
                    posi = i;
                    posj = j;
                }
        if (posi != -1){
            System.out.println("El elemento esta en: Fila " +posi+ " Columna " +posj);
        }
        else {
            System.out.println("El elemento no esta en la matriz");
        } 
    }
}
