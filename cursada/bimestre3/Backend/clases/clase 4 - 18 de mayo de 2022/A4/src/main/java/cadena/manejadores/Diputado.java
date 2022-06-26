package cadena.manejadores;
import cadena.Documento;

public class Diputado extends Jerarca {

    public Diputado() {
        super();
    }

    public Diputado(Jerarca siguienteJerarca) {
        super(siguienteJerarca);
    }

    public void leer(Documento documento) {
        documento.leer(this);
        if (siguienteJerarca != null) {
            siguienteJerarca.leer(documento);
        }
    }
}