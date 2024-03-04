package ProgPrincipal;

public class Bien {
    private String descripcion;
    private int cant;
    private double costoUnidad;
    
    public Bien(String descripcion, int cant, double costo){
        this.descripcion = descripcion;
        this.cant = cant;
        this.costoUnidad = costo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public double getCostoUnidad() {
        return costoUnidad;
    }

    public void setCostoUnidad(double costo) {
        this.costoUnidad = costo;
    }
    
    public double costoFinal(){
        return this.getCostoUnidad() * this.getCant();
    }
    
    public String representacionBien() {
        String representacion = "Descripcion: "+ this.getDescripcion() +" | " +
                "Cantidad: " + this.getCant() +" | " +
                "Costo por unidad: " + this.getCostoUnidad() +
                " \n";
        
        return representacion;
    }
}
