import Spotify.ProxyDescarga;
import Spotify.Usuario;

public class Main {
    public static void main(String[] args) {
        Usuario premium = new Usuario(00001, "Premium");
        Usuario free = new Usuario(64783, "Free");
        ProxyDescarga proxy = new ProxyDescarga();

        proxy.descargar(premium, "BTS (방탄소년단) 'Dynamite'");
        proxy.descargar(free, "DUKI - TOP 5");
    }
}
