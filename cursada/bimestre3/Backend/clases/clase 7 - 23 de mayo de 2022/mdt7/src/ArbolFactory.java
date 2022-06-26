

import java.util.HashMap;
import java.util.Map;

public class ArbolFactory {
    private static Map <String, Arbol> ARBOL_MAP = new HashMap<>();

    public Arbol getArbol(String tipo){
        Arbol arbol = new Arbol(tipo);
        String clave = "Key:"+ arbol.getAlto() + ":"+ arbol.getAncho() +":"+ arbol.getColor();
        System.out.println(clave);
        if (!ARBOL_MAP.containsKey(clave)){
            ARBOL_MAP.put(clave, arbol);
            System.out.println("Arbol plantado.");
            return ARBOL_MAP.get(clave);
        }
        arbol = null;
        System.out.println("**Arbol obtenido del Hashmap**");
        return ARBOL_MAP.get(clave);
    }

    public int obtenerCantidadArboles(){
        return ARBOL_MAP.size();
    }
}
