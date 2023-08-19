package tema2_InstanciacionDeObjetos;


public class Persona {
    private String nombre;
    private int dni;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        this.nombre = unNombre;
        this.dni = unDNI;
        this.edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {
        return this.dni;
    }

    public int getEdad() {
        return this.edad;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setDNI(int unDNI) {
        this.dni = unDNI;
    }

    public void setEdad(int unaEdad) {
        this.edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        this.nombre = unNombre;
    }
    
    @Override
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre 
                + ", mi DNI es " + dni 
                + " y tengo " + edad 
                + " años.";
        return aux;
    }
    
    
    
    
}
