import animales.Leon;
import animales.Tigre;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class Main {

    private final static Logger logger = Logger.getLogger(Main.class);

    public static void main(String[] args) {

        BasicConfigurator.configure();

        Tigre tigger1 = null, tigger = null, pooh = null;
        Leon mufasa = null, simba = null, nala = null;

        try {
            tigger1 = new Tigre("Tigger", 10);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (tigger1 != null) {
                tigger1.correr();
                tigger1.esMayorA10();
            }
        }

        try {
            tigger = new Tigre("Tigger", 15);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (tigger != null) {
                tigger.correr();
                tigger.esMayorA10();
            }
        }

        try {
            pooh = new Tigre("Pooh", -1);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (pooh != null) {
                pooh.correr();
                pooh.esMayorA10();
            }
        }

        try {
            mufasa = new Leon("Mufasa", 20, true);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (mufasa != null) {
                mufasa.correr();
                mufasa.esMayorA10();
            }
        }

        try {
            simba = new Leon("Simba", 7);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (simba != null) {
                simba.correr();
                simba.esMayorA10();
            }
        }

        try {
            nala = new Leon("Nala", -10);
        } catch (Exception e) {
            logger.error(e.getMessage());
            if (nala != null) {
                nala.correr();
                nala.esMayorA10();
            }
        }
    }
}
