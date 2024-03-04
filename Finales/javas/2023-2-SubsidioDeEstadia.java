package ejerciciofinal;

public class SubsidioDeEstadia extends Subsidio{

    private String lugarDestino;
    private double costoPasajes;
    private int cantDiasEstadia;
    private double costoHotelDia;

    public SubsidioDeEstadia(String nombreInvestigador, String nombrePlanTrabajo, String fechaSolicitud, 
            String lugarDestino, double costoPasaje, int cantDiasEstadia, double costoHotelDia) {
        super(nombreInvestigador, nombrePlanTrabajo, fechaSolicitud);
        this.lugarDestino = lugarDestino;
        this.costoPasajes = costoHotelDia;
        this.cantDiasEstadia = cantDiasEstadia;
        this.costoHotelDia = costoHotelDia;
    }

    public String getLugarDestino() {
        return lugarDestino;
    }

    public void setLugarDestino(String lugarDestino) {
        this.lugarDestino = lugarDestino;
    }

    public double getCostoPasajes() {
        return costoPasajes;
    }

    public void setCostoPasajes(double costoPasajes) {
        this.costoPasajes = costoPasajes;
    }

    public int getCantDiasEstadia() {
        return cantDiasEstadia;
    }

    public void setCantDiasEstadia(int cantDiasEstadia) {
        this.cantDiasEstadia = cantDiasEstadia;
    }

    public double getCostoHotelDia() {
        return costoHotelDia;
    }

    public void setCostoHotelDia(double costoHotelDia) {
        this.costoHotelDia = costoHotelDia;
    }
    
    @Override
    public double montoTotalSubsidio() {
        return this.getCostoPasajes() + this.getCantDiasEstadia() * this.getCostoHotelDia();
    }

    @Override
    public String representacionSubsidio() {
        String representacion = "NOMBRE DEL INVESTIGADOR: " + super.getNombreInvestigador() + " \n" +
                "PLAN DE TRABAJO: " + super.getNombrePlanTrabajo() + " \n" +
                "FECHA DE SOLICITUD: " + super.getFechaSolicitud() + " \n" +
                "LUGAR DE DESTINO: " + this.getLugarDestino() + " \n" +
                "COSTO PASAJES: " + this.getCostoPasajes() + " \n" +
                "CANTIDAD DE DÍAS: " + this.getCantDiasEstadia() + " \n" +
                "COSTO DE HOTEL POR DÍA: " + this.getCostoHotelDia() + " \n";
                
        return representacion;
    } 
}
