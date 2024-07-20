package companiaDeSeguros;

public class Cliente {
    private String nombre;
    private String apellido;
    private int dni;
    
    private int maxRubros;
    private int maxPolizas;
    private Poliza[][] polizas;

    public Cliente(String nombre, String apellido, int dni) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.maxRubros = 10;
        this.maxPolizas = 200;
        this.polizas = new Poliza[10][200];
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

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getMaxRubros() {
        return maxRubros;
    }

    public void setMaxRubros(int maxRubros) {
        this.maxRubros = maxRubros;
    }

    public int getMaxPolizas() {
        return maxPolizas;
    }

    public void setMaxPolizas(int maxPolizas) {
        this.maxPolizas = maxPolizas;
    }

    public Poliza[][] getPolizas() {
        return polizas;
    }

    public void setPolizas(Poliza[][] polizas) {
        this.polizas = polizas;
    }
    
    
    
}
