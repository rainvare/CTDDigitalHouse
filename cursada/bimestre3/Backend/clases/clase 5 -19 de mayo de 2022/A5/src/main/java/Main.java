import Drive.DocumentoConcreto;
import Drive.DocumentoProxy;
import Drive.Drive;

public class Main {
    public static void main(String[] args) {
        Drive drive = new Drive();
        DocumentoConcreto documento = new DocumentoConcreto("www.url.com", 2846, "Este es mi documento importante");
        DocumentoProxy proxy = new DocumentoProxy(documento.getUrl(), documento);

        proxy.agregarUsuarioAutorizado("mail@digitalhouse.com");
        proxy.agregarUsuarioAutorizado("otromail@digitalhouse.com");
        drive.subir(proxy);

        drive.abrir("www.url.com", "mail@digitalhouse.com");
        drive.abrir("www.url.com", "mail@digitalhouse.com");
        drive.abrir("www.url.com", "otromail@digitalhouse.com");
        drive.abrir("www.url.com", "mail@digitalhouse.com");
        drive.abrir("www.url.com", "otromail@digitalhouse.com");


        drive.mostrarAccesosDocumento("www.url.com");
    }
}
