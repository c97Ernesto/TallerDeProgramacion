package practicarepaso_ejercicio1;

public class Subsidio {
    
    private double montoSolicitado;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(double montoPedido, String motivo){
        this.setMontoSolicitado(montoPedido);
        this.setMotivo(motivo);
        this.setOtorgado(false);
    }

    public double getMontoSolicitado() {
        return montoSolicitado;
    }

    private void setMontoSolicitado(double montoSolicitado) {
        this.montoSolicitado = montoSolicitado;
    }

    public String getMotivo() {
        return motivo;
    }

    private void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    private void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
}