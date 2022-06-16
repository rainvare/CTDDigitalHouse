package com.company;

public class Tanque extends SistemaArmas implements Atacante, Defensor{
    Tanque (Integer energiaInicial){
        super(energiaInicial);
    }

    @Override
    public String mostrar() {
        return "Soy un tanque. Mi enegia es " + getEnergia();
    }

    @Override
    public void atacar() {
        this.setEnergia(this.getEnergia()-5);
    }

    @Override
    public void defender() {
        this.setEnergia(this.getEnergia()+2);
    }
}
