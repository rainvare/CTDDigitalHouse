public class Pelicula {

    private String nombre;
    private String pais;
    private String link;

    public Pelicula(String nombre, String pais, String link) {
        this.nombre = nombre;
        this.pais = pais;
        this.link = link;
    }

    public String getNombre() {
        return nombre;
    }

    public String getPais() {
        return pais;
    }

    public String getLink() {
        return link;
    }
}
