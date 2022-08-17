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
public class POO_Ej2P2 {
    public static void main(String[] args) {
        
        int dimF = 4;
        
        Persona [] vecP = new Persona [dimF]; 
     /*   Tipo  [] Var  = definimos que vecP almacenará dimF valores Persona  */
        int i;
        Persona persona;        //var per tipo Persona
        for (i = 0; i < dimF; i++){
            
            persona = new Persona();  //instanciamos Persona(persona)
            
            System.out.println("Ingrese Nombre");
            persona.setNombre(Lector.leerString());
            System.out.println("Ingrese DNI");
            persona.setDNI(Lector.leerInt());
            System.out.println("Ingrese Edad");
            persona.setEdad(Lector.leerInt());
            
            vecP[i] = persona;
        }
        
         int min = 999999, mayor65 = 0;
//       int pos = 1,
        Persona perMin = new Persona();
        perMin.setDNI(99999);
        for (i = 0; i < dimF; i++){
            
            if (vecP[i].getEdad() > 65)
                mayor65++;
            
            
            
            if (vecP[i].getDNI() < perMin.getDNI())
                perMin = vecP[i];
            
            
//            if (vecP[i].getDNI() < min){
//                pos = i;
//              min = vecP[i].getDNI();
//            }
        }
        System.out.println("La cantidad de personas mayores a 65 es: "+ mayor65);
 //     System.out.println("La persona de menor DNI es: "+ vecP[pos].toString());
        System.out.println("La persona de menor DNI es: "+ perMin.toString());
        
    }
    
}
