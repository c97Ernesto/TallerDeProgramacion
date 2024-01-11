/*
 5_A.Definir una clase para representar flotas de micros. Una flota se 
caracteriza por conocer a los micros que la componen (a lo sumo 15). Defina 
un constructor para crear una flota vacía (sin micros).
 */
package tema4_ObjetosAPartirDeConstructores;

import tema4_ObjetosAPartirDeConstructores.Micro;

public class Flota {
    private int maxMicros;
    private int dimL;
    private Micro [] flota;
    
    /*
    public Flota() {
        this.maxMicros = 15;
        this.dimL = 0;
        this.flota = new Micro[maxMicros];
        this.iniciarFlota();
    }

    public void iniciarFlota() {
        for (int i = 0; i < this.getMaxMicros; i++) {
            this.flota[i] = null;
        }
    }
    */
    public Flota(){
        this.iniciar();
    }
    private void iniciar(){
        this.maxMicros = 15;
        this.dimL = 0;
        this.flota = new Micro[this.maxMicros];
        
        for (int i = 0; i < maxMicros; i++)
            flota[i] = null;
    }
            
//Implemente métodos para:
    //i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
    public boolean flotaCompleta(){
        return (this.dimL == this.maxMicros);
    }
    
    //ii. agregar a la flota un micro recibido como parámetro.
    public void agregarMicro(Micro micro) {
        if (!this.flotaCompleta()) {
            this.flota[this.dimL] = micro;
            this.dimL++;
            System.out.println("Micro agregado correctamente");
        } else {
            System.out.println("No hay lugar para agregar el Micro");
        }
    }

    //iii. eliminar de la flota el micro con patente igual a una recibida como 
    //parámetro, y retornar si la operación fue exitosa.
    public boolean eliminarMicro(String patente) {
        Micro micro = this.buscarMicroPorPatente(patente);

        if (micro != null) {
            int i = 0;
            while (!flota[i].getPatente().equals(patente)) {
                i++;
            }

            for (int j = i + 1; j < this.maxMicros; j++) {
                flota[j - 1] = flota[j];
            }
            this.dimL--;
            return true;
        } else {
            return false;
        }
    }

    
    //iv. buscar en la flota un micro con patente igual a una recibida como 
    //parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
    
    public Micro buscarMicroPorPatente(String patente) {
        for (int i = 0; i < this.dimL; i++) {
            if (flota[i].getPatente().equals(patente)) {
                return flota[i];
            }
        }
        return null;
    }
    /*
    public Micro buscarMicroPatente(String patente){
        int i = 0;
        while ((i < maxMicros) && (! flota[i].getPatente().equals(patente)))
            i++;
        if (i < maxMicros) 
            return flota[i];
        else
            return null;
    } 
    */
    
    //v. buscar en la flota un micro con destino igual a uno recibido como 
    //parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro buscarMicroPorDestino(String destino) {
        for (int i = 0; i < this.dimL; i++) {
            if (flota[i].getDestino().equals(destino)) {
                return flota[i];
            }
        }
        return null;
    }
    /*
    public Micro buscarMicroDestino(String destino){
        int i = 0;
        while ((i < maxMicros) && (flota[i].getDestino().equals(destino)))
            i++;
        if (i < maxMicros)
            return flota[i];
        else
            return null;
    }
    
    */
    
}
