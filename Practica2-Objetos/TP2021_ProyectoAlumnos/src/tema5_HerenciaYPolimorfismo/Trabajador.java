package tema5_HerenciaYPolimorfismo;

public class Trabajador extends Persona{
    private String laburo;
    
    public Trabajador (String nombre, int dni, int edad, String laburo){
        super(nombre, dni, edad);
        this.laburo = laburo;
    }
    
    public String getLaburo(){
        return laburo;
    }
    public void serLaburo(String laburo){
        this.laburo = laburo;
    }
    
    public String toString(){
        return super.toString() + "Laburo :"+ getLaburo();
    }
}
