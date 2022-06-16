package com.company;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {
	// write your code here

        Cliente cliente = new Cliente("Cosme","Fulanito",123,1000.0);
        

        try{
            cliente.comprar(1500.0);
        }catch (ClienteException e){
            e.printStackTrace();
        }

        try {
            Cliente cliente1 = new Cliente("Tomas","Alegria",12345,5000.0,10000.0,-500.0);
        } catch (ClienteException e) {
            e.printStackTrace();
        }


        System.out.println("mi codigo llego hasta aca");



    }
}
