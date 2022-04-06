package com.company;

import java.util.ArrayList;
import java.util.List;

public class Puerto {
    private List<Contenedor> contenedores;

    public Puerto(){
        contenedores = new ArrayList<>();
    }

    //Métodos
    public void agregarContenedor(Contenedor contenedor){
        contenedores.add(contenedor);
    }

    public void mostrarOrdenadosporId(){
        contenedores.sort(null);
        System.out.println(contenedores);
    }

    public Integer calcularContenedoresPeligrosos(){
        Integer cantidad = 0;
        for (Contenedor contenedor : contenedores){
            if(contenedor.getMaterialPeligroso() && contenedor.getProcedencia() == "Desconocida"){
                cantidad++;
            }
        }
        return cantidad;
    }
}
