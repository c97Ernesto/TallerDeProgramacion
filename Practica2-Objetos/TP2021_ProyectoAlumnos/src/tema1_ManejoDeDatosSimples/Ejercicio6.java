/*
6- Escriba un programa que simule el ingreso de personas a un banco. Cada
persona que ingresa indica la operación que desea realizar (0: “cobro de cheque” 1:
“depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 3: “cobro de
jubilación” 4: “cobro de planes”). La recepción de personas culmina cuando un
empleado ingresa la operación 5 (cierre del banco). Informar la cantidad de
personas atendidas por cada operación y la operación más solicitada.
 */
package tema1_ManejoDeDatosSimples;

import PaqueteLectura.Lector;

public class Ejercicio6 {

    public static void main(String[] args) {
        // TODO code application logic here

        int [] operaciones = new int [5];
        
        System.out.println("Ingresar número de operación a realizar (5 para cerrar): ");
        System.out.println("0. Cobro de Cheque");
        System.out.println("1. Depósito/Extracción");
        System.out.println("2. Pago de impuestos/servicios");
        System.out.println("3. Cobro de jubilación");
        System.out.println("4. Cobro de Cheque");
        System.out.println("5. Cobro de Cheque");

        int num = Lector.leerInt();

        while (num != 5) {
            operaciones[num]++;
            
            System.out.println("Ingresar número de operación a realizar (5 para cerrar): ");
            System.out.println("0. Cobro de Cheque");
            System.out.println("1. Cobro de Cheque");
            System.out.println("2. Cobro de Cheque");
            System.out.println("3. Cobro de Cheque");
            System.out.println("4. Cobro de Cheque");
            System.out.println("5. Cobro de Cheque");
            
            num = Lector.leerInt();
            
        }
        
        int maxPos = -1;
        int maxOperacion = 0;
        for (int i = 0; i < 5; i++) {
            System.out.println("Cant de personas que solicitaron la operación "+ i 
                    +" fue: "+ operaciones[i]);
            
            if (operaciones[i] > maxOperacion){
                maxOperacion = operaciones[i];
                maxPos = i;
            }
        }
        if (maxPos != -1) {
            System.out.println("Operación más realizada: "+ maxOperacion);
        } else {
            System.out.println("No hubo operaciones.");
        }
        

    }

}
