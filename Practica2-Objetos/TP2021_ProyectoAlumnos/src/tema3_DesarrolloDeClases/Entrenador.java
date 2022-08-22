/*
3_A.Definir una clase para representar entrenadores de un club de fútbol. Un 
entrenador se caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
    ▪ Defina métodos para obtener/modificar el valor de cada atributo.
    ▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar 
    por el entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona 
    un plus por campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 
    si ha ganado entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
 */
package tema3_DesarrolloDeClases;
/*DEFINIMOS CLASE
definimos la clase como pública para poder usarla desde otro lugar*/
public class Entrenador { 
    /*Atributos: los definimos como privados para que solo sean 
    accedidos desde ésta clase*/
    private String nombre;
    private double sueldo;
    private int campeonatos;
    
    /*IMPLEMENTAR CONTRUCTOR
    método que nos dará una instancia(un objeto) de 
    la clase a la que pertenece*/
    //Constructor NULO
    public Entrenador (){}
    public Entrenador (String nombre, double sueldo, int campeonatos){
        /*Construccion del objeto con los parametros que le pasamos*/
        this.iniciar(nombre, sueldo, campeonatos);
    }
    private void iniciar(String nombre, double sueldo, int campeonatos){
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.campeonatos = campeonatos;
    }
    
    public void  setNombre(String nombre){
        this.nombre = nombre;
    }
    public String getNombre(){
        return nombre;
    }
    public void setSueldo(double sueldo){
        this.sueldo = sueldo;
    }
    public double getSueldo(){
        return sueldo;
    }
    public void setCampeonatos(int campeonatos){
        this.campeonatos = campeonatos;
    }
    public int getCampeonatos(){
        return campeonatos;
    }
    
    public String toString() {
        return "Nombre: " +nombre+ " Sueldo: " +sueldo+ "Campeonatos:"+campeonatos; 
    }
    
    public double calcularSueldoACobrar(){
        if (campeonatos < 11)
            if (campeonatos < 5) 
                if (campeonatos < 1)
                    return (sueldo);
                else
                    return(sueldo + 5000);
            else
                return(sueldo + 30000);
        else
            return (sueldo + 50000);    
    }
}
