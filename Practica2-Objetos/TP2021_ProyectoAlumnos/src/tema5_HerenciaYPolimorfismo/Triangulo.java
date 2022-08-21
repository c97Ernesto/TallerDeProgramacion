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
public class Triangulo extends Figura {    
/*Heredamos de Figura atributos y metodos(ColorRelleno, ColorLinea, etc*/
    private double lado;
    private double altura;
    
    public Triangulo(double lado, double altura, String unColorR, String unColorL){
        super(unColorR, unColorL);
        this.setLado(lado);     //==  this.lado = lado
        this.setAltura(altura);
    }
    
    public void setLado(double lado){
        this.lado = lado;
    }
    public double getLado(){
        return lado;
    }
    
    public void setAltura(double altura){
        this.altura = altura;
    }
    public double getAltura(){
        return altura;
    }
    
    public double calcularArea(){
        return ((this.getLado() * this.getAltura()) / 2);
    }
    
    
    public double calcularPerimetro(){
        return (lado * 3);
    }
    
    
    public String toString(){
        String aux = super.toString() +
                    "Lado: " +this.getLado()+
                    "Altura: " +this.getAltura();
        return aux;
    }
    
}
