package com;
import java.util.ArrayList;
import java.util.List;

public class Pizzeria {
    private String nombre;
    private List<Pizza> pizzas;

    public Pizzeria(String nombre) {
        this.nombre = nombre;
        this.pizzas =new ArrayList<>();
    }

    public void mostrarPizzas(){
        for (Pizza i: pizzas){
            System.out.println(i.toString());
        }
    }

    public void agregarPizzas(Pizza i){
        this.pizzas.add(i);
    }
}