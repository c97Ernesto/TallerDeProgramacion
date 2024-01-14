public class ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        
        EventoOcasional evO = new EventoOcasional("Banda1", 3, "show de TV", "Pedro", "8-8");
        evO.agregarTema("Nombre del tema1");
        evO.agregarTema("Nombre del tema2");
        evO.agregarTema("Nombre del tema3");
        
        System.out.println("El costo del evento es: " + evO.calcularCosto());
        System.out.println(evO.actuar());
        
        
        Gira gira = new Gira("Banda de Gira", 4, "Milanesa", 2);
        Fecha f1 = new Fecha("El Oro", "mañana");
        Fecha f2 = new Fecha("La Plata", "pasado mañana");
        gira.agregarFecha(f1);
        gira.agregarFecha(f2);
        gira.agregarTema("Tema de Gira1");
        gira.agregarTema("Tema de Gira2");
        gira.agregarTema("Tema de Gira3");
        
        System.out.println("El costo de la gira es: " + gira.calcularCosto());
        System.out.println(gira.actuar());
    }
    
}
