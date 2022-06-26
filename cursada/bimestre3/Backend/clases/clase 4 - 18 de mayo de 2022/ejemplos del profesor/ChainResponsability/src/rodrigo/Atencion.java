package rodrigo;

public class Atencion implements ISolicitud {

	private static ISolicitud solicitud;

	@Override
	public String solucion(String tipo, String mensaje) {
		final ISolicitud soporte = new SoporteTecnico();
		final ISolicitud facturacion = new Facturacion(soporte);
		final ISolicitud cliente = new AtencionCliente(facturacion);
		solicitud = cliente;

		return solicitud.solucion(tipo, mensaje);
	}

}
