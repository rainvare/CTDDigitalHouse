package rodrigo;

public class SoporteTecnico implements ISolicitud {

	@Override
	public String solucion(final String tipo, String mensaje) {

		return "Ha sido resuelto por el deparatamento de Tecnico";
	}

}
