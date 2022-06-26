public class ControlaArticulos {

    public static void main(String[] args) {

        CompruebaCalidad proceso = new CompruebaCalidad();
        proceso.comprobar(new Articulo("carne", 1100,1300, "sano"));
        proceso.comprobar(new Articulo("queso", 100,1300, "sano"));
        proceso.comprobar(new Articulo("verdura", 1100,2300, "casi sano"));
        proceso.comprobar(new Articulo("pastas", 1100,1300, "epepepe"));

    }


}
