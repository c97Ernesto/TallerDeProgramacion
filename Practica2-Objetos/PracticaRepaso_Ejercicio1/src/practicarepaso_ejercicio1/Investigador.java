package practicarepaso_ejercicio1;

public class Investigador {
    
    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    
    private Subsidio [] subsidios;
    private int maxSubsidios;
    private int dimL;
    
    public Investigador(String nombre, String apellido, int categoria, String especialidad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        
        this.maxSubsidios = 5;
        this.dimL = 0;
        this.iniciarSubsidios();
    }

    private void iniciarSubsidios() {
        this.subsidios = new Subsidio[maxSubsidios];
        for (int i=0; i < 5; i++) {
            subsidios[i] = null;
        }
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getMaxSubsidios() {
        return maxSubsidios;
    }

    public void setMaxSubsidios(int maxSubsidios) {
        this.maxSubsidios = maxSubsidios;
    }

    public int getDimL() {
        return this.dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }    
    
    public void agregarSubsidio(Subsidio s) {
        this.subsidios[dimL] = s;
        this.dimL++;
        // this.setDimL(++dimL)
    }
    
    public double dineroTotalSubsidios(){
        double total = 0;
        for (int subsidio = 0; subsidio < dimL; subsidio++) {
            if (this.subsidios[subsidio].isOtorgado()){
                total += this.subsidios[subsidio].getMontoSolicitado();
            }
        }
        return total;
    }
    
    public int cantSubsidios() {
        return this.getDimL();
    }
    
    public void otorgarSubsidiosPendientes(){
        for (int i = 0; i < this.getDimL(); i++) {
            if (!this.subsidios[i].isOtorgado())
                this.subsidios[i].setOtorgado(true);
        }
    }
    
    
    
    @Override
    public String toString() {
        return "Nombre y Apellido investigador: "+ this.getNombre() + " " +this.getApellido() +
                ". Categoría: " + this.getCategoria() +
                ". Dinero de subsidios otorgados: " + this.dineroTotalSubsidios();
                
    }
    
}
