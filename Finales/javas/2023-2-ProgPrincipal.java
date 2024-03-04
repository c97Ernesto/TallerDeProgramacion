package ejerciciofinal;

public class ProgPrincipal {


    public static void main(String[] args) {
        
        SubsidioDeEstadia subEstadia = new SubsidioDeEstadia("Juan", "Carlos", "1/1/1", "Barilo", 2, 2, 2);
        
        Bien b1 = new Bien("Bien 1", 1, 1);
        Bien b2 = new Bien("Bien 2", 2, 2);
        Bien b3 = new Bien("Bien 3", 3, 3);
        
        SubsidioDeBien subBien = new SubsidioDeBien("Carlo", "Magno", "1/1/1", 3);
        subBien.agregarBien(b1);
        subBien.agregarBien(b2);
        subBien.agregarBien(b3);
        
        System.out.println(subEstadia.representacionSubsidio());
        System.err.println("");
        System.err.println("");
        System.out.println(subBien.representacionSubsidio());
        
        
        
    }
    
}
