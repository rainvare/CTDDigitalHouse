package digital.house.flyweight.dto;

import java.util.ArrayList;
import java.util.List;

import digital.house.flyweight.factory.ArbolFactory;

public class BoqueDTO {

	private static final List<ArbolDTO> ARBOL = new ArrayList<>();

	public void plantarArbol(final String tipoArbol, final int alto, final int ancho, final String color) {
		final ArbolDTO arbol = ArbolFactory.getTreeType(tipoArbol, alto, ancho, color);
		ARBOL.add(arbol);
	}

	public List<ArbolDTO>  getArboles(){
		return ARBOL;
	}
}