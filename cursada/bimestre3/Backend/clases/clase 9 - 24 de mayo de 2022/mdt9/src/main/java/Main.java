public class Main {

    // indumentaria:
    //      Con FlyWeight y List de prendas en Local     → memoria = 21
    //      Con FlyWeight sin List de prendas en Local   → memoria = 13

    // indumentariaConDobleMap:
    //      Con FlyWeight y Map de prendas en Local      → memoria = 6

    public static void main(String[] args) {
        LocalDeIndumentaria local = new LocalDeIndumentaria();

        for (int i = 0; i < 10000; i++) {
            local.agregarPrenda("L", "Remera", true, true);
            local.agregarPrenda("M", "Remera", false, false);
            local.agregarPrenda("S", "Remera", true, false);
            local.agregarPrenda("XL", "Remera", false, true);
        }

        local.mostrarPrendas();
    }
}
