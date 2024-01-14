public class EventoOcasional extends Recital {
    
    private String motivo; //(a beneficio, show de TV o show privado)
    private String nombreContratante;
    private String diaEvento;
    
    public EventoOcasional(String nombreBanda, int cantTemas, String motivo, String nombrePersona, String diaEvento){
        super(nombreBanda, cantTemas);
        this.setMotivo(motivo);
        this.setNombreContratante(nombrePersona);
        this.setDiaEvento(diaEvento);
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public String getDiaEvento() {
        return diaEvento;
    }

    public void setDiaEvento(String diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    @Override
    public String actuar(){
        String aux = "";
        switch (this.getMotivo()) {
            case "beneficiencia" -> aux += "Recuerden colaborar con "+ this.getNombreContratante() +". ";
            case "show de TV" -> aux += "Saludos amigos televidentes. ";
            case "show privado" -> aux += "Un feliz cumpleaños para " + this.getNombreContratante()+". ";
            default -> {
                System.out.println("No corresponde motivo -> actuar()");
            }
        }
        
        return aux += super.actuar();
    }
    
    @Override
    public double calcularCosto() {
        
        double costo = 0;
        switch (this.getMotivo()) {
            case "beneficiencia" ->  costo = 0;
            case "show de TV" -> costo = 50000;    
            case "show privado" -> costo = 150000;
            default -> {
                System.out.println("No corresponde motivo -> calcularCosto()");
            }
        }
        return costo;

    }
    
}
