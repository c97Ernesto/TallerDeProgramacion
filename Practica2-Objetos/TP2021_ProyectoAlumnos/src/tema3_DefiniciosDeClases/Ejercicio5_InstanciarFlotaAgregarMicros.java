/*
B_Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) 
a la flota con información leída desde teclado (hasta que se ingresa la patente 
“ZZZ000” o hasta completar la flota). Luego lea una patente y elimine de la 
flota el micro con esa patente; busque el micro con dicha patente para 
comprobar que ya no está en la flota. Para finalizar, lea un destino e informe 
la patente del micro que va a dicho destino. 
 */
package tema3_DefiniciosDeClases;

import PaqueteLectura.Lector;

public class Ejercicio5_InstanciarFlotaAgregarMicros {
    
    public static void main(String[] args) {
        
        Flota flota = new Flota();
        
        String fin = "ZZZ000";
        
        System.out.println("Ingrese Patente del Micro(ZZZ000 para terminar): ");
        String patente = Lector.leerString();
        
        String destino, horaSalida;
        
        while ((! patente.equals(fin)) && (! flota.flotaCompleta())){
            
            System.out.println("Ingrese Destino del Micro: ");
            destino = Lector.leerString();
            
            System.out.println("Ingrese Hora de Salida: ");
            horaSalida = Lector.leerString();
            
            Micro micro = new Micro(patente, destino, horaSalida);
            flota.agregarMicro(micro);
            
            System.out.println("Ingrese Patente del Micro: ");
            patente = Lector.leerString();
        }
        
        System.out.println("Ingrese Patente del Micro a Eliminar");
        patente = Lector.leerString();
        if(flota.eliminarMicro(patente))
            System.out.println("El micro se Eliminó");
        else
            System.out.println("No se encontró el Micro");
            
        if (flota.buscarMicroPatente(patente) == null)
            System.out.println("El Micro no se encuentra");
        
        System.out.println("Ingrese Destino");
        destino = Lector.leerString();
        
        if (flota.buscarMicroDestino(destino) != null)
            System.out.println("El Micro con Destino a: " + destino + 
                    "es: " + flota.buscarMicroDestino(destino).getPatente());
        

    }
    
    
            
            
            
}
