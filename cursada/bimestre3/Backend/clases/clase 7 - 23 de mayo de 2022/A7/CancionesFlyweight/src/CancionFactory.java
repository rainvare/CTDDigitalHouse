import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CancionFactory {
    private static final HashMap<String, Cancion> CANCION_MAP = new HashMap<>();

    public static Cancion getCancion(String nombre){
    Cancion cancion = CANCION_MAP.get(nombre);
    if(cancion == null){
        cancion = new Cancion(nombre);
        CANCION_MAP.put(nombre, cancion);
        System.out.println("Se creó la canción: " + nombre);
    }
    return cancion;
    }

    public void imprimirListaReproduccion(){
        for (Map.Entry<String, Cancion> stringCancionEntry : CANCION_MAP.entrySet()) {
            System.out.println(stringCancionEntry.getValue().toString());
        }
    }
}
