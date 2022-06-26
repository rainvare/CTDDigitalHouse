public class ProcesaMail {
    public static void main(String[] args) {

        CompruebaMail proceso = new CompruebaMail();
        proceso.comprobar(new Mail("mio@mail.com", "tecnica@digitalhouse.com","reclamo"));
        proceso.comprobar(new Mail("mio@mail.com", "sds@digitalhouse.com","gerencia"));
        proceso.comprobar(new Mail("mio@mail.com", "juan@pepe.com","comercial"));
        proceso.comprobar(new Mail("mio@mail.com", "qqq@digitalhouse.com","reclamo"));

       }
}
