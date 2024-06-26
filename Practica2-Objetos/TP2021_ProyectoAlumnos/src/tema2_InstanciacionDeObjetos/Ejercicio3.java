package tema2_InstanciacionDeObjetos;

public class Ejercicio3 {

    public static void main(String[] args) {

        String saludo1 = new String("hola");
        String saludo2 = new String("hola");

//      Con los operadores "==" y "!=" evaluamos la instanciación del objeto en la 
//      memoria, es decir, comparamos si dos referencias de objetos apuntan a la 
//      misma ubicación en memoria.
        System.out.println(saludo1 == saludo2);
        System.out.println(saludo1 != saludo2);

//      Con equals() comparamos el contenido o valor del objeto. Cada clase puede
//      definir como se compara el contenido de sus objetos utilizando éste método
        System.out.println(saludo1.equals(saludo2));

        Persona p1;
        Persona p2;
        
        p1 = new Persona();     //creamos objeto p1
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);
        
        p2 = new Persona();     //creamos objeto p2
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);
        
        p1 = p2;        //las dos variables apuntan al mismo objeto
        
        p1.setEdad(p1.getEdad() + 1);
        
        System.out.println(p2.toString());
        System.out.println(p1.toString());
        System.out.println(p1 == p2);     //verdadeo: apuntan al mismo objeto
    }
}
