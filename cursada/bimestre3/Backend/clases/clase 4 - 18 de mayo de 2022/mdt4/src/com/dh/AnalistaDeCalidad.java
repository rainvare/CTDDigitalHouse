package com.dh;

public class AnalistaDeCalidad {
    public static void main(String[] args) {
        Articulo kimchi= new Articulo("Kimchi", 1500, 1200, "sano");
        Articulo soju = new Articulo("Soju", 1235, 1100, "casi sano");
        Articulo bulgogi = new Articulo("Bulgogi", 2594, 1180, "sano");

        CompruebaCalidad controlesDeCalidad = new CompruebaCalidad();

        controlesDeCalidad.comprobar(kimchi);
        controlesDeCalidad.comprobar(soju);
        controlesDeCalidad.comprobar(bulgogi);
    }
}
