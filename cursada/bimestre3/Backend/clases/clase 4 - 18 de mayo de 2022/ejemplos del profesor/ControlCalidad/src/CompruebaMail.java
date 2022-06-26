public class CompruebaMail
    {
        Manejador inicial;

        public CompruebaMail() {
            this.inicial = new ManejadorGerencia();
            Manejador tecnica = new ManejadorTecnica();
            Manejador comercial = new ManejadorComercial();
            Manejador spam = new ManejadorSpam();

            inicial.setSiguiente( comercial );
            comercial.setSiguiente( tecnica );
            tecnica.setSiguiente( spam );
        }

        public void comprobar(Mail  email)
        {
            inicial.comprobar( email );
        }
    }

