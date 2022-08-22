/*
4_A.Definir una clase para representar micros. Un micro conoce su patente, destino, hora 
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos 
ocupados al momento. Lea detenidamente a) y b) y luego implemente
 */
package tema3_DefiniciosDeClases;

public class Micro {
    private String patente;
    private String destino;
    private String horaSalida;
    private int dimF;
    private boolean [] vecAsiento;
    private int cantOcupados;
            

/*a) Implemente un constructor que permita iniciar el micro con una patente, un 
destino y una hora de salida (recibidas por parámetro) y sin pasajeros.*/
    public Micro(String patente, String destino, String horaSalida){
        this.iniciar(patente, destino, horaSalida);
    }
    
    private void iniciar(String patente, String destino, String horaSalida){
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        this.dimF = 20;
        this.vecAsiento = new boolean[this.dimF];
        this.cantOcupados = 0;
    }
//b) Implemente métodos para:    
    
    //i. devolver/modificar patente, destino y hora de salida
    
    public void setPatente(String patente){
        this.patente = patente;
    }
    public String getPatente(){
        return patente;
    }
    
    public void setDestino(String destino){
        this.destino = destino;
    }
    public String getDestino(){
        return destino;
    }
    
    public void setHoraSalida(String horaSalida){
        this.horaSalida = horaSalida;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    
    //ii. devolver la cantidad de asientos ocupados
    public int AsientosOcup(){
        return cantOcupados;
    }
    //iii. devolver si el micro está lleno
    public boolean EstaLLeno(){
        return (cantOcupados == dimF);
    }
    
    //iv. validar un número de asiento recibido como parámetro (es decir, 
    //devolver si está en rango o no).
    public boolean ValidarAsiento(int n){
        return ((1 <= n) && (n <= dimF));
    } 
    
    //v. devolver el estado de un nro. de asiento válido recibido como parámetro
    public boolean EstadoAsiento(int n){
       return (vecAsiento[n-1]);
       
    }
    
    //vi. ocupar un nro. de asiento válido recibido como parámetro
    public void Ocupar(int n){
        vecAsiento[n-1] = true;
        cantOcupados ++;
    }
    
    //vii. liberar un nro. de asiento válido recibido como parámetro
    public void Liberar(int n){
        vecAsiento[n-1] = false;
        cantOcupados --;
    }
    
    //viii. devolver el nro. del primer asiento libre
    public int PrimerAsientoLibre(){
        int i = 0;
        while ((i < dimF) && vecAsiento[i])
            i++;
        if (i == dimF)
            return -1;
        else
            return i+1;
    }
    
}



