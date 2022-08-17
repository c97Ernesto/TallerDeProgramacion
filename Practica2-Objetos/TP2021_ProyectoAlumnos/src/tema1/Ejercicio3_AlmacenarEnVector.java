/*3_Escriba un programa que lea las alturas de los 15 jugadores de un equipo de 
    básquet y las almacene en un vector. Luego informe: 
        - la altura promedio
        - la cantidad de jugadores con altura por encima del promedio
*/
package tema1;
    import PaqueteLectura.Lector;
/**
 *
 * @author Ernesto
 */
public class Ejercicio3_AlmacenarEnVector {
     public static void main(String[] args) {
        double [] vecAltura;//Paso 2: Declarar la variable vector de double 
        int maxAlturas = 3;
        
        vecAltura = new double [maxAlturas];//Paso 3: Crear el vector para 15 double 
        
        int i;//Paso 4: Declarar indice 
        double suma = 0;
        double altura;
        
        for (i = 0; i < maxAlturas; i++){ //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
            System.out.print("Ingresar altura: ");
            altura = Lector.leerDouble();
            vecAltura [i] = altura;
            suma = suma + altura;
        }
        
        double prom = suma / maxAlturas;//Paso 7: Calcular el promedio de alturas, informarlo
        System.out.println("El promedio de Alturas es: " +prom);
        
        int cant = 0;
        for (i = 0; i < maxAlturas; i++)   //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
            if (vecAltura[i] > prom)
                cant = cant + 1;
        
        System.out.println("La cantidad de alturas mayores al promedio son: " +cant);//Paso 9: Informar la cantidad.
    
    }
}