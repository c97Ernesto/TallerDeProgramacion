package companiaDeSeguros;

public class CompaniaDeSeguros {

    public static void main(String[] args) {
        Cliente c0 = new Cliente("Cliente1", "ApellidoCliente1", 0);
        Cliente c1 = new Cliente("Cliente1", "ApellidoCliente1", 1);
        Cliente c2 = new Cliente("Cliente1", "ApellidoCliente1", 2);
    
        Poliza p1 = new Poliza(1, 1, "Agosto 1991", "Agosto 1993", c0);
        Poliza p2 = new Poliza(2, 2, "Septiembre 1991", "Septiembre 1993", c2);
        Poliza p3 = new Poliza(3, 3, "Junio 1991", "Julio 1993", c1);
        Poliza p4 = new Poliza(4, 4, "Noviembre 1991", "Diciembre 1993", c2);
        Poliza p5 = new Poliza(1, 1, "Febrero 1991", "Julio 1993", c1);
    
        Compania compania = new Compania();
        compania.agregarPoliza(p1, 0);
        compania.agregarPoliza(p2, 1);
        compania.agregarPoliza(p3, 2);
        compania.agregarPoliza(p4, 1);
        compania.agregarPoliza(p5, 0);
        
        System.out.println(compania.infoCliente(2));
        
        compania.aumentarCuotas(7, 1);
        
        System.out.println(compania.infoCliente(2));
        
        System.out.println("Cantidadades a vencer: " + compania.cantidadAVencer("Julio 1993"));
    }
    
    
}
