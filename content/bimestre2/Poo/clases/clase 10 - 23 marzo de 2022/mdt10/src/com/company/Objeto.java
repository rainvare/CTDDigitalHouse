package com.company;

public class Objeto {
    private Integer posX;
    private Integer posY;
    private Character direction;

    //Constructor
    public Objeto ( Integer posX, Integer posY, Character direction){
        this.posX = posX;
        this.posY= posY;
        this.direction =direction;
    }
    //Métodos
    public void irA(Integer posX, Integer posY, Character direction){
        this.posX = posX;
        this.posY = posY;
        this.direction = direction;
    }

    public String obtenerCoordenadas(){
        return ("posX: " + posX + ", posY: " + posY + ", Dirección: " + direction);
    }

//getters
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
