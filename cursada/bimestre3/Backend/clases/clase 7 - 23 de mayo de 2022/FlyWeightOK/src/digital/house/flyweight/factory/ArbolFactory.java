package digital.house.flyweight.factory;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import digital.house.flyweight.dto.ArbolDTO;

public class ArbolFactory {
	static Map<String, ArbolDTO> TIPO_ARBOLES = new HashMap<>();

	public static ArbolDTO getTreeType(final String tipoArbol, final int alto, final int ancho, final String color) {
		ArbolDTO arbol = TIPO_ARBOLES.get(tipoArbol);

		if (Objects.isNull(arbol)) {
			arbol = new ArbolDTO(alto, ancho, color, tipoArbol);
			TIPO_ARBOLES.put(tipoArbol, arbol);
			return arbol;
		}

		return arbol;
	}
}