/*
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el 
campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
    - La cantidad de partidos que ganó River.
    - El total de goles que realizó Boca jugando de local.
    - El porcentaje de partidos finalizados con empate. 
 */
package tema2_InstanciacionDeObjetos;

import PaqueteLectura.Lector;

public class Ejercicio6_GenerarPartidos {
    
    public static void main(String[] args) {    
        int dimF = 3;
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
        while ((dimL < dimF) && !(nombreV.equals(fin))){
            
            partido = new Partido();
            
            partido.setLocal(nombreL);
            partido.setVisitante(nombreV);
            
            System.out.println("Ingrese los goles de: "+ nombreL);
            partido.setGolesLocal(Lector.leerInt());
            partido.setVisitante(nombreV);
            System.out.println("Ingrese los goles de: "+ nombreV);
            partido.setGolesVisitante(Lector.leerInt());
            
            vecPartidos[dimL] = partido;
            
            dimL++;
            
            System.out.println("Ingrese nombre Equipo Local");
            nombreL = Lector.leerString();
            System.out.println("Ingrese nombre Equipo Visitante");
            nombreV = Lector.leerString();
        }
        
        int vecesGanoRiver = 0; int golesBoca = 0; int partidosEmpatados = 0;
        int i;
        
        for(i = 0; i < dimL; i++) {
            if (vecPartidos[i].getGanador().equals("riber")) 
                vecesGanoRiver++;
            
            if (vecPartidos[i].getLocal().equals("Club Atlético Boca Juniors"))
                golesBoca = golesBoca + vecPartidos[i].getGolesLocal();
            
            if (vecPartidos[i].hayEmpate())
                partidosEmpatados++;
        }
        
        System.out.println("Cantidad de partidos que ganó riber: "+ vecesGanoRiver);
        System.out.println("Cantidad de goles de Boca como local: "+ golesBoca);
        System.out.println("Promedio de partidos empatados: "+ partidosEmpatados/dimL*100);
    }
}
