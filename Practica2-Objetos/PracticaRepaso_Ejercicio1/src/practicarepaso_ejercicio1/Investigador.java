package practicarepaso_ejercicio1;

public class Investigador {
    
    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    
    private Subsidio [] subsidios;
    private int maxSubsidios;
    
    public Investigador(String nombre, String apellido, int categoria, String especialidad){
        this.nombre = nombre;
        this.apellido = apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        
        this.maxSubsidios = 5;
        this.iniciarSubsidios();
    }

    private void iniciarSubsidios() {
        for (int i=0; i < 5; i++) {
            subsidios[i] = null;
        }
    }
    
    
}
