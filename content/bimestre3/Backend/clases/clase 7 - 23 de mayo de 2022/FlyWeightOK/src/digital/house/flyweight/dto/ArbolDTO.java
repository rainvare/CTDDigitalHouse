package digital.house.flyweight.dto;

public class ArbolDTO {
	private int alto;
	private int ancho;
	private String color;
	private String tipoArbol;

	public ArbolDTO(int alto, int ancho, String color, String tipoArbol) {
		super();
		this.alto = alto;
		this.ancho = ancho;
		this.color = color;
		this.tipoArbol = tipoArbol;
	}

	public int getAlto() {
		return alto;
	}

	public void setAlto(int alto) {
		this.alto = alto;
	}

	public int getAncho() {
		return ancho;
	}

	public void setAncho(int ancho) {
		this.ancho = ancho;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getTipoArbol() {
		return tipoArbol;
	}

	public void setTipoArbol(String tipoArbol) {
		this.tipoArbol = tipoArbol;
	}

	@Override
	public String toString() {
		return "ArbolDTO [alto=" + alto + ", ancho=" + ancho + ", color=" + color + ", tipoArbol=" + tipoArbol + "]";
	}

}