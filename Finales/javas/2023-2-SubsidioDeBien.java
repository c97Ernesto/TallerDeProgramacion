public class ejerciciofinal {

public class SubsidioDeBien extends Subsidio{
    private Bien [] bienes;
    private int dimLogica;
    private int maxBienes;
    
    
    public SubsidioDeBien(String nombreInvestigador, String nombrePlanTrabajo, String fechaSolicitud, 
            int totalBienes) {
        super(nombreInvestigador, nombrePlanTrabajo, fechaSolicitud);
    
        this.dimLogica = 0;
        this.maxBienes = totalBienes;
        this.bienes = new Bien [maxBienes];
    }
    
    
    public void agregarBien(Bien bien){
        this.bienes[this.getDimLogica()] = bien;
        this.setDimLogica(this.getDimLogica() + 1);
    }
    
    public int getDimLogica() {
        return dimLogica;
    }
    
    public void setDimLogica(int dimLogica) {
        this.dimLogica = dimLogica;
    }
    
    public int getMaxBienes() {
        return maxBienes;
    }
    
    public void setMaxBienes(int maxBienes) {
        this.maxBienes = maxBienes;
    }

    @Override
    public double montoTotalSubsidio() {
        
        double total = 0;
        for (int i = 0; i < this.getDimLogica(); i++){
            total += this.bienes[i].costoFinal();
        }
        
        return total;
    }

    @Override
    public String representacionSubsidio() {
        String representacion = "NOMBRE DEL INVESTIGADOR: " + super.getNombreInvestigador() + " \n" +
                "PLAN DE TRABAJO: " + super.getNombrePlanTrabajo() + " \n" +
                "FECHA DE SOLICITUD: " + super.getFechaSolicitud() + " \n";
        
        for (int i = 0; i < this.getDimLogica(); i++) {
            representacion+= this.bienes[i].representacionBien();
        }
        
        representacion += "MONTO TOTAL SUBSIDIO: " + this.montoTotalSubsidio() + " \n";
        
        return representacion;
        
    }
    
    
    
    
}
