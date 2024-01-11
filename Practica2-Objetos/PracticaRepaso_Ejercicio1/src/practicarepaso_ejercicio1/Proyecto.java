package practicarepaso_ejercicio1;

public class Proyecto {
    
    private String nombreProyecto;
    private int codigo;
    
    private String nombreDirector;
    private String apellidoDirector;
    
    private Investigador [] investigadores;
    private int maxInvestigadores;
    private int dimL;
    
    public Proyecto(String nombreProyecto, int codigoProyecto){
        this.nombreProyecto = nombreProyecto;
        this.codigo = codigoProyecto;
        this.maxInvestigadores = 50;
        
        this.iniciarInvestigadores();
    }

    private void iniciarInvestigadores() {
        for (int i = 0; i < this.getMaxInvestigadores(); i++) {
            this.investigadores[i] = null;
        }
    }

    /**
     * @return the nombreProyecto
     */
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    /**
     * @param nombreProyecto the nombreProyecto to set
     */
    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nombreDirector
     */
    public String getNombreDirector() {
        return nombreDirector;
    }

    /**
     * @param nombreDirector the nombreDirector to set
     */
    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    /**
     * @return the apellidoDirector
     */
    public String getApellidoDirector() {
        return apellidoDirector;
    }

    /**
     * @param apellidoDirector the apellidoDirector to set
     */
    public void setApellidoDirector(String apellidoDirector) {
        this.apellidoDirector = apellidoDirector;
    }

    /**
     * @return the maxInvestigadores
     */
    public int getMaxInvestigadores() {
        return maxInvestigadores;
    }

    /**
     * @param maxInvestigadores the maxInvestigadores to set
     */
    public void setMaxInvestigadores(int maxInvestigadores) {
        this.maxInvestigadores = maxInvestigadores;
    }

    /**
     * @return the dimL
     */
    public int getDimL() {
        return dimL;
    }

    /**
     * @param dimL the dimL to set
     */
    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
}
