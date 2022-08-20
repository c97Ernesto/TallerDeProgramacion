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
public class Ejercicio4 {
    public static void main(String[] args) {    
        
        int dimFfil = 5, dimFcol = 8;
        int dimLfil = 0, dimLcol = 0;
        Persona matriz[][] = new Persona [dimFfil][dimFcol];
        
        Persona persona;
        
        String zzz = new String ("ZZZ") ;
        
        System.out.println("Ingrese nombre");
        String nombre = Lector.leerString();
        
        while ((dimLfil < dimFfil) != (nombre.equals(zzz))){
            
            while ((dimLcol < dimFcol) != (nombre.equals(zzz))){

                persona = new Persona();
               
                persona.setNombre(nombre);
                System.out.println("Ingrese DNI");
                persona.setDNI(Lector.leerInt());
                System.out.println("Ingrese Edad");
                persona.setEdad(Lector.leerInt());
                
                matriz[dimLfil][dimLcol] = persona;   
                
                dimLcol++;
                
                System.out.println("Fin Cupo "+ dimLcol);
                
                System.out.println("Ingrese nombre");
                nombre = Lector.leerString();
            }
            dimLfil++;
        }
        
        int i, j;
        
        for (i = 0; i < dimFfil; i++){
            System.out.println("TURNO"+ (i + 1));
            for (j = 0; j < dimFcol; j++){
                System.out.println("CUPO"+ (j + 1));
                System.out.println(matriz[i][j].toString());
            }
        }
    }
}
