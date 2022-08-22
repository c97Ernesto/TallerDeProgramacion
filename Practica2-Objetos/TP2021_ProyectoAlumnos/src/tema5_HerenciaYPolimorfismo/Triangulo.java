/*
1_A.Agregar la clase Triángulo a la jerarquía de figuras vista en clase (paquete tema5 del 
proyecto). Triángulo debe heredar de Figura todo lo que es común y definir su constructor 
y sus atributos y métodos propios. Además debe redefinir el método toString.
*/
package tema5_HerenciaYPolimorfismo;

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
