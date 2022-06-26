package rodrigo;

public class AtencionCliente implements ISolicitud {

	private final ISolicitud solicitud;
	private static final String TIPO = "cliente";
	
	
	public AtencionCliente(ISolicitud solicitud) {
		super();
		this.solicitud = solicitud;
	}



	@Override
	public String solucion(final String tipo, String mensaje) {

		if(!tipo.equalsIgnoreCase(TIPO)) {
			
			mensaje = "Usted sera transferido a facturación, Aguarde en el telefono";
			return solicitud.solucion(tipo, mensaje);
		}
		
		return "Ha sido resuelto por Atencion al cliente";
	}

}
