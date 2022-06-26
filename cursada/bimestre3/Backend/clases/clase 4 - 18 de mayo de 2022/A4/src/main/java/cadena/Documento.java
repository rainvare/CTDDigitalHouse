package cadena;

import cadena.manejadores.Jerarca;
import cadena.manejadores.Presidente;

public class Documento {

    private String contenido;
    private int tipo;
//constructor
    public Documento(String contenido, int tipo) {
        this.contenido = contenido;
        this.tipo = tipo;
    }
//método leer
    public void leer(Jerarca jerarca) {
        if (tipo == 1) {
            System.out.println("Diputado leyendo: \"" + contenido + "\"");
        } else {
            System.out.println("El cargo 'Diputado' no tiene acceso a este documento");
        }
    }
}
