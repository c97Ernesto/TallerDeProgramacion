package tema5_HerenciaYPolimorfismo;

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

