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
public class VisorFigurasModificado {
    private int guardadas;
    private Figura [] vector;
    
    public VisorFigurasModificado(){
        this.guardadas = 0;
        
    }
    
    public void guardar(Figura f){
        vector[guardadas] = f;
        guardadas++;
    }
    
    public boolean quedaEspacio(){
        return (guardadas < 5);
    }
    
    public void mostrar(){
        for(int i = 0; i < this.guardadas; i++)
            System.out.println(this.vector[i].toString());
    }
    
    public int getGuardadas() {
        return guardadas;
    }
}

