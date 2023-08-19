package tema2_InstanciacionDeObjetos;

import PaqueteLectura.Lector;

public class Ejercicio1_MostrarDatos {

    public static void main(String[] args) {
        System.out.print("Nombre de la persona: ");
        String nombre = Lector.leerString();
        
        System.out.print("Dni de la persona: ");
        int dni = Lector.leerInt();
        
        System.out.print("Años de la persona: ");
        int anios = Lector.leerInt();

        Persona p = new Persona(nombre, dni, anios);
        
        System.out.println(p.toString());
        

    }

}
