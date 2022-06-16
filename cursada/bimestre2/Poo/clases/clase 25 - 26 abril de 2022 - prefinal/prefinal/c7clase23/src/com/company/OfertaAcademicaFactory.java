package com.company;

public class OfertaAcademicaFactory {

    public static final String FRONT_END = "FRONTEND";
    public static final String BACK_END = "BACKEND";
    public static final String FULL_STACK = "FULLSTACK";

    private static OfertaAcademicaFactory instance;

    private OfertaAcademicaFactory(){

    }

    public static OfertaAcademicaFactory getInstance() {
        if(instance == null){
            instance = new OfertaAcademicaFactory();
        }
        return instance;
    }

    public OfertaAcademica generarOfertaAcademica(String codigo) throws OfertaAcademicaException{
        switch (codigo){
            case FRONT_END:
                return new Curso("Front end","soy programar",1000.0,16.0,2.0);
            case BACK_END:
                return new Curso("Back end","soy programar",900.0,20.0,2.0);
            case FULL_STACK :
                ProgramaIntensivo fullStack = new ProgramaIntensivo("Full stack", "algo", 0.2);
                fullStack.agregarOfertaAcademica(generarOfertaAcademica(FRONT_END));
                fullStack.agregarOfertaAcademica(generarOfertaAcademica(BACK_END));
                return fullStack;

        }
        throw new OfertaAcademicaException(codigo + " no es un codigo valido");
    }
}
