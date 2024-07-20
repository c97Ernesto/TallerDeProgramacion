package companiaDeSeguros;

public class Poliza {
    
    private double montoAsegurado;
    private double valorCuotaMensual;
    private String fechaInicioCobertura;
    private String fechaFinCobertura;
    private Cliente cliente;

    public Poliza(double montoAsegurado, double valorCuotaMensual, String fechaInicioCobertura, String fechaFinCobertura, Cliente cliente) {
        this.montoAsegurado = montoAsegurado;
        this.valorCuotaMensual = valorCuotaMensual;
        this.fechaInicioCobertura = fechaInicioCobertura;
        this.fechaFinCobertura = fechaFinCobertura;
        this.cliente = cliente;
    }
    
    public String infoPoliza(){
        String datos = "Información de la Póliza: \n";
        datos += "Monto asegurado: " + getMontoAsegurado() + ". "
                + "Valor cuota mensual:  " + getValorCuotaMensual() + ". "
                + "Fecha inicio cobertura: " + getFechaInicioCobertura() + ". "
                + "Fecha fin cobertura: " + getFechaFinCobertura();
        
        return datos;
    }
    
    public void actualizarCuota(double unProcentaje){
        setValorCuotaMensual(getValorCuotaMensual()*unProcentaje);
    }
    
    // SETTERS AND GETTERS
    
    public double getMontoAsegurado() {
        return montoAsegurado;
    }

    public void setMontoAsegurado(double montoAsegurado) {
        this.montoAsegurado = montoAsegurado;
    }

    public double getValorCuotaMensual() {
        return valorCuotaMensual;
    }

    public void setValorCuotaMensual(double valorCuotaMensual) {
        this.valorCuotaMensual = valorCuotaMensual;
    }

    public String getFechaInicioCobertura() {
        return fechaInicioCobertura;
    }

    public void setFechaInicioCobertura(String fechaInicioCobertura) {
        this.fechaInicioCobertura = fechaInicioCobertura;
    }

    public String getFechaFinCobertura() {
        return fechaFinCobertura;
    }

    public void setFechaFinCobertura(String fechaFinCobertura) {
        this.fechaFinCobertura = fechaFinCobertura;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    
}
