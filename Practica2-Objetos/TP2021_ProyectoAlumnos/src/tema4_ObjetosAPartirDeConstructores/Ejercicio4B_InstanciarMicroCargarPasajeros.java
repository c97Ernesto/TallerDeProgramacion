/*
B_Realice un programa que cree un micro con patente “ABC123”, destino “Mar 
del Plata” y hora de salida 5:00. Cargue pasajeros al micro de la siguiente 
manera. Leer nros. de asientos desde teclado que corresponden a pedidos de 
personas. La lectura finaliza cuando se ingresa el nro. de asiento -1 o cuando 
se llenó el micro. Para cada nro. de asiento leído debe: validar el nro; en 
caso que esté libre, ocuparlo e informar a la persona el éxito de la operación; 
en caso que esté ocupado informar a la persona la situación y mostrar el nro. 
del primer asiento libre. Al finalizar, informe la cantidad de asientos 
ocupados del micro.
*/
package tema4_ObjetosAPartirDeConstructores;

import tema4_ObjetosAPartirDeConstructores.Micro;
import PaqueteLectura.Lector;

public class Ejercicio4B_InstanciarMicroCargarPasajeros {
    
	public static void main(String[] args) {	
		
		Micro micro = new Micro("ABC123", "Mar del Plata", "5:00");
		

		System.out.print("Ingresar un número de asiento: ");
		int nroAsiento = Lector.leerInt();
		
		while ((nroAsiento != -1) && (!micro.estaLleno())) {
			
			if (micro.validarAsiento(nroAsiento)) {
				
				if (!micro.estadoAsiento(nroAsiento)) {
					micro.ocupar(nroAsiento);
					System.out.println("El asiento fue reservado con éxito.");
					
				} 
				else {
					System.out.println("El asiento" + nroAsiento + " se encuentra ocupado.");
					System.out.println("El primero asiento disponible es el: " + micro.primerAsientoLibre() + ".");
				}
				
				
			} else System.out.println("El nro de asiento ingresado no pertenece al micro.");

			System.out.print("Ingresar un número de asiento: ");
			nroAsiento = Lector.leerInt();
		}
		if (micro.estaLleno())
            System.out.println("El micro se encuentra lleno");
		
		System.out.println("La cantidad de asientos ocupados es: " + micro.asientosOcupados());

	
	}
    
}
