package digital.house.flyweight.factory;

import java.util.HashMap;
import java.util.Objects;

import digital.house.flyweight.dto.ComidaDTO;

public class ComidaFactory {

	private static final HashMap<String, ComidaDTO> COMIDA_MAP = new HashMap<>();

	public ComidaDTO getComida(final String tipoComida) {
		ComidaDTO comida = COMIDA_MAP.get(tipoComida);
		if (Objects.isNull(comida)) {
			comida = new ComidaDTO(tipoComida);
			COMIDA_MAP.put(tipoComida, comida);
			System.out.println("Creando Objecto de comida tipo: " + tipoComida);
			return comida;

		}
		System.out.println("Recuperando Objecto de comida tipo: " + tipoComida);
		return comida;

	}
}
