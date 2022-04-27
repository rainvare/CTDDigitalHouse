package com.company;

public class Main {

    public static void main(String[] args) {
	// write your code here

        Instituto instituto = new Instituto();

        instituto.agregarOfertaAcademica(OfertaAcademicaFactory.FRONT_END);
        instituto.agregarOfertaAcademica(OfertaAcademicaFactory.BACK_END);

        instituto.agregarOfertaAcademica(OfertaAcademicaFactory.FULL_STACK);

        instituto.agregarOfertaAcademica("ANDROID");

        instituto.generarInforme();
    }
}
