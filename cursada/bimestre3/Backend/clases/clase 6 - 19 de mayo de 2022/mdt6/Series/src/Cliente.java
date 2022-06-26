public class Cliente {
    public static void main(String[] args) {
        SerieProxy proxy = new SerieProxy(new Serie());
        try {
            System.out.println(proxy.getSerie("Loki"));
            System.out.println(proxy.getSerie("Gambito de Dama"));
            System.out.println(proxy.getSerie("Stranger things"));
            System.out.println(proxy.getSerie("Atypical"));
            System.out.println(proxy.getSerie("Dirk Gentlys"));
            System.out.println(proxy.getSerie("Elite"));
       }
        catch (SerieNoHabilitadaException e) {
            System.out.println(e);
        };
    }
}
