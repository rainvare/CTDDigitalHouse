import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        Contactos contacto1 = new Contactos("Pepe", "hola@com", "351365445");
        Contactos contacto2 = new Contactos("Maria", "chau@com", "351626589");
        Contactos contacto3 = new Contactos("Laura", "otonio@com", "01145569856");
        Contactos contacto4 = new Contactos("Sergio", "invierno@com", "025632145");
        Contactos contacto5 = new Contactos("Ana", "verano@com", "965632458");

        ArrayList<Contactos> nuevosContactos = new ArrayList<>();
        nuevosContactos.add(contacto1);
        nuevosContactos.add(contacto2);
        nuevosContactos.add(contacto3);
        nuevosContactos.add(contacto4);
        nuevosContactos.add(contacto5);

        //guardar en archivo la coleccion
        FileOutputStream fos = null;

        try {
            fos = new FileOutputStream("nuevosContactos.txt");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(nuevosContactos);
            oos.close();


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        //recuperar la coleccion desde un archivo a otra coleccion en java
        List<Contactos> contactosrecuperados = null;
        FileInputStream fis = null;

        try {
            fis = new FileInputStream("nuevosContactos.txt");
            ObjectInputStream ois = new ObjectInputStream(fis);
            contactosrecuperados = (List<Contactos>) ois.readObject();
            ois.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        //mostrar coleccion recuperada por consola
        for (Contactos contactosrecuperado : contactosrecuperados) {
            System.out.println(contactosrecuperado.toString());

        }

    }


}
