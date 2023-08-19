package tema2_InstanciacionDeObjetos;

import PaqueteLectura.Lector;

public class Ejercicio2_RecorrerVecPersonas {
    public static void main(String[] args) {
        
        int dimF = 4;
        int i;
     
        /*   Tipo  [] Var  = definimos que vecP almacenará dimF valores Persona  */
        Persona [] vecPersonas = new Persona [dimF]; 
     
        //var persona tipo Persona
        Persona persona;        
        
        for (i = 0; i < dimF; i++){
            //instanciamos Persona(persona)
            persona = new Persona();  //instanciamos Persona(persona)
            
            System.out.println("Ingrese Nombre");
            persona.setNombre(Lector.leerString());
            System.out.println("Ingrese DNI");
            persona.setDNI(Lector.leerInt());
            System.out.println("Ingrese Edad");
            persona.setEdad(Lector.leerInt());
            
            vecPersonas[i] = persona;
        }
        
        int cantMayores65 = 0;
         
        Persona perMin = new Persona();
        perMin.setDNI(99999);
        
        for (i = 0; i < dimF; i++){   
            if (vecPersonas[i].getEdad() > 65)
                cantMayores65++;   
            
            if (vecPersonas[i].getDNI() < perMin.getDNI())
                perMin = vecPersonas[i];
        }
        
        System.out.println("La cantidad de personas mayores a 65 es: "+ cantMayores65);
        System.out.println("La persona de menor DNI es: "+ perMin.toString());
        
    }
    
}
