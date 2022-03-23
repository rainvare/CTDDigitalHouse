package com.company;

public class Asteroide extends Objeto {
    private Integer lesion;

    //Constructor
    public Asteroide(Integer posX, Integer posY, Character direction, Integer lesion){
        super(posX, posY, direction);
        this.lesion=lesion;
    }

    //Métodos
    public void irA(Integer posX, Integer posY, Character direction ){
        this.posX=posX;
        this.posY=posY;
        this.direction=direction;
    }
}
