package com.company;

public class RobotLiviano extends Robot implements Atacante, Defensor, Volador {
    private Double agilidad;
    public RobotLiviano(Integer energiaInicial,Double agilidad){
        super(energiaInicial);
        this.agilidad=agilidad;

    }

    public Double getAgilidad() {
        return agilidad;
    }

    public void setAgilidad(Double agilidad) {
        this.agilidad = agilidad;
    }

    public String mostrar(){
        return "Soy un Robot Liviano. " + "Mi Energia es "+getEnergia()+" y mi agilidad es del "+this.agilidad+"%.";
    }
    @Override
    public void atacar() {
        this.setEnergia(this.getEnergia()-5);
    }

    @Override
    public void defender() {
        this.setEnergia(this.getEnergia()+2);
    }

    @Override
    public void volar(){
        this.setEnergia(this.getEnergia()-20);
        Double nuevaAgilidad=this.agilidad+15.0;
        if (nuevaAgilidad>=100.0) {
            this.agilidad=100.00;
        } else {
            this.agilidad=nuevaAgilidad;
        }


    }
}
