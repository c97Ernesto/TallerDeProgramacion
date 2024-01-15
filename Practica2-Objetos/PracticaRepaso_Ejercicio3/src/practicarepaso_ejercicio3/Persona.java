
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practicarepaso_ejercicio3;

/**
 *
 * @author Ernes
 */
public abstract class Persona {
    
    private String nombre;
    
    private String DNI;
    
    private int edad;
    
    
    
    public Persona(String nombre, String DNI, int edad){
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(edad);
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString(){
        return "Nombre: "+ this.getNombre();
    }
    
}