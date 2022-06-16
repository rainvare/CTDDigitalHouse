package dh.main;
import dh.main.model.SerieNoHabilitadaException;
import dh.main.proxy.SerieProxy;


public class Main {
    public static void main(String[] args) {
                Serie serie= new Serie();
                SerieProxy serieProxy = new SerieProxy(serie);

                try {

                    System.out.println(SerieProxy.getSerie("Loki"));

                } catch (SerieNoHabilitadaException exception) {
                    System.out.println("Error: " + exception.getMessage());
                }


    }
}
