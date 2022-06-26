package Drive;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DocumentoConcreto extends Documento {

    private int id;
    private String contenido;
    private List<String> historialAccesos;

    public DocumentoConcreto(String url, int id, String contenido) {
        super(url);
        this.id = id;
        this.contenido = contenido;
        this.historialAccesos = new ArrayList<>();
    }

    @Override
    public void abrir(String mailUsuario) {
        System.out.println("\nEl usuario: " + mailUsuario + " tiene acceso al documento con ID: " + id);
        System.out.println("\t\"" + contenido + "\"");
        this.historialAccesos.add(LocalDateTime.now().toString() + "\t" + mailUsuario);
    }

    public void mostrarHistorialDeAccesos() {
        System.out.println("\nHistorial de accesos: ");
        for (String acceso : historialAccesos) {
            System.out.println("\t" + acceso);
        }
    }
}