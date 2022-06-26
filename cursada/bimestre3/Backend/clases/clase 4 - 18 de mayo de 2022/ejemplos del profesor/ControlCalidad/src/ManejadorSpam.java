public class ManejadorSpam extends Manejador
{

    // --------------------------------------------------

    @Override
    public void comprobar(Mail email)
    {
        System.out.println("Marcado como spam");
     }
}
