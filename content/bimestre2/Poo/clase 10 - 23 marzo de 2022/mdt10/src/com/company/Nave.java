package com.company;

public class Nave extends Objeto{
    private Double velocidad;
    private Integer vida;

    //Constructor
    public Nave(Integer posX, Integer posY, Character direction, Double velocidad) {
        super(posX, posY, direction);
        this.velocidad = velocidad;
        vida = 100;
    }

    //Métodos

    public void irA(Integer posX, Integer posY, Character direction ) {
        if (direction != this.direction) {
            System.out.println("Debes cambiar de dirección");
        } else {
            super.irA(posX, posY, direction);
        }
    }

    public void girar(Character direction){
        this.direction = direction;
    }

    public void restaVida(Character valor){
        vida -= valor;
    }
}