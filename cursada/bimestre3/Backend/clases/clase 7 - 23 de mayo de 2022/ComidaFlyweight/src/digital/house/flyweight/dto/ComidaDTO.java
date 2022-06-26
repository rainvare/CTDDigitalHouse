package digital.house.flyweight.dto;

public class ComidaDTO {

	private String tipoComida;
	private int precio;
	private boolean tieneLechuga;

	public ComidaDTO(String tipoComida) {
		super();
		this.tipoComida = tipoComida;
	}

	public ComidaDTO() {
		super();
	}

	public String getTipoComida() {
		return tipoComida;
	}

	public void setTipoComida(String tipoComida) {
		this.tipoComida = tipoComida;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public boolean isTieneLechuga() {
		return tieneLechuga;
	}

	public void setTieneLechuga(boolean tieneLechuga) {
		this.tieneLechuga = tieneLechuga;
	}

	public void descripcionDeLaComida() {
		System.out.println("Es un/una " + getTipoComida() + " que sale: " + getPrecio());
	}

	@Override
	public String toString() {
		return "ComidaDTO [tipoComida=" + tipoComida + ", precio=" + precio + ", tieneLechuga=" + tieneLechuga + "]";
	}
}
