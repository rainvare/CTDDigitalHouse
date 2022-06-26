package digital.house.flyweight.factory;

import java.util.HashMap;
import java.util.Map;

import digital.house.flyweight.dto.Computer;

public class ComputerFactory {

	private static Map<String, Computer> macLigeros = new HashMap<>();

	public Computer getComputer(int ram, int disco) {

		String clave ="key:"+ ram + ":" + disco;

		System.out.println(clave);

		if (!macLigeros.containsKey(clave)) {

			macLigeros.put(clave, new Computer(ram, disco));
			System.out.println("PC creada");
			return macLigeros.get(clave);

		}
		System.out.println("PC obtenida");

		return macLigeros.get(clave);
	}
}
