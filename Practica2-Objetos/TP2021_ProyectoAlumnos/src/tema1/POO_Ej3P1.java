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
public class POO_Ej3P1 {
     public static void main(String[] args) {
        double [] vecAltura;//Paso 2: Declarar la variable vector de double 
        
        vecAltura = new double [15];//Paso 3: Crear el vector para 15 double 
        
        int i;//Paso 4: Declarar indice 
        double suma = 0;
        
        for (i = 0; i < 15; i++){ //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
            double altura = Lector.leerDouble();
            vecAltura [i] = altura;
            suma = suma + altura;
        }
        
        double prom = suma / 15;//Paso 7: Calcular el promedio de alturas, informarlo
        System.out.println("El promedio de Alturas es: " +prom);
        
        int cant = 0;
        for (i = 0; i < 15; i++)   //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
            if (vecAltura[i] > prom)
                cant = cant + 1;
        
        System.out.println("La cantidad de alturas mayores al promedio son: " +cant);//Paso 9: Informar la cantidad.
    
    }
}