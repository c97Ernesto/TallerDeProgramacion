/*
4_Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno.
    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
    nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
    personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
    40 cupos de casting.
    Una vez finalizada la inscripción: 
    b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar
 */
package tema2_InstanciacionDeObjetos;

import PaqueteLectura.Lector;

public class Ejercicio4_CastingPersonas {
    public static void main(String[] args) {    
        
        int dimFdias = 3, dimFturnos = 3;
        
        Persona matriz[][] = new Persona [dimFdias][dimFturnos];
        
        Persona persona;
        
        String zzz = "ZZZ" ;
        
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();
        
        int i = 0; int j;
        while ((i < dimFdias) != (nombre.equals(zzz))){
            j = 0;
            while ((j < dimFturnos) != (nombre.equals(zzz))){
                persona = new Persona();
               
                persona.setNombre(nombre);
                System.out.println("Ingrese DNI");
                persona.setDNI(Lector.leerInt());
                System.out.println("Ingrese Edad");
                persona.setEdad(Lector.leerInt());
                
                matriz[i][j] = persona;   
                
                j++;
                
                System.out.println("Ingrese nombre");
                nombre = Lector.leerString();
            }
            i++;
            System.out.println("Fin del día: "+ i);
        }
        
        for (i = 0; i < dimFdias; i++){
            System.out.println("TURNO"+ (i + 1));
            for (j = 0; j < dimFturnos; j++){
                System.out.println("CUPO"+ (j + 1));
                System.out.println(matriz[i][j].toString());
            }
        }
    }
}
