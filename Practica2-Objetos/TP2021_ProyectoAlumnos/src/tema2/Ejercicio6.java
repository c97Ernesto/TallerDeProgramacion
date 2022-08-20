/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author Ernesto
 */
public class Ejercicio6 {
    public static void main(String[] args) {    
        
        int dimF = 20;
        Partido vecP [] = new Partido [dimF];
        Partido partido;
        
        
        
        for (int i = 0; i < dimF; i++)
            vecP[i] = null;
        
        String fin = new String ("ZZZ");
        
        System.out.println("Ingrese nombre Equipo Local");
        String nombreL = Lector.leerString();
        System.out.println("Ingrese nombre Equipo Visitante");
        String nombreV = Lector.leerString();
        
        int dimL = 0;
        while ((dimL < dimF) && (nombreV.equals(fin))){
            
            partido = new Partido();
            
            partido.setLocal(nombreL);
            System.out.println("Ingrese los goles de: " +nombreL);
            partido.setGolesLocal(Lector.leerInt());
            
            partido.setVisitante(nombreV);
            System.out.println("Ingrese los goles de: " +nombreV);
            partido.setGolesVisitante(Lector.leerInt());
            
            vecP[dimL] = partido;
            
            dimL++;
            
        }
        
        
    }
    
    
}
