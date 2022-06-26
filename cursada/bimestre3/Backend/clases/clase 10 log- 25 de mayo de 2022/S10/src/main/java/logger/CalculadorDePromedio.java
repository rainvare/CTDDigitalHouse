package logger;

import org.apache.log4j.Logger;

import java.util.List;

public class CalculadorDePromedio {

    private static final Logger logger = Logger.getLogger(CalculadorDePromedio.class);

    public void calcularPromedio(List<Integer> valores) throws Exception {
        logger.debug("Iniciando método calcularPromedio()" + valores.toString());
        validarLongitudLista(valores);
        Integer sumaTotal = 0;
        for (Integer num : valores) {
            sumaTotal += num;
        }
        System.out.println("El promedio es: " + sumaTotal / valores.size());
        logger.debug("Terminó la ejecución del método calcularPromedio()");
    }

    public void encontrarMaximo(List<Integer> valores) throws Exception {
        logger.debug("Iniciando método encontrarMaximo() " + valores.toString());
        validarLongitudLista(valores);
        Integer maximo = valores.get(0);
        for (int i = 1; i < valores.size(); i++) {
            if (maximo < valores.get(i)) {
                maximo = valores.get(i);
            }
        }
        System.out.println("El máximo es: " + maximo);
        logger.debug("Terminó la ejecución del método encontrarMaximo()");
    }

    public void encontrarMinimo(List<Integer> valores) throws Exception {
        logger.debug("Iniciando método encontrarMinimo() " + valores.toString());
        validarLongitudLista(valores);
        Integer minimo = valores.get(0);
        for (int i = 1; i < valores.size(); i++) {
            if (minimo > valores.get(i)) {
                minimo = valores.get(i);
            }
        }
        System.out.println("El mínimo es: " + minimo);
        logger.debug("Terminó la ejecución del método encontrarMinimo()");

    }

    public void validarLongitudLista(List<Integer> valores) throws Exception {
        logger.debug("Iniciando método validarLongitudLista() " + valores.toString());
        if (valores.size() > 0) {
            if (valores.size() > 5) {
                logger.info("La lista es mayor que 5");
            }
            if (valores.size() > 10) {
                logger.info("La lista es mayor que 10");
            }
        } else {
            throw new Exception("La lista no tiene elementos!!!!");
        }
        logger.debug("Terminó la ejecución del método validarLongitudLista() con éxito");
    }
}
