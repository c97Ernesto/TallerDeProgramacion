package tema5_HerenciaYPolimorfismo;

public class Persona {
    private String nombre;
    private int dni;
    private int edad;
    
    public Persona (String nombre, int dni, int edad){
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
    }
    
    public String getNombre(){
        return nombre;
    }
    public void getNombre (String nombre){
        this.nombre = nombre;
    }
    
    public int getDni(){
        return dni;
    }
    public void setDni(int dni){
        this.dni = dni;
    }
    
    public int getEdad() {
        return edad;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString (){
        String aux = "Nombre: " + getNombre() + ". Dni: " + getDni() + ". Edad: " + getEdad() + ". ";
        return aux;
    }
    
}
