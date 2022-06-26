package com.company;

public class Main {

    public static void main(String[] args) {
	Usuario usuario= new Usuario("musica@gmail.com","premium");
	Descarga descarga=new SevicioDescargaProxy();
	descarga.descargarTema("Mi tema favorito", usuario.getTipo());
    }
}
