/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5_HerenciaYPolimorfismo;

/**
 *
 * @author Ernesto
 */
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio, String unColorR, String unColorL){
        super(unColorR, unColorL);
        this.setRadio(radio);
    }
    
    public void setRadio(double radio){
        this.radio = radio;
    }
    public double getRadio(){
        return radio;
    }
    
    public double calcularArea(){
        return(Math.PI * Math.pow(radio,2));
    }
    
    public double calcularPerimetro(){
        return 2*Math.PI*radio;
    }
    
    public String toString(){
        String aux = super.toString() +
                "Radio: " + this.getRadio();
        return aux; 
        
    }
}
