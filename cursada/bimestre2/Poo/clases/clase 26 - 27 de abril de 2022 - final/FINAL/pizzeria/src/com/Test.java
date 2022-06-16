package com;

public class Test {

    public static void main(String[] args) throws PizzaException {
        //creo la pizzeria
        Pizzeria pizzeria= new Pizzeria("Pizzeria Loca");

        //primera pizza
        Pizza p1= PizzaFactory.getInstance().crearPizza("Muzarrella chica");
        pizzeria.agregarPizzas(p1);


        //segunda pizza
        Pizza p2= PizzaFactory.getInstance().crearPizza("Especial chica");
        pizzeria.agregarPizzas(p2);

        //tercera pizza
        Pizza p3= PizzaFactory.getInstance().crearPizza("Anana chica");
        pizzeria.agregarPizzas(p3);

        //combo loco - cuarta pizza
        Pizza p4 = PizzaFactory.getInstance().crearPizza("Combinada loca");
        pizzeria.agregarPizzas(p4);


        //SOUT de Pizzas
        pizzeria.mostrarPizzas();

    }
}
