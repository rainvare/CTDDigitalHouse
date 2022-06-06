import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        //creo lista
        List<Perro> ListaPerros = new ArrayList<>();


        //instancio perros
        Perro perro1 = new Perro();
        perro1.setNombre("Sultán");
        perro1.setEdad(3);

        Perro perro2 = new Perro();
        perro2.setNombre("Pichicho");
        perro1.setEdad(4);

        //agrego perros creados a una lista
        ListaPerros.add(perro1);
        ListaPerros.add(perro2);

        //mando mis datos de lista a persistir con FileOutputStream (mediante un Stream se mandan el nombre del archivo

        FileOutputStream fo;

            try {
                fo = new FileOutputStream("OutputFile.txt"); // archivo para guardar inputs
                ObjectOutputStream dos = new ObjectOutputStream(fo); //creo un canal de salida (flujo de datos) para enviar el archivo

                //serializo el objeto lista que quiero persistir
                dos.writeObject(ListaPerros);



            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

// creo lista de objectos Perros 2. en objeto de tipo lista
            List<Perro> ListaPerros2 = null;
            FileInputStream fi = null;

            try{
                // creo mi archivo
                fi = new FileInputStream("OutputFile.txt");
                // guardo en lista de perros el archivo a deserializar
                ObjectInputStream ois = new ObjectInputStream(fi);

                //leo mi archivo
                ListaPerros2= (ArrayList) ois.readObject();

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
// recorro la lista de objectos
            for(Perro perro: ListaPerros2)
                System.out.println(perro.getNombre() + " " + perro.getEdad());
    }
}
