package com.company;

public class RobotPesado extends Robot{
    private Double peso;
    public RobotPesado(Integer energiaInicial, Double peso){
        super(energiaInicial);
        this.peso=peso;
    }
    public String mostrar(){
        return "Soy un Robot Pesado. " + "Mi Energia es "+getEnergia()+" y mi peso es "+this.peso+"toneladas.";
    }
}
