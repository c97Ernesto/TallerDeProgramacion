/*
 Muestra Hola Mundo en consola.

 */
package tema1_ManejoDeDatosSimples;

public class Demo04_Salida {

   public static void main(String[] args) {
        System.out.print("Hola Mundo! "); 
        System.out.println("Hola Mundo! "); 
        System.out.println(1234);
        System.out.println(true);
        int año=2016;
        System.out.println ("Hola Mundo " + año + "!");

        String saludo1=new String("hola");
        String saludo2=new String("hola");
        System.out.println(saludo1 == saludo2);
        System.out.println(saludo1 != saludo2);
        System.out.println(saludo1.equals(saludo2));
   }
}





