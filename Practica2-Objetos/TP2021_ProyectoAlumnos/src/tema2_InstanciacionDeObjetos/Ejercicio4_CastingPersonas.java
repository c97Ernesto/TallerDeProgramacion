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
        
    	int dimDias = 5;	//filas
		int dimTurnos = 8;	//columnas
		
		Persona [][] casting = new Persona [dimDias][dimTurnos];
		
		Persona p;
		
		System.out.println("Ingresar nombre: ");
		String nombre = Lector.leerString();
		
		int cantDias = 0;
		int cantTurnos = 0;
		while ((cantDias < dimDias) && (!nombre.equals("ZZZ"))) {
			
			cantTurnos = 0;
			while ((cantTurnos < dimTurnos) && (!nombre.equals("ZZZ"))){
				
				p = new Persona();
				
				p.setNombre(nombre);
				
				System.out.println("Ingresar Dni: ");
				p.setDNI(Lector.leerInt());
				
				System.out.println("Ingresar Edad: ");
				p.setEdad(Lector.leerInt());
				
				casting[cantDias][cantTurnos] = p;
								
				System.out.println("Ingresar nombre: ");
				nombre = Lector.leerString();
				
				cantTurnos ++;
			}
			
			cantDias ++;
			System.out.println("Fin del día "+ cantDias);
		}
		
		for (int dia = 0; dia < cantDias; dia ++) {
		
			System.out.println("Día"+ (dia+1));
			
			for (int turno = 0; turno < cantTurnos; turno ++) {
				
				System.out.print("Turno"+ (turno+1) +": ");
				System.out.println(casting[dia][turno].getNombre());
			
			}
			System.out.println("");
		}
	}	
}
