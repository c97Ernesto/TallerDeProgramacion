package tema1_ManejoDeDatosSimples;

import PaqueteLectura.Lector; 			// Importar funcionalidad para lectura
public class Demo05_Entrada 
{
    public static void main(String[] args) {
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();  	                //Lee y devuelve el string ingresado antes del enter
        System.out.println("Ingrese si trabaja (true/false)");  
        boolean trabaja = Lector.leerBoolean();	                //Lee y devuelve el boolean ingresado antes del enter
        System.out.println("Ingrese edad");
        int edad = Lector.leerInt();	                                 //Lee y devuelve el int ingresado antes del enter
        System.out.println("Ingrese sueldo");
        double sueldo = Lector.leerDouble();	              //Lee y devuelve el double ingresado antes del enter
        
        System.out.println("N:" + nombre + " T:" + trabaja + " E:" + edad + " S:" + sueldo );
    }
}
