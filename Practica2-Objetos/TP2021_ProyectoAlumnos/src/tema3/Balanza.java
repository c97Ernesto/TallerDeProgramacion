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
public class Balanza {
    
    private double monto;
    private int cantItems;
    
    public Balanza(){
        
    }
    
    public void inicializarCompra(){
        this.monto = 0;
        this.cantItems = 0;
    }
    
    public int getCantItems(){
        return cantItems;
    }
    
    public void registrarProducto (double pesoEnKg, double precioPorKg){
        this.monto = (pesoEnKg * precioPorKg);
        this.cantItems ++;
   }
    public double devolverMontoAPagar(){
        return monto;
    }
    
 /*   ▪ devolverResumenDeCompra() para que retorne un String del siguiente estilo:
“Naranja 100 pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos
por la compra de 3 productos” . La sección subrayada es el contenido de resumen.*/
    
    public String devolverResumenDeCompra(){
        return "Total a pagar: " + devolverMontoAPagar() + " Por la compra de: "
                + getCantItems();
    }
}
