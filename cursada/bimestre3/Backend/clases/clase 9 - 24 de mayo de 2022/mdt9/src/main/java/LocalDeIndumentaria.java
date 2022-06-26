import java.util.ArrayList;
import java.util.List;

public class LocalDeIndumentaria {

    private List<Prenda> prendas;
    private PrendaFactory factory;
//    Para probar sin la lista comentar linea 8 y descomentar esta
//    private int cantPrendas = 0;

    public LocalDeIndumentaria() {
//    Para probar sin la lista comentar linea 15
        this.prendas = new ArrayList<>();
        this.factory = new PrendaFactory();
    }

    public void agregarPrenda(String talle, String tipo, boolean esNuevo, boolean importada) {
        prendas.add(factory.crearPrenda(talle, tipo, esNuevo, importada));
//    Para probar sin la lista comentar linea 19 y descomentar estas
//        factory.crearPrenda(talle, tipo, esNuevo, importada);
//        cantPrendas++;
    }

    public int cantidadPrendas() {
        return prendas.size();
//    Para probar sin la lista comentar linea 26 y descomentar esta
//        return cantPrendas;
    }

    public void mostrarPrendas() {
//    Para probar sin la lista comentar el for
        for (Prenda prenda : prendas) {
            System.out.println(prenda.toString());
        }
        Runtime runtime = Runtime.getRuntime();
        System.out.println("Memoria usada: " + (runtime.totalMemory()-runtime.freeMemory()) / (1024 * 1024));
    }
}
