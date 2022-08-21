/*
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el 
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
    - La cantidad de partidos que ganó River.
    - El total de goles que realizó Boca jugando de local.
    - El porcentaje de partidos finalizados con empate. 
 */
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio6_GenerarPartidos {
    
    public static void main(String[] args) {    
        int dimF = 20;
        Partido vecPartidos [] = new Partido [dimF];
        
        
        for (int i = 0; i < dimF; i++)
            vecPartidos[i] = null;
        
        String fin = ("ZZZ");
        
        System.out.println("Ingrese nombre Equipo Local");
        String nombreL = Lector.leerString();
        System.out.println("Ingrese nombre Equipo Visitante");
        String nombreV = Lector.leerString();
        
        Partido partido;
        int dimL = 0;
        while ((dimL < dimF) && (nombreV.equals(fin))){
            
            partido = new Partido();
            
            partido.setLocal(nombreL);
            System.out.println("Ingrese los goles de: " +nombreL);
            partido.setGolesLocal(Lector.leerInt());
            
            partido.setVisitante(nombreV);
            System.out.println("Ingrese los goles de: " +nombreV);
            partido.setGolesVisitante(Lector.leerInt());
            
            vecPartidos[dimL] = partido;
            
            dimL++;   
        }
    }
}
