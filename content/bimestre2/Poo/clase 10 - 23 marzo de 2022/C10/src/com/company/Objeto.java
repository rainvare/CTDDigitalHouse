package com.company;

public class Objeto {
    protected Integer posX;
    protected Integer posY;
    protected Character direction;

    //Constructor
    public Objeto (Integer posX, Integer posY, Character direction){
        this.posX=posX;
        this.posY=posY;
        this.direction=direction;
    }

    //Métodos
    public void irA(Integer posX, Integer posY, Character direction) {
        this.posX = posX;
        this.posY = posY;
        this.direction = direction;
    }
    public String obtenerCoordenadas(){
        return ("posX: " + posX + " posY: " + posY + " Dirección: " + direction);
    }

    //Getter y Setters
    public Integer getPosX() {
        return posX;
    }
    public Integer getPosY() {
        return posY;
    }
    public Character getDirection() {
        return direction;
    }
}
