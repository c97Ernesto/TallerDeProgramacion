package ejerciciofinal;

public abstract class Subsidio {
    
    private String nombreInvestigador;
    private String nombrePlanTrabajo;
    private String fechaSolicitud;
    
    
    public Subsidio(String nombreInvestigador, String nombrePlanTrabajo, String fechaSolicitud){
        this.nombreInvestigador = nombreInvestigador;
        this.nombrePlanTrabajo = nombrePlanTrabajo;
        this.fechaSolicitud = fechaSolicitud;
    }

    public String getNombreInvestigador() {
        return nombreInvestigador;
    }

    public void setNombreInvestigador(String nombreInvestigador) {
        this.nombreInvestigador = nombreInvestigador;
    }

    public String getNombrePlanTrabajo() {
        return nombrePlanTrabajo;
    }

    public void setNombrePlanTrabajo(String nombrePlanTrabajo) {
        this.nombrePlanTrabajo = nombrePlanTrabajo;
    }

    public String getFechaSolicitud() {
        return fechaSolicitud;
    }

    public void setFechaSolicitud(String fechaSolicitud) {
        this.fechaSolicitud = fechaSolicitud;
    }
    
    public abstract double montoTotalSubsidio();
    
    public abstract String representacionSubsidio();
    
}
