package practicarepaso_ejercicio1;

public class Subsidio {
    
    private double montoSolicitado;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(double montoPedido, String motivo){
        this.montoSolicitado = montoPedido;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMontoSolicitado() {
        return montoSolicitado;
    }

    public void setMontoSolicitado(double montoSolicitado) {
        this.montoSolicitado = montoSolicitado;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
}