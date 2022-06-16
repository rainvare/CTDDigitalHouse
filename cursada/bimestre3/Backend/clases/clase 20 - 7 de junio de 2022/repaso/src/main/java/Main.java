import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Empleado> empleados = new ArrayList<>(); //creo mi array

        //agrego los empleado a la lista 'empleados'
        empleados.add(new Empleado("Romina", "Villatta", "0572", 500000.0));
        empleados.add(new Empleado("Marcela", "Ramírez", "0581", 450000.0));
        empleados.add(new Empleado("Jime", "S.H.K", "0560", 10000000.0));
        empleados.add(new Empleado("Nestor", "Centeno", "0596", 705000.0));
        empleados.add(new Empleado("Indira", "Réquiz", "05592", 350000.0));

        //creo canal de datos
        FileOutputStream fos=null;
        try{

            fos= new FileOutputStream("empleados.txt"); //tipo de archivo con los datos
            ObjectOutputStream oos= new ObjectOutputStream(fos);
            oos.writeObject(empleados);
            oos.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        List<Empleado> registroEmpleados =null;
        FileInputStream fis= null;
//recupero
        try{
            fis=new FileInputStream("empleados.txt"); //tipo de archivo con los datos
            ObjectInputStream ois= new ObjectInputStream(fis);
            registroEmpleados =(ArrayList)ois.readObject();
            ois.close();
        } catch (Exception ex){
            ex.printStackTrace();
        }

        //formato de salida
        for (Empleado empleado: registroEmpleados) {
            System.out.println("Nombre: " + empleado.getNombre() + "\n"
                    + " Apellido: " + empleado.getApellido() + "\n"
                    + " Legajo: " + empleado.getLegajo() + "\n"
                    + " Sueldo: " + empleado.getSueldo());
        }
    }
}

