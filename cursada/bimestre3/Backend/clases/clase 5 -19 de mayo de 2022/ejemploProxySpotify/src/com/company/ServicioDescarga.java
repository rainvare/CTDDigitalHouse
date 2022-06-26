package com.company;

public class ServicioDescarga implements  Descarga{
    @Override
    public void descargarTema(String tema,String tipoUsuario) {
        System.out.println("El tema " + tema + "se ha descargado");
    }
}
