package practicarepaso_ejercicio3;

public abstract class Coro {
    
    private String nombre;
    
    private Director director;
    
    private int maxCoristas;
    
    private int dimL;
    
    
    
    public Coro(Director d, int coristas) {
        this.setDirector(d);
        this.setMaxCoristas(coristas);
        this.setDimL(0);
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public int getMaxCoristas() {
        return maxCoristas;
    }

    public void setMaxCoristas(int maxCoristas) {
        this.maxCoristas = maxCoristas;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public abstract void agregarCorista(Corista c);
    
    public boolean coroLleno(){
        return this.getDimL() == this.getMaxCoristas();
    }
    
    public abstract boolean coroBienFormado();
    
    public String toString(){
        return "Nombre del Coro: " + this.getNombre() + "\n" +
                "Nombre de director: " + this.getDirector().getNombre() + ". \n";
    }
    
}
