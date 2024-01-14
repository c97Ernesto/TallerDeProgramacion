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
        this.dimL = 0;
        
        this.iniciarInvestigadores();
    }

    private void iniciarInvestigadores() {
        this.investigadores = new Investigador[this.getMaxInvestigadores()];
        for (int i = 0; i < this.getMaxInvestigadores(); i++) {
            this.investigadores[i] = null;
        }
    }
    
    public String getNombreProyecto() {
        return nombreProyecto;
    }

    
    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    
    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    public String getApellidoDirector() {
        return apellidoDirector;
    }

    
    public void setApellidoDirector(String apellidoDirector) {
        this.apellidoDirector = apellidoDirector;
    }

    public int getMaxInvestigadores() {
        return maxInvestigadores;
    }

    public void setMaxInvestigadores(int maxInvestigadores) {
        this.maxInvestigadores = maxInvestigadores;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarInvestigador(Investigador i) {
        this.investigadores[dimL] = i;
        this.dimL++;
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for(int investigador = 0; investigador < this.getDimL(); investigador++) {
            total += this.investigadores[investigador].dineroTotalSubsidios();
        }
        
        return total;
    }
    
    public int cantSubsidios(String nombre, String apellido) {
//        for (int i = 0; i < this.getDimL(); i++) {
//            
//            if ((investigadores[i].getApellido().equals(apellido)) && (investigadores[i].getNombre().equals(nombre))) {
//                return investigadores[i].cantSubsidios();
//            }       
//        }
//        return -1;
        
        int indice = 0;
        while ((indice < this.getDimL()) && !(investigadores[indice].getApellido().equals(apellido)) && (investigadores[indice].getNombre().equals(nombre))) {
            indice++;
        }
        
        if ((investigadores[indice].getApellido().equals(apellido)) && (investigadores[indice].getNombre().equals(nombre))) {
            return this.investigadores[indice].cantSubsidios();
        } else {
            return -1;
        }
        
    }
    
    public void otorgarTodos(String nombre, String apellido) {
        for (int i = 0; i < this.getDimL(); i++) {
            if ((investigadores[i].getApellido().equals(apellido)) && (investigadores[i].getNombre().equals(nombre))) {
                this.investigadores[i].otorgarSubsidiosPendientes();
            }       
        }
    }
    
    @Override
    public String toString() {
        String investigadoresStr = "";
        for (int i = 0; i < this.getDimL(); i++) {
            investigadoresStr += "\n" + investigadores[i].toString();
        }
        return "Proyecto: "
                + "Nombre de proyecto: " + this.getNombreProyecto()
                + ". Codigo proyecto: " + this.getCodigo()
                + ". Nombre director: " + this.getNombreDirector()
                + ". Apellido director: " + this.getApellidoDirector()
                + ". Dinero otorgado: " + this.dineroTotalOtorgado()
                + investigadoresStr;
    }


    
}
