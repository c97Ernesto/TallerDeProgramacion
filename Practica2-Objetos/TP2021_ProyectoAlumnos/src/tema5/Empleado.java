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
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    
    public Empleado (String nombre, double sueldoBasico){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
    }
            
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    public void setSueldoBasico(double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        String aux = "Nombre: " + getNombre() +
                    "Sueldo a Cobrar: " + this.calcularSueldoACobrar() + "";
        return aux;
    }
    
}
