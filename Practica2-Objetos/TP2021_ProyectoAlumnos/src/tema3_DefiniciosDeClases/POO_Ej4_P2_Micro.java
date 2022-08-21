/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3_DefiniciosDeClases;

import PaqueteLectura.Lector;

/**
 *
 * @author Ernesto
 */
/*B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar 
del Plata” y hora de salida 5:00. Cargue pasajeros al micro de la siguiente 
manera. Leer nros. de asientos desde teclado que corresponden a pedidos de 
personas. La lectura finaliza cuando se ingresa el nro. de asiento -1 o cuando 
se llenó el micro. Para cada nro. de asiento leído debe: validar el nro; en 
caso que esté libre, ocuparlo e informar a la persona el éxito de la operación; 
en caso que esté ocupado informar a la persona la situación y mostrar el nro. 
del primer asiento libre. Al finalizar, informe la cantidad de asientos 
ocupados del micro.*/
public class POO_Ej4_P2_Micro {
    
    public static void main(String[] args) {
    
        Micro micro = new Micro("ABC123", "Mar del Plata", "5:00");
        
        System.out.println("Ingrese Nro de Asiento: ");
        int nroAsiento = Lector.leerInt();
        
        while ((nroAsiento != -1) && (! micro.EstaLLeno())){
            if (micro.ValidarAsiento(nroAsiento))
                if (! micro.EstadoAsiento(nroAsiento)){
                    micro.Ocupar(nroAsiento);
                    System.out.println("El asiento es suyo");
                }
                else{
                    System.out.println("Asiento Ocupado");
                    int x = micro.PrimerAsientoLibre();
                    if (x !=  -1)
                        System.out.println("El primero asiento disponible es: " +x);
                    else
                        System.out.println("No hay asientos Disponibles");
                }
            else
                System.out.println("Nro Asiento Invalido");
            System.out.println("Ingrese otro Asiento");
            nroAsiento = Lector.leerInt();
        }
        if (micro.EstaLLeno())
            System.out.println("El micro se llenó");
        System.out.println("La cantidad de Asientos Ocupados es: " +micro.AsientosOcup());
    }
    
}
