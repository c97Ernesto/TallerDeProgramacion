/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Ernesto
 */
/*
1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza 
por el tamaño de sus 3 lados (double), el color de relleno (String) y el color 
de línea (String). El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)
*/
public class Triangulo {
     /* Declaración del estado del objeto*/
    private double lado1, lado2, lado3;
    private String colorR;
    private String colorL;
    
    
    
         
    
     /* Declaración de constructor(es) */
    public Triangulo(){ //el PP busca el constructor que necesite
        //constructor NULO 
    }
    
    public Triangulo(double l1, double l2, double l3, String cR, String cL ) {    
        this.lado1 = l1;
        this.lado2 = l2;
        this.lado3 = l3;
        this.colorR = cR;
        this.colorL = cL;
        
        
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    public void setColorR(String colorR) {
        this.colorR = colorR;
    }
    public void setColorL(String colorL) {  //this se agrega automaticamente para
//diferenciar parametro de atributo
        this.colorL = colorL;
    }
    
    public double getLado1() {  //tambien se le puede agregar this al return
        return this.lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public String getColorR() {
        return colorR;
    }
    public String getColorL() {
        return colorL;
    }
    
}
