
package fabricaAutomotriz;

public class Empleado {

    private String nombre;
    private String apellido;
    private int antiguedad;

    public Empleado(String nombre, String apellido, int antiguedad ) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.antiguedad = antiguedad;
    }

    public Empleado() {
      
    }
    
    @Override
    public String toString(){
        String datos = ("Nombre: " + getNombre() +" | Apellido: "+ getApellido());
        return datos;
    }
    
    // GETTERS AND SETTERS
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
    public int getAntiguedad() {
        return antiguedad;
    }
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }   
}