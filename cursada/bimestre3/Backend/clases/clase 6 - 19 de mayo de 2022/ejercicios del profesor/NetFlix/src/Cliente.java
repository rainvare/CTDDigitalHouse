public class Cliente {
    public static void main(String[] args) {
        GrillaDePeliculasProxy proxy = new GrillaDePeliculasProxy(new GrillaDePeliculas());
        proxy.setLaIP(new IP(122,23,23,23));

        try {
            System.out.println(proxy.getPelicula("The White Tiger").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };

        try {
            System.out.println(proxy.getPelicula("His Houser").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };

        try {
            System.out.println(proxy.getPelicula("Over the Moon").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };

        try {
            System.out.println(proxy.getPelicula("Superbad").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };


        try {
            System.out.println(proxy.getPelicula("The Prom").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };

        try {
            System.out.println(proxy.getPelicula("The Babysitter").getLink());
        }
        catch (PeliculaNoHabilitadaException e) {
            System.out.println(e);
        };


    }
}
