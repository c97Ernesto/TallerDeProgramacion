package tema5_HerenciaYPolimorfismo;

public class Entrenador extends Empleado {
    private int campGanados;
    
    public Entrenador(String nombre, double sueldoBasico, int campGanados){
        super(nombre, sueldoBasico);
        this.campGanados = campGanados;
    }
    
    public int getCampGanados (){
        return campGanados;
    }
    public void setCampGanados (int campGanados){
        this.campGanados = campGanados;
    }
    
    public double calcularSueldoACobrar (){
        if (campGanados < 11)
            if (campGanados < 5)
                if (campGanados < 1)
                    return getSueldoBasico();
                else
                    return getSueldoBasico() + 5000;
            else 
                return getSueldoBasico() + 30000;
        else
            return getSueldoBasico() + 50000;
    }
}
           
