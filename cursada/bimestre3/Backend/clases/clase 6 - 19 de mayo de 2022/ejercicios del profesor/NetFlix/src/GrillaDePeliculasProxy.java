public class GrillaDePeliculasProxy  implements IGrillaDePeliculas{

    private GrillaDePeliculas grilla;
    private IP laIP;

    public void setLaIP(IP laIP) {
        this.laIP = laIP;
    }

    public GrillaDePeliculasProxy(GrillaDePeliculas grilla) {
        this.setGrilla(grilla);
    }

    @Override
    public Pelicula getPelicula(String nombrePelicula) throws PeliculaNoHabilitadaException {
       Pelicula laPeli = grilla.getPelicula(nombrePelicula);
      //  System.out.println(laPeli);
       if (! (getLaIP().getPais()).equalsIgnoreCase(laPeli.getPais())){
           throw new PeliculaNoHabilitadaException(nombrePelicula+" no disponible en "+ getLaIP().getPais());
       }
        return laPeli;
    }

    public void setGrilla(GrillaDePeliculas grilla) {
        this.grilla = grilla;
    }

    public IP getLaIP() {
        return laIP;
    }
}
