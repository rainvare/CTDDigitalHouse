package com.dh.dao;

public class GeneradorDeSentenciasMedicamentos {

    private final static String tabla = "medicamentos";

    public static String generarInsert(){
        return "INSERT INTO " + tabla + "(id, codigo, nombre, laboratorio, cantidad, precio) VALUES (?, ?, ?, ?, ?, ?)";
    }

    public static String generarSelectAll(){
        return "SELECT * FROM " + tabla;
    }

    public static String generarSelectPorId(){
        return "SELECT * FROM " + tabla + " WHERE id = ?";
    }

    public static String generarSelectPorCampo(){
        return "SELECT * FROM " + tabla + " WHERE ? = ?";
    }

    public static String generarDeletePorId(){
        return "DELETE FROM " + tabla + " WHERE id = ?";
    }

    public static String generarDeletePorCampo(){
        return "DELETE FROM " + tabla + " WHERE ? = ?";
    }

    public static String generarDeleteAll() {
        return "DELETE FROM " + tabla;
    }
}