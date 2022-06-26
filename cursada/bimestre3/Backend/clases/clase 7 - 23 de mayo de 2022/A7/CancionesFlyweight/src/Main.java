public class Main {
    public static void main(String[] args) {
        CancionFactory cancionFactory = new CancionFactory();
        Cancion cancion1 = cancionFactory.getCancion("Black Hole Sun");
        cancion1.setArtista("Soundgarden");
        cancion1.setGenero("Grunge");
        //System.out.println(cancion1.imprimirCancion());
        Cancion cancion2 = cancionFactory.getCancion("If You Were There, Beware");
        cancion2.setArtista("Arctic Monkeys");
        cancion2.setGenero("Indie");
        cancionFactory.imprimirListaReproduccion();

    }
}