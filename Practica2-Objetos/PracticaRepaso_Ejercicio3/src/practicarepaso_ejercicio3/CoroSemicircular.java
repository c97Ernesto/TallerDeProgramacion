package practicarepaso_ejercicio3;

public class CoroSemicircular extends Coro{
    
    private Corista [] coristas;

    public CoroSemicircular(Director d, int coristas) {
        super(d, coristas);
        
    }

    @Override
    public void agregarCorista(Corista corista) {
        if (this.getDimL() < this.getMaxCoristas()) {
            this.coristas[this.getDimL()] = corista;
            this.setDimL(this.getDimL() + 1);
        }
    }

    @Override
    public boolean coroBienFormado() {
        
        boolean ok = true;
        int i = 0;
        while ((i < (this.getDimL()-1) && ok)) {
            if (this.coristas[i].getTono() >= this.coristas[i+1].getTono()) {
               i++;
            } else {
                ok = false;
            }
        }
        return ok;
    }
    
    @Override
    public String toString() {
        String aux = super.toString() + "\n";
        
        for (int i = 0; i < this.getDimL(); i++) {
            aux += this.coristas[i].toString()+ "\n";
        }
        
        return aux;
    }
    
}
