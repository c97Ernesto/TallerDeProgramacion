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
    
}