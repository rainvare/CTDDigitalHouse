import cadena.Documento;
import cadena.manejadores.Gobierno;

public class Main{
    public static void main(String[]args){

            Documento reservado = new Documento("cadena.Documento reservado", 1);
            Documento secreto = new Documento("cadena.Documento secreto", 2);
            Documento muySecreto = new Documento("cadena.Documento muy secreto", 3);

            Gobierno gobierno = new Gobierno();

            gobierno.leer(reservado);
            gobierno.leer(secreto);
            gobierno.leer(muySecreto);
            gobierno.leer(reservado);
        }

    }

