package rodrigo.main;

import rodrigo.Atencion;

public class Application {

	public static void main(String[] args) {

		Atencion atencion = new Atencion();
		String mensaje = atencion.solucion("facturas", "Problema con la linea");
		System.out.println(mensaje);
	}

}
