import java.io.*;
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

        //USO BUFFER
        FileOutputStream fos = null;
        try {

            fos = new FileOutputStream("empleadosBuffer.txt"); //tipo de archivo con los datos

            BufferedOutputStream bos = new BufferedOutputStream(fos);

            //escribo con el buffer en un formato
            for (Empleado empleado : empleados) {

                String registro = "Nombre: " + empleado.getNombre() + "\n"
                        + " Apellido: " + empleado.getApellido() + "\n"
                        + " Legajo: " + empleado.getLegajo() + "\n"
                        + " Sueldo: " + empleado.getSueldo();

                bos.write(registro.getBytes());
                System.out.println(registro);
            }

            bos.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}