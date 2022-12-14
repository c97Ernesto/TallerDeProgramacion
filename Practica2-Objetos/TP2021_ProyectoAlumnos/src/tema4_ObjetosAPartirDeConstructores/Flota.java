/*
 5_A.Definir una clase para representar flotas de micros. Una flota se 
caracteriza por conocer a los micros que la componen (a lo sumo 15). Defina 
un constructor para crear una flota vacía (sin micros).
 */
package tema4_ObjetosAPartirDeConstructores;

import tema4_ObjetosAPartirDeConstructores.Micro;

public class Flota {
    private int dimF;
    private int dimL;
    private Micro [] vecMicro;
/*  public Flota(){
        this.dimF = 15;
        this.vecMicro = new Micro[this.dimF];
        
        for (int i = 0; i < dimF; i++)
            vecMicro[i] = null;
*/
    public Flota(){
        this.iniciar();
    }
    private void iniciar(){
        this.dimF = 15;
        this.dimL = 0;
        this.vecMicro = new Micro[this.dimF];
        
        for (int i = 0; i < dimF; i++)
            vecMicro[i] = null;
    }
            
//Implemente métodos para:
    //i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
    public boolean flotaCompleta(){
        return (dimL == dimF);
    }
    
    //ii. agregar a la flota un micro recibido como parámetro.
    public boolean agregarMicro (Micro m){
        if (dimL < dimF){
            vecMicro[dimL] = m;
            dimL++;
            return true;
        }
        else
            return false;
    }
    
    //iii. eliminar de la flota el micro con patente igual a una recibida como 
    //parámetro, y retornar si la operación fue exitosa.
    public boolean eliminarMicro (String patente){
        int i = 0;
        while ((! vecMicro[i].getPatente().equals(patente)) && (i < dimL))
            i++;
        
        if (i < dimL){
            for (int j = i; j < dimL ; j++)
                vecMicro[j] = vecMicro[j+1];
            dimL --;
            return true;
        }
        else
            return false;
    }   
    
    //iv. buscar en la flota un micro con patente igual a una recibida como 
    //parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro buscarMicroPatente(String patente){
        int i = 0;
        while ((i < dimF) && (! vecMicro[i].getPatente().equals(patente)))
            i++;
        if (i < dimF) 
            return vecMicro[i];
        else
            return null;
    }    
    //v. buscar en la flota un micro con destino igual a uno recibido como 
    //parámetro y retornarlo (en caso de no existir dicho micro, retornar null).
    public Micro buscarMicroDestino(String destino){
        int i = 0;
        while ((i < dimF) && (vecMicro[i].getDestino().equals(destino)))
            i++;
        if (i < dimF)
            return vecMicro[i];
        else
            return null;
    }
    
    
    
}
