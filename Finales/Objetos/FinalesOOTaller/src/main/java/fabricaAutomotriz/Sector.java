package fabricaAutomotriz;

public class Sector {
    
    private String nombre;
    
    private Empleado jefe;
    
    private int maxEmpleados;
    private int dimLEmpleados;
    private Empleado[] empleados;
    
    private int maxProductos;
    private int dimLProductos;
    private Producto[] productos;

    public Sector(String nombre, int maxProductos) {
        this.nombre = nombre;
        
        this.maxEmpleados = 50;
        this.dimLEmpleados = 0;
        this.empleados = new Empleado[maxEmpleados];
        
        this.maxProductos = maxProductos;
        this.dimLProductos = 0;
        this.productos = new Producto[maxProductos];
    }
    
    
    public void agregarEmpleado(Empleado unEmpleado, boolean esJefe){
        if (esJefe){
            this.setJefe(unEmpleado);
        }
        else {
            if (this.getDimLEmpleados() < this.getMaxEmpleados()){
                this.getEmpleados()[this.getDimLEmpleados()] = unEmpleado;
                this.setDimLEmpleados(this.getDimLEmpleados() + 1);    
            }        
        }
    }
    
    public void agregarProducto(Producto unProducto){
        if (getDimLProductos() < getMaxProductos()){
            getProductos()[getDimLProductos()] = unProducto;
            setDimLProductos(getDimLProductos() + 1);
        }
    }

    public double costoTotal(int unaEtapa){
        
        double costoTotal = 0;
        
        for(int i = 0; i < getDimLProductos(); i++){    
            if (getProductos()[i].getEtapa() == unaEtapa){
                costoTotal+= getProductos()[i].getCosto();
            }
        }
        
        return costoTotal;
    }
    
    public void cambiarEtapa(int unCodProducto, double unCosto){
        int posicion = 0;
        while (posicion < getDimLProductos() && (getProductos()[posicion].getCodigo() != unCodProducto)){
            posicion++;
        }
        if (getProductos()[posicion].getCodigo() == unCodProducto){
            getProductos()[posicion].actualizarProducto(unCosto);
        }
        else {
            System.out.println("No hay producto con el código ingresado.");
        }
    }
    
    @Override
    public String toString (){
        String datos = "Nombre del Sector: " + getNombre() + " \n";
        datos+= "Datos del Jefe: " + getJefe().toString()+ " \n";
        datos+= "Costo total de productos finalizados: " + costoTotalProductosFinalizados()+ " \n";
        
        datos+= "Empleados con antiguedad mayor a 10 años:  \n";
        for(int posEmpleado = 0; posEmpleado < getDimLEmpleados(); posEmpleado++){
            if (getEmpleados()[posEmpleado].getAntiguedad() > 10){
                datos+= getEmpleados()[posEmpleado].toString() + " \n";
            }
        }
        return datos;
    }
    
    private double costoTotalProductosFinalizados() {
        int costoTotalProductosFinalizados = 0;
        for (int i = 0; i < getDimLProductos(); i++){
            if (getProductos()[i].estadoFinalizado()){
                costoTotalProductosFinalizados+= getProductos()[i].getCosto();
            }
        }
        return costoTotalProductosFinalizados;
    }
    
    // GETTERS AND SETTERS
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Empleado getJefe() {
        return jefe;
    }
    public void setJefe(Empleado jefe) {
        this.jefe = jefe;
    }
    public int getMaxEmpleados() {
        return maxEmpleados;
    }
    public void setMaxEmpleados(int maxEmpleados) {
        this.maxEmpleados = maxEmpleados;
    }
    public int getDimLEmpleados() {
        return dimLEmpleados;
    }
    public void setDimLEmpleados(int dimLEmpleados) {
        this.dimLEmpleados = dimLEmpleados;
    }
    public Empleado[] getEmpleados() {
        return empleados;
    }
    public void setEmpleados(Empleado[] empleados) {
        this.empleados = empleados;
    }
    public int getMaxProductos() {
        return maxProductos;
    }
    public void setMaxProductos(int maxProductos) {
        this.maxProductos = maxProductos;
    }
    public int getDimLProductos() {
        return dimLProductos;
    }
    public void setDimLProductos(int dimLProductos) {
        this.dimLProductos = dimLProductos;
    }
    public Producto[] getProductos() {
        return productos;
    }
    public void setProductos(Producto[] productos) {
        this.productos = productos;
    }
}
