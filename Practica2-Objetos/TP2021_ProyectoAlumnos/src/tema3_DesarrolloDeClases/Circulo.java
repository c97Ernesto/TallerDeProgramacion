package tema3_DesarrolloDeClases;

public class Circulo {
	
	private double radio;
	private String colorRelleno;
	private String colorLinea;
	
	public Circulo(double radio, String colorRelleno, String colorLinea) {
		this.radio = radio;
		this.colorRelleno = colorRelleno;
		this.colorLinea = colorLinea;
	}
	
	public Circulo() {
		// TODO Auto-generated constructor stub
	}

	public double getRadio() {
		return radio;
	}
	
	public void setRadio(double radio) {
		this.radio = radio;
	}
	
	public String getColorRelleno() {
		return colorRelleno;
	}
	
	public void setColorRelleno(String colorRelleno) {
		this.colorRelleno = colorRelleno;
	}
	
	public String getColorLinea() {
		return colorLinea;
	}
	
	public void setColorLinea(String colorLinea) {
		this.colorLinea = colorLinea;
	}
	
	public double calcularArea() {
		return Math.PI*(this.radio*this.radio);
	}
	
	public double calcularPerimetro() {
		return 2*Math.PI*this.radio;
	}
	
	
	
}
