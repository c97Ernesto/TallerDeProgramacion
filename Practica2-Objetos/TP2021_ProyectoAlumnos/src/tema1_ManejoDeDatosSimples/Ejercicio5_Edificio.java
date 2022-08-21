/*
5_Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. Realice 
un programa que permita informar la cantidad de personas que concurrieron a 
cada oficina de cada piso. Para esto, simule la llegada de personas al edificio de la 
siguiente manera: a cada persona se le pide el nro. de piso y nro. de oficina a la cual 
quiere concurrir. La llegada de personas finaliza al indicar un nro. de piso 9. Al 
finalizar la llegada de personas, informe lo pedido.
 */
package tema1_ManejoDeDatosSimples;

import PaqueteLectura.Lector;

public class Ejercicio5_Edificio {
    
    public static void main(String[] args){
        
        final int MAX_PISOS = 8;
        final int MAX_OFFICE = 4;
        
        int matriz_Edificio[][] = new int [MAX_PISOS][MAX_OFFICE];
        
        System.out.print("Ingresar piso(0..7): ");
        int piso = Lector.leerInt();
        int office;
        while(piso != 9){
            System.out.print("Ingresar oficina(0..3): ");
            office = Lector.leerInt();
            
            matriz_Edificio[piso][office] += 1; 
            
            System.out.print("Ingresar piso(0..7): ");
            piso = Lector.leerInt();
        }
        
        for (int i = 0; i < MAX_PISOS; i++){
            for (int j = 0; j < MAX_OFFICE; j++){
                System.out.println("Cantidad de Personas en piso " +i+ " y oficina " +j+ " es de " +matriz_Edificio[i][j]);
            }
        }
    }
}
