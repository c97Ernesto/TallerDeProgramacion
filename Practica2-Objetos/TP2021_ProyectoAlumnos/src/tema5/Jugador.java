/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author Ernesto
 */
public class Jugador extends Empleado {
    private int partJugados;
    private int goles;
    
    public Jugador (String nombre, double sueldoBasico, int partidos, int goles){
        super(nombre, sueldoBasico);
        this.partJugados = partidos;
        this.goles = goles;
    }
    
    public int getPartJugados(){
        return partJugados;
    }
    public void setPartJugados(int partJugados){
        this.partJugados = partJugados;
    }   
    
    public int getGoles(){
        return goles;
    }
    public void setGoles (int goles){
        this.goles = goles;
    }
    
    public double calcularSueldoACobrar(){
        double aux = (double) (goles / partJugados);
        if (aux > 0.5) 
            return (getSueldoBasico() * 2);
        else
            return getSueldoBasico();
    }
    
    public String toString(){
        return "JUGADOR//" + super.toString() + " con: " + this.getPartJugados() +" partidos y " + this.getGoles() + "goles";
    }
}
