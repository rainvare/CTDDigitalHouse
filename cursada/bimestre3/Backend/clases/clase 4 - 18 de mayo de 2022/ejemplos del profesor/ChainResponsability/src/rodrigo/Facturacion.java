package rodrigo;

public class Facturacion implements ISolicitud {

	private final ISolicitud solicitud;
	private static final String TIPO = "factura";

	public Facturacion(ISolicitud solicitud) {
		super();
		this.solicitud = solicitud;
	}

	@Override
	public String solucion(final String tipo, String mensaje) {

		if (!tipo.equalsIgnoreCase(TIPO)) {

			mensaje = "Usted sera transferido a Soporte Tecnico, Aguarde en el telefono";
			return solicitud.solucion(tipo, mensaje);
		}

		return "Ha sido resuelto por el deparatamento de facturación";
	}

}
