package digital.house.flyweight.dto;

public class Computer {
	private int ram;
	private int disco;
	private static int contador;

	public Computer(int ram, int disco) {
		super();
		this.ram = ram;
		this.disco = disco;
		contador++;
		System.out.println("contador: " + contador);
	}

	public int getRam() {
		return ram;
	}

	public void setRam(int ram) {
		this.ram = ram;
	}

	public int getDisco() {
		return disco;
	}

	public void setDisco(int disco) {
		this.disco = disco;
	}

	@Override
	public String toString() {
		return "Computer [ram=" + ram + ", disco=" + disco + "]";
	}
	
	

}
