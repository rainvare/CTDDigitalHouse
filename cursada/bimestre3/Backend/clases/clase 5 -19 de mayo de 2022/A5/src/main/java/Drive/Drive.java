package Drive;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

public class Drive {
    private List<DocumentoProxy> documentos = new ArrayList<>();

    public void subir(DocumentoProxy doc) {
        this.documentos.add(doc);
    }

    public void abrir(String url, String mailUsuario) {
        try {
            this.obtenerDocumento(url).abrir(mailUsuario);
        } catch (NoSuchElementException e) {
            System.out.println("\n---- No existe el archivo con url: \"" + url + "\" ----");
        }
    }

    public void mostrarAccesosDocumento(String url) {
        try {
            this.obtenerDocumento(url).mostrarHistorialDeAccesos();
        } catch (NoSuchElementException e) {
            System.out.println("\n---- No existe el archivo con url: \"" + url + "\" ----");
        }
    }

    private DocumentoProxy obtenerDocumento(String url) {
        Optional<DocumentoProxy> op = documentos.stream().filter(doc -> doc.getUrl().equals(url)).findFirst();
        return op.get();
    }
}
