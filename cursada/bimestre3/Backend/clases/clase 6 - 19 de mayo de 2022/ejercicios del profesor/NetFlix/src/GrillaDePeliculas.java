public class GrillaDePeliculas  implements  IGrillaDePeliculas{

    @Override
    public Pelicula getPelicula(String nombrePelicula) {
        Pelicula lapeli = null;
        switch (nombrePelicula) {
            case "The White Tiger":
                lapeli = new Pelicula("The White Tiger", "argentina", "WWWARGTIGER" );
                break;
            case "His Houser":
                lapeli = new Pelicula("His Houser", "brasil", "WWWBRAHOUSE" );
                break;
            case "Over the Moon":
                lapeli = new Pelicula("Over the Moon", "colombia", "WWWCOLMOON" );
                break;
            case "Superbad":
                lapeli = new Pelicula("Superbad", "argentina", "WWWARGBAD" );
                break;
            case "The Prom":
                lapeli = new Pelicula("The Prom", "brasil", "WWWBRAPROM" );
                break;
            case "The Babysitter":
                lapeli = new Pelicula("The Babysitter", "colombia", "WWWCOLSITTER" );
                break;
        }
        //System.out.println(lapeli);
        return lapeli;
    }
}
