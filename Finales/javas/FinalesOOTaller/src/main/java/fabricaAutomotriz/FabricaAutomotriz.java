
package fabricaAutomotriz;
public class FabricaAutomotriz {
 
    public static void main(String[] args) {
        
        Sector sector = new Sector("Sector 1", 5);
        
        Empleado jefe = new Empleado("Jefe", "ApellidoDelJefe", 20);
        sector.agregarEmpleado(jefe, true);
        
        Empleado e1 = new Empleado("Empleado1", "ApellidoDelEmpleado1", 1);
        sector.agregarEmpleado(e1, false);
        
        Empleado e2 = new Empleado("Empleado2", "ApellidoDelEmpleado2", 2);
        sector.agregarEmpleado(e2, false);
        
        Empleado e3 = new Empleado("Empleado3", "ApellidoDelEmpleado3", 13);
        sector.agregarEmpleado(e3, false);
        
        Producto p1 = new Producto(1);
        Producto p2 = new Producto(2);
        Producto p3 = new Producto(3);
        Producto p4 = new Producto(4);
        Producto p5 = new Producto(5);
        
        sector.agregarProducto(p1);
        sector.agregarProducto(p2);
        sector.agregarProducto(p3);
        sector.agregarProducto(p4);
        sector.agregarProducto(p5);
        
        sector.cambiarEtapa(4, 4);
        sector.cambiarEtapa(4, 4);
        sector.cambiarEtapa(4, 4);
        sector.cambiarEtapa(4,4);
        sector.cambiarEtapa(2, 2);
        sector.cambiarEtapa(2, 2);
        sector.cambiarEtapa(2, 2);
        sector.cambiarEtapa(2,2);
        
        for (int i = 0; i < sector.getDimLEmpleados(); i++) {
            System.out.println("Empleado número "+ i + ": "+ sector.getEmpleados()[i].getNombre());
        }
        
        System.out.println(sector.toString());
    }
}
