package com.company;

public class SevicioDescargaProxy implements  Descarga{

    @Override
    public void descargarTema(String tema,String tipoUsuario) {
        if (usuarioHabilitado(tipoUsuario)) {
            ServicioDescarga servicio = new ServicioDescarga();
            servicio.descargarTema(tema,tipoUsuario);
        }
    }
    public boolean usuarioHabilitado(String tipo)
    {
        return tipo.equals("Premium");
    }
}
