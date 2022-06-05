package dh.main;

public class Serie implements dh.main.model.iSerie{

    @Override
    public String getSerie(String pelicula) {
        return "https//" + pelicula.replace(" ","") + ".com";
    }


}