/*
1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza 
por el tamaño de sus 3 lados (double), el color de relleno (String) y el color 
de línea (String). El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)
*/
package tema3_DesarrolloDeClases;

public class Triangulo {
     /* DECLARACION DEL ESTADO(CARACTERISTICAS) OBJETO*/
    /*Anteponer a la declaración la palabra private para lograr
    encapsulamiento (ocultamiento de la información).
    Las v.i.s. privadas pueden ser accedidas sólo dentro de la clase
    que las declara*/
	private double lado1, lado2, lado3;
	
	private String colorRelleno;
	private String colorLinea;
    /*Los datos correspondientes al estado toman un valor por defecto cuando no se
    inicializan explícitamente.
    (numéricos => 0; boolean => false; char => ''; objetos => null)*/
    
    
     /* DECLARACION DE CONSTRUCTOR/ES */
    public Triangulo(){ //el PP busca el constructor que necesite
        //constructor NULO 
    }
    
	public Triangulo(double l1, double l2, double l3, String colorR, String colorL) {
		this.lado1 = l1;
		this.lado2 = l2;
		this.lado3 = l3;
		this.colorRelleno = colorR;
		this.colorLinea = colorL;
	}
    
    
    /*DECLARACION DE COMPORTAMIENTO. METODOS (CARACTERISTICAS)*/
    /*  
    Métodos: equivalente a Funciones y Procedimientos,
    public: indica que el método forma parte de la interfaz.
    TipoRetorno: tipo de dato primitivo / nombre de clase / void (no retorna dato).
    nombreMetodo: verbo seguido de palabras. Convención de nombres.
    Lista de parámetros: datos de tipos primitivos u objetos.
        TipoPrimitivo nombreParam // NombreClase nombreParam
        Separación por coma.
        Pasaje por valor únicamente.
    Declaración de variables locales. Ámbito. Tiempo de vida. (Declaración idem que en Main)
    Cuerpo. Código puede utilizar estado y modificarlo (v.i.) – devolver resultado return
    */
	public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    
    public double getLado1() {  //tambien se le puede agregar this al return
        return this.lado1;
    }
    
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    
   	public double getLado2() {
        return lado2;
    }
    
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    public double getLado3() {
        return lado3;
    }
    
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public String getColorRelleno() {
        return colorRelleno;
    }
    
    public void setColorLinea(String colorLinea) { 
    //this se agrega automaticamente para diferenciar parametro de atributo
        this.colorLinea = colorLinea;
    }
    
    public String getColorLinea() {
        return colorLinea;
    }

    public double calcularArea(){
        double s = (this.getLado1() + this.getLado2() + this.getLado3()) / 2;
        return (Math.sqrt(s*(s-this.getLado1())*(s-this.getLado2())*(s-this.getLado3())));
    }
    
    public double calcularPerimetro(){
        return(this.getLado1() + this.getLado2() + this.getLado3());
    }
    /*
    Parámetros: únicamente pasaje por valor
        a) Parámetro dato primitivo:
            Parámetro formal recibe copia del valor del parámetro actual .
            Si se modifica el parámetro formal, no altera el parámetro actual.
    
        b) Parámetro objeto:
            Parámetro formal recibe copia de la referencia del parámetro actual.
            Si se modifica el estado interno del objeto parám. formal, el cambio en el estado es
            visible en el parám. actual.
            Si se modifica la referencia del parám. formal, el parám. actual sigue referenciando al
            mismo objeto.
    */
    
}
