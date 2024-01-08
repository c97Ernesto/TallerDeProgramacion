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
	private double sueldoBasico;
	private int campeonatosG;

    
    /*IMPLEMENTAR CONTRUCTOR
    método que nos dará una instancia(un objeto) de 
    la clase a la que pertenece*/
    //Constructor NULO
    public Entrenador (){}
	public Entrenador(String nombre, double sueldoBasico, int campeonatosGanados) {
        /*Construccion del objeto con los parametros que le pasamos*/
		this.nombre = nombre;
		this.sueldoBasico = sueldoBasico;
		this.campeonatosG = campeonatosGanados;
    }
    
	public void setNombre(String cadena) {
		this.nombre = cadena;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public void setSueldoBasico(double real) {
		this.sueldoBasico = real;
	}
	
	public double getSueldoBasico() {
		return this.sueldoBasico;
	}
	
	public void setCampeonatosG(int entero) {
		this.campeonatosG = entero;
	}
	
	public int getCampeonatosG() {
		return this.campeonatosG;
	}
	
    public double calcularSueldoACobrar(){
        if (this.campeonatosG < 11)
            if (this.campeonatosG < 5) 
                if (this.campeonatosG < 1)
                    return (this.sueldoBasico);
                else
                    return(this.sueldoBasico + 5000);
            else
                return(this.sueldoBasico + 30000);
        else
            return (this.sueldoBasico + 50000);    
    }
}
