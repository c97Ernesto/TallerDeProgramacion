package companiaDeSeguros;

public class Compania {
    
    private Poliza[][] polizas;
    private final int maxRubros;
    private final int maxPolizas;

    public Compania() {
        this.maxRubros = 3;
        this.maxPolizas = 4;
        this.polizas = new Poliza[this.maxRubros][this.maxPolizas];
    }
    
    public void agregarPoliza(Poliza unaPoliza, int unRubro) {
        int posPoliza = 0;
        while (posPoliza < getMaxPolizas() && getPolizas()[unRubro][posPoliza] != null) {
            posPoliza++;
        }
        if (posPoliza < getMaxPolizas()) {
            getPolizas()[unRubro][posPoliza] = unaPoliza;
        }
    }
    
    public String infoCliente(int unDni){
        String infoCliente = "Información de las Pólizas del Cliente con Dni: " + unDni + " \n";
        
        for (int i = 0; i < getMaxRubros(); i++){
            for (int j = 0; j < getMaxPolizas(); j++){
                if (getPolizas()[i][j] != null){
                    if (getPolizas()[i][j].getCliente().getDni() == unDni){
                        infoCliente+= getPolizas()[i][j].infoPoliza() + "\n";
                    }                    
                }
            }
        }
        return infoCliente;   
    }
    
    public void aumentarCuotas(double unPorcentaje, int unRubro){
        int i = 0;
        while (i < getMaxPolizas() && (getPolizas()[unRubro][i] != null)){
            Poliza p = getPolizas()[unRubro][i];
            p.actualizarCuota(unPorcentaje);
            i++;
        }
    }
    
    public int cantidadAVencer(String fecha){
        
        int total = 0;
        int posRubro = 0;
        while (posRubro < getMaxRubros()){
            int posPoliza = 0;
            while (posPoliza < getMaxPolizas() && getPolizas()[posRubro][posPoliza] != null){
                if (fecha.equals(getPolizas()[posRubro][posPoliza].getFechaFinCobertura()))
                    total+= 1;
                posPoliza++;
            }
            posRubro++;
        }
        return total;
    }

    private int getMaxRubros() {
        return this.maxRubros;
    }

    private int getMaxPolizas() {
        return this.maxPolizas;
    }

    private Poliza[][] getPolizas() {
        return this.polizas;
    }
    
       
        
}
