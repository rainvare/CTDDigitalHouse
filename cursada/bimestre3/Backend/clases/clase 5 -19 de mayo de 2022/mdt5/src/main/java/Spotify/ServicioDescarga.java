package Spotify;
public class ServicioDescarga implements DescargaSpotify {

    @Override
    public void descargar(Usuario usuario, String cancion) {
        System.out.println("Usuario ID: " + usuario.getId() + " descargo " + cancion);
    }
}