import logger.CalculadorDePromedio;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.List;

public class Main {

    private final static Logger logger = Logger.getLogger(Main.class);

    public static void main(String[] args) {

        BasicConfigurator.configure();

        CalculadorDePromedio calculador = new CalculadorDePromedio();
        List<Integer> valores = List.of(5, 20, 35, 6, 10, 8);
        List<Integer> masDeDiezValores = List.of(5, 20, 35, 6, 10, 8, 51, 32, 9, 56, 21, 47, 15, 18);
        List<Integer> valoresVacio = new ArrayList<>();

        try {
            calculador.calcularPromedio(valores);
            calculador.encontrarMaximo(valores);
            calculador.encontrarMinimo(valores);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }

        try {
            calculador.calcularPromedio(masDeDiezValores);
            calculador.encontrarMaximo(masDeDiezValores);
            calculador.encontrarMinimo(masDeDiezValores);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }

        try {
            calculador.calcularPromedio(valoresVacio);
            calculador.encontrarMaximo(valoresVacio);
            calculador.encontrarMinimo(valoresVacio);
        } catch (Exception ex) {
            logger.error(ex.getMessage());
        }
    }
}
