public class Serie implements  ISerie{

    @Override
    public String getSerie(String nombreSerie) {

        //System.out.println(laSerie);
        return "www."+nombreSerie;
    }
}
