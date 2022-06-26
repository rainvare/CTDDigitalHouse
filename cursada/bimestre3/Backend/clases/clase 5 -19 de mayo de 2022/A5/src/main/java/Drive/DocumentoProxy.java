package Drive;
import java.util.ArrayList;
import java.util.List;

public class DocumentoProxy extends Documento {

    private DocumentoConcreto documento;
    private List<String> usuariosAutorizados;

    public DocumentoProxy(String url,DocumentoConcreto documento) {
        super(url);
        this.documento = documento;
        this.usuariosAutorizados = new ArrayList<>();
    }

    public void agregarUsuarioAutorizado(String mail) {
        this.usuariosAutorizados.add(mail);
    }

    @Override
    public void abrir(String mailUsuario) {
        boolean existeUsuario = usuariosAutorizados.stream().anyMatch(mail -> mail.equals(mailUsuario));
        if (existeUsuario) {
            documento.abrir(mailUsuario);
        } else {
            System.out.println("\n---- El usuario: " + mailUsuario + " no tiene acceso al documento ----");
        }
    }

    @Override
    public void mostrarHistorialDeAccesos() {
        this.documento.mostrarHistorialDeAccesos();
    }
}
