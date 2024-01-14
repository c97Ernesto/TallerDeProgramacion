public abstract class Recital {
    
    private String nombreBanda;
    private String [] temas;
    private int maxTemas;
    private int dimLTemas;
    
    public Recital(String nombre, int temas){
        this.setNombreBanda(nombre);
        this.setMaxTemas(temas);
        this.setDimLTemas(0);
        this.iniciarTemas(this.getMaxTemas());
    }
    

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getMaxTemas() {
        return maxTemas;
    }

    public void setMaxTemas(int maxTemas) {
        this.maxTemas = maxTemas;
    }
    
    public int getDimLTemas() {
        return dimLTemas;
    }

    public void setDimLTemas(int dimL) {
        this.dimLTemas = dimL;
    }

    private void iniciarTemas(int maxTemas) {
        this.temas = new String[maxTemas];
        for (int i = 0; i < maxTemas; i++) {
            this.temas[i] = null;
        }
    }
    
    public void agregarTema(String nombre) {
        if (this.getDimLTemas() < this.getMaxTemas()) {
            this.temas[this.getDimLTemas()] = nombre;
            this.setDimLTemas(this.getDimLTemas() + 1);
        } else {
            System.out.println("No se pueden agregar más temas.");
        }
    }
    
    public String actuar(){
        String aux = "";
        for (int i = 0; i < this.getDimLTemas(); i++) {
            aux += "Y ahora tocaremos: " + this.temas[i] + " .";
        }
        
        return aux;
    }
    
    public abstract double calcularCosto();
    
}
