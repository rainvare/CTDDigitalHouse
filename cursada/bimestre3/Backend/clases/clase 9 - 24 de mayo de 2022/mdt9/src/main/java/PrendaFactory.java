import java.util.HashMap;
import java.util.Map;

public class PrendaFactory {

    private Map<String, Prenda> cache;

    public PrendaFactory() {
        cache = new HashMap<>();
    }

    public int tamanioCache() {
        return cache.size();
    }

    public Prenda crearPrenda(String talle, String tipo, boolean esNuevo, boolean esImportada) {
        Prenda prenda = cache.get(tipo);
        if (prenda == null) {
            prenda = new Prenda(talle, tipo, esNuevo, esImportada);
            cache.put(tipo, prenda);
            System.out.println("Creando nueva..." + prenda.toString());
        } else {
            prenda.setTalle(talle);
            prenda.setEsNuevo(esNuevo);
            prenda.setEsImportada(esImportada);
            System.out.println("Modificando existente..." + prenda.toString());
        }
        return prenda;
    }
}
