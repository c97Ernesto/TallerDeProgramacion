
public class Gira extends Recital{
    
    private String nombreGira;
    private Fecha [] fechas;
    private int maxFechas;
    private int dimLFechas;
    private int fechaActual;
    
    public Gira(String nombreBanda, int cantTemas, String nombreGira, int cantFechas){
        super(nombreBanda, cantTemas);
        this.setNombreGira(nombreGira);
        this.setMaxFechas(cantFechas);
        this.setDimLFechas(0);
        this.setFechaActual(0);
        this.iniciarFechas(this.getMaxFechas());
        
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getMaxFechas() {
        return maxFechas;
    }

    public void setMaxFechas(int maxFechas) {
        this.maxFechas = maxFechas;
    }
    
    public int getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(int fechaActual) {
        this.fechaActual = fechaActual;
    }

    private void iniciarFechas(int maxFechas) {
        this.fechas = new Fecha[maxFechas];
        for (int i = 0; i < maxFechas; i++) {
            this.fechas[i] = null;
        }
    }
    
    public int getDimLFechas() {
        return dimLFechas;
    }

    public void setDimLFechas(int dimLFechas) {
        this.dimLFechas = dimLFechas;
    }
    
    public void agregarFecha(Fecha fecha) {
        if (this.getDimLFechas() < this.getMaxFechas() ) {
            this.fechas[this.getDimLFechas()] = fecha;
            this.setDimLFechas(this.getDimLFechas() + 1);
        } else {
            System.out.println("No se pueden agregar más fechas.");
        }
        
    }
    
    @Override
    public String actuar() {
        if (this.getDimLFechas() == 0) {
            return "No hay fechas.";
        } else {
            if (this.getFechaActual() >= this.getDimLFechas()) {
                return "No hay más fechas en la gira.";
            } else {
                String ciudadActual = this.fechas[this.getFechaActual()].getCiudad();
                String actuacion = super.actuar();
                this.setFechaActual(this.getFechaActual() + 1);
                return "Buenas noches " + ciudadActual + ". " + actuacion;
            }
        }
    }

    @Override
    public double calcularCosto() {
        return this.getDimLFechas()*30000;
    }

    

    

}
