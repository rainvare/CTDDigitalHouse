package com.dh;

import java.time.LocalDate;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Empleado {

    private final static String tabla = "empleados";

    public static String generarInsert(Integer id, String nombre, String nombreEmpresa, LocalDate fechaIngreso){
        return "INSERT INTO " + tabla + " (id, nombre, nombreEmpresa, fechaIngreso) VALUES ("
                + id.toString() + ",'" + nombre + "','" + nombreEmpresa + "','" + fechaIngreso.toString() + "')";
    }

    public static String generarSelectAll(){
        return "SELECT * FROM " + tabla;
    }

    public static String generarSelectPorId(String campos, Integer id){
        return "SELECT " + campos + " FROM " + tabla + " WHERE id = " + id.toString();
    }

    public static String generarDelete(Integer id){
        return "DELETE FROM " + tabla + " WHERE id = " + id.toString();
    }

    public static String crearTabla(Map<String, String> columnas){
        String sentencia =  "DROP TABLE IF EXISTS " + tabla + "; CREATE TABLE " + tabla + " (";

        Set<String> nombresDeLasColumnas = columnas.keySet();
        Iterator<String> iterador = nombresDeLasColumnas.iterator();

        while (iterador.hasNext()){
            String nombreDeLaColumna = iterador.next();
            sentencia = sentencia + nombreDeLaColumna + " " + columnas.get(nombreDeLaColumna);
            if(iterador.hasNext()){
                sentencia = sentencia + ", ";
            }
        }

        sentencia = sentencia + ")";

        return sentencia;
    }
}

