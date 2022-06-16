package com.company;
import java.util.ArrayList;
public class Empresa {

    private ArrayList<Reserva> reservas;
    private ArrayList<String> estaciones;

    public Empresa() {
        reservas = new ArrayList<Reserva>();
        estaciones = new ArrayList<String>();
        estaciones.add("Buenos Aires");
        estaciones.add("Luján");
        estaciones.add("Mercedes");
        estaciones.add("Suipacha");
        estaciones.add("Chivilcoy");
        estaciones.add("Alberti");
        estaciones.add("Bragado");
    }

    public ArrayList<Reserva> getReservas() {
        return reservas;
    }

    public ArrayList<String> getEstaciones() {
        return estaciones;
    }

    public void setEstaciones(ArrayList<String> estaciones) {
        this.estaciones = estaciones;
    }

    public void agregarReserva(Reserva reserva) {
        reservas.add(reserva);
    }

    public double recaudacionTotal() {
        double recaudacion = 0.0;
        for( int i = 0; i < reservas.size(); i++) {
            recaudacion += reservas.get(i).calcularPrecio();
        }
        return recaudacion;
    }

    public int cantVecesRecorrida(String estacion) throws EstacionException{
        if(!estaciones.contains(estacion)) {
            throw new EstacionException("La estación ingresada no es válida");
        }
        int cantidad = 0;
        for( int i = 0; i < reservas.size(); i++) {
            if(reservas.get(i).getRecorrido().getDestino().equals(estacion) || reservas.get(i).getRecorrido().getPartida().equals(estacion)) {
                cantidad += reservas.get(i).getCantPersonas();
            }
        }
        return cantidad;
    }

    public void agregarEstacion(String estacion) {
        estaciones.add(estacion);
    }

    class EstacionException extends Throwable {
        public EstacionException(String s) {
        }
    }
}
