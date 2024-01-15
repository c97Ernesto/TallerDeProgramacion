package practicarepaso_ejercicio3;

public class CoroPorHileras extends Coro{
    
    private Corista[][] coristas;
    private int maxFilas;
    private int maxCol;
    
    public CoroPorHileras(Director d, int maxFilas, int maxCol) {
        super(d, maxFilas*maxCol);
        this.setMaxFilas(maxFilas);
        this.setMaxCol(maxCol);
        this.coristas = new Corista[this.getMaxFilas()][this.getMaxCol()];
    }

    @Override
    public void agregarCorista(Corista corista) {
        
        if (this.getDimL() < this.getMaxCoristas()) {
            int fila = this.getDimL() / this.maxCol;
            int columna = this.getDimL() % this.maxCol;
            this.coristas[fila][columna] = corista;
            this.setDimL(this.getDimL() + 1);
        } else {
            System.out.println("No hay lugar para más coristas.");
        }
    
//        if (this.getDimL() < this.getMaxCoristas()){
//            int i = 0;
//            int j = 0;
//            int n = 0;
//            while (i < this.getMaxFilas()) {
//                
//                j = 0;
//                while (j < this.getMaxCol() || n < this.getDimL()) {
//                    n++;
//                    j++;
//                }
//                
//                i++;
//            }
//            this.coristas[i][j] = corista;
//            
//            this.setDimL(this.getDimL() + 1);
//        } else {
//            System.out.println("No hay lugar para más coristas.");
//        }
        
    }

    public int getMaxFilas() {
        return maxFilas;
    }

    public void setMaxFilas(int maxFilas) {
        this.maxFilas = maxFilas;
    }

    public int getMaxCol() {
        return maxCol;
    }

    public void setMaxCol(int maxCol) {
        this.maxCol = maxCol;
    }

    @Override
    public boolean coroBienFormado() {
        return true;
    }

    
    @Override
    public String toString(){
        String aux = super.toString() + "\n";
        
        for (int fila = 0; fila < this.getMaxFilas(); fila++) 
            for (int col = 0; col < this.getMaxCol(); col ++)
                aux = aux + this.coristas[fila][col].toString() + "\n";
        
        return aux;
    }
    
}
