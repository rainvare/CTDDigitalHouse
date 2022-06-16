package com;
import java.util.ArrayList;
import java.util.List;

public class PizzaCombinada extends Pizza{

    private List<Pizza> listaDePizzas;

    //constructor
    public PizzaCombinada(String nombre, String descripcion) {
        super(nombre, descripcion);
       listaDePizzas = new ArrayList<>();
    }

    //métodos
    public void agregarPizzas(Pizza i){
            listaDePizzas.add(i);
       }

    public Double calcularPrecio() {
        double total=0.0;

        for (Pizza i: listaDePizzas){
            total+= i.calcularPrecio()/2;
        }
        return total;
    }

    @Override
    public String toString() {
        String pizzasString="";
        for (Pizza i: listaDePizzas){
            pizzasString+="\t* "+ i.toString();
        }
        return getNombre()+" es una pizza que tiene mitad especial y mitad anana, su precio es de "+ this.calcularPrecio() + " pesos.";
    }


}
