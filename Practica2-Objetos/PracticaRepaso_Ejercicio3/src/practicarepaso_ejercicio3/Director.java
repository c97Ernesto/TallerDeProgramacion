/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practicarepaso_ejercicio3;

public class Director extends Persona{
    
    private int antiguedad;
    
    public Director(String nombre, String DNI, int edad, int antiguedad) {
        super(nombre, DNI, edad);
        this.setAntiguedad(antiguedad);
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString(){
        return super.toString() + ". Antiguedad: " +this.getAntiguedad();
    }
    
}
