/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practicarepaso_ejercicio3;

public class Corista extends Persona{
    
    private int tono;
    
    
    public Corista(String nombre, String DNI, int edad, int tono) {
        super(nombre, DNI, edad);
        this.setTono(tono);
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }
    
    @Override
    public String toString(){
        return super.toString() + ". Tono: " + this.getTono();
    }
    
}
