package com;
import java.util.List;

public class PizzaFactory {
    private static PizzaFactory instance;
    public static final String p1 = "Muzarrella chica";
    public static final String p2 = "Especial chica";
    public static final String p3 = "Anana chica";
    public static final String p4 = "Combinada loca";

    //fabrica
    private PizzaFactory() {
    };

    //instancia
    public static PizzaFactory getInstance(){
        if(instance==null){
            instance = new PizzaFactory();
        }
        return instance;
    }
//crear pizzas Simples y Combinadas
    public Pizza crearPizza(String nombreDeLaPizza) throws PizzaException {

            switch (nombreDeLaPizza) {
                case p1:
                    return new PizzaSimple("Muzarrella chica", "Pizza de muzza", 700.0,"chica");
                case p2:
                    return new PizzaSimple("Especial chica", "Pizza de muzza y jamón", 850.0,"chica");
                case p3:
                    return new PizzaSimple("Anana chica", "Pizza de muzza y anana", 950.0,"chica");
                case p4:
                    PizzaCombinada loca = new PizzaCombinada("Combinada loca","es mitad especial y mitad ananá");
                    loca.agregarPizzas(crearPizza(p2));
                    loca.agregarPizzas(crearPizza(p3));
                    return loca;
            }
        //exception
    throw new PizzaException(nombreDeLaPizza + " no es válido");
}


}


