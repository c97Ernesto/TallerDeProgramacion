/*
3_Escriba un programa que lea las alturas de los 15 jugadores de un equipo de 
básquet y las almacene en un vector. Luego informe: 
    - la altura promedio
    - la cantidad de jugadores con altura por encima del promedio
*/
package tema1_ManejoDeDatosSimples;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ejercicio3_AlmacenarEnVector {
    
    public static void main(String[] args) {
        int maxAlturas = 7;
        
        //Paso 2: Declarar la variable vector de double 
        double [] vecAltura;
        
        //Paso 3: Crear el vector para 15 double 
        vecAltura = new double [maxAlturas];
        
        //Paso 4: Declarar indice 
        int i;
        
        double suma = 0;
        double altura;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < maxAlturas; i++){ 
            System.out.print("Ingresar altura: ");
            altura = Lector.leerDouble();
            vecAltura [i] = altura;
            suma = suma + altura;
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        double promedio = suma / maxAlturas;
        System.out.println("El promedio de Alturas es: " + promedio);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant = 0;
        for (i = 0; i < maxAlturas; i++)
            if (vecAltura[i] > promedio)
                cant = cant + 1;
        
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de alturas mayores al promedio son: " +cant);

    }
}