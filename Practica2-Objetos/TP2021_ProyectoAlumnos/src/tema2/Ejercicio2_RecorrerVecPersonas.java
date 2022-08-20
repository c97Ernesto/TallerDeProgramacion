package tema2;

import PaqueteLectura.Lector;

public class Ejercicio2_RecorrerVecPersonas {
    public static void main(String[] args) {
        
        int dimF = 4;
        
        Persona [] vec_personas = new Persona [dimF]; 
     /*   Tipo  [] Var  = definimos que vecP almacenará dimF valores Persona  */
        Persona persona;        //var per tipo Persona
        for (int i = 0; i < dimF; i++){
            persona = new Persona();  //instanciamos Persona(persona)
            
            System.out.println("Ingrese Nombre");
            persona.setNombre(Lector.leerString());
            System.out.println("Ingrese DNI");
            persona.setDNI(Lector.leerInt());
            System.out.println("Ingrese Edad");
            persona.setEdad(Lector.leerInt());
            
            vec_personas[i] = persona;
        }
        
        int cantMayores65 = 0;
         
        Persona perMin = new Persona();
        perMin.setDNI(99999);
        
        for (int i = 0; i < dimF; i++){   
            if (vec_personas[i].getEdad() > 65)
                cantMayores65++;   
            
            if (vec_personas[i].getDNI() < perMin.getDNI())
                perMin = vec_personas[i];
        }
        System.out.println("La cantidad de personas mayores a 65 es: "+ cantMayores65);
        System.out.println("La persona de menor DNI es: "+ perMin.toString());
        
    }
    
}
