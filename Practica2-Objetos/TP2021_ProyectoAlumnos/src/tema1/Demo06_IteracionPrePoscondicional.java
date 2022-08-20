package tema1;

import PaqueteLectura.Lector;

class Demo06_IteracionPrePoscondicional {
    public static void main(String[] args){
        int num, suma; 
              
        System.out.println("Comienza a ejecutar el while. Ingrese numeros. Finaliza cuando ingresa uno mayor que 10");
        suma=0;
        num = Lector.leerInt();
        while (num <= 10) {
             suma= suma+num;
             num = Lector.leerInt();
        }
        System.out.println("La suma es: " + suma);
        
        System.out.println("Comienza a ejecutar el do-while. Ingrese numeros. Finaliza cuando ingresa uno mayor que 10");
        suma=0;
        do{
            num = Lector.leerInt();
            suma=suma+num;
        }while (num <= 10);
        System.out.println("La suma es: " + suma);
    }
}