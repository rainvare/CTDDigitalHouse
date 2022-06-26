public class Bosque {
    public static void main(String[] args) {
        ArbolFactory arbolFactory = new ArbolFactory();

        while(arbolFactory.obtenerCantidadArboles() < 1000){
            if(arbolFactory.obtenerCantidadArboles() % 2 == 0){
                Arbol arbolVerde = arbolFactory.getArbol("Ornamental");
            }
            else {
                Arbol arbolRojo = arbolFactory.getArbol("Frutal Rojo");
            }
        }
        System.out.println("Cantidad de árboles plantados: " + arbolFactory.obtenerCantidadArboles());

        Runtime runtime = Runtime.getRuntime();
        System.out.println("Memoria usada: " + (runtime.totalMemory() - runtime.freeMemory()) / (1024 * 1024) + "%");

    }
}