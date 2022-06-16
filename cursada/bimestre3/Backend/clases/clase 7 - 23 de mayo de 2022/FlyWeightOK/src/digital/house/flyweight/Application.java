package digital.house.flyweight;

import digital.house.flyweight.dto.BoqueDTO;

public class Application {

	static int CANVAS_SIZE = 500;

	public static void main(String[] args) {
		final BoqueDTO forest = new BoqueDTO();

		for (int i = 0; i < 1000000; i++) {
			forest.plantarArbol("ORNAMENTALES", 200, 400, "verde");
			forest.plantarArbol("FRUTALES", 500, 300, "rojo");
			forest.plantarArbol("FRUTALES", 100, 200, "celestes");
		}

		Runtime runtime = Runtime.getRuntime();
		System.out.println("Memoria usada: " + (runtime.totalMemory() - runtime.freeMemory()) / (1024 * 1024));

	}

}
