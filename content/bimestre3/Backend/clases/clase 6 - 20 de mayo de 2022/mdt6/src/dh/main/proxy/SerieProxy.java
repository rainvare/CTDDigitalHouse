package dh.main.proxy;

import dh.main.Serie;
import dh.main.model.SerieNoHabilitadaException;
import dh.main.model.iSerie;

public class SerieProxy implements iSerie{
        private int cantVistas = 0;
        private Serie serie;

    public SerieProxy(Serie serie) {
        this.serie = serie;
    }

    @Override
    public String getSerie(String pelicula) throws SerieNoHabilitadaException {

        if (this.cantVistas < 5) {
            cantVistas++;
            return this.serie.getSerie(pelicula);
        } else {
            throw new SerieNoHabilitadaException("Ha superado la cantidad de reproducciones permitidas");
        }
    }


}
