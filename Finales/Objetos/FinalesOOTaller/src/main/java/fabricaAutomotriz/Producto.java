
package fabricaAutomotriz;

public class Producto {

    private int codigo;
    private double costo;
    private int etapa;

    public Producto(int codigo) {
        this.codigo = codigo;
        this.costo = 0;
        this.etapa = 1;
    }
    
    boolean estadoFinalizado() {
        return etapa == 5;
    }
    
    void actualizarProducto(double unCosto) {
        this.setCosto(getCosto() + unCosto);
        this.setEtapa(getEtapa() + 1);
    }
    
    // GETTERS AND SETTERS
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getEtapa() {
        return etapa;
    }

    public void setEtapa(int etapa) {
        this.etapa = etapa;
    }
}
