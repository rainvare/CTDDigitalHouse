public class SerieProxy implements ISerie{

    private Serie laSerie;
    private int cantVistas;

    public SerieProxy(Serie laSerie) {
        this.laSerie = laSerie;
        this.cantVistas = 0;
    }

    @Override
    public String getSerie(String nombreSerie) throws SerieNoHabilitadaException {
       if (this.cantVistas>4){
           throw new SerieNoHabilitadaException(nombreSerie+" excede la cantidad de producciones permitidas");
       }
        this.cantVistas++;
        return this.laSerie.getSerie(nombreSerie);
    }
}
