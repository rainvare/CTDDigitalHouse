package com.company;

public class Main {

    public static boolean main(String[] args) {

        class EsDivisible {
            static boolean esDivisible(int n, int divisor) {
                return (n % divisor) == 0;
            }
        }

        return false;
    }

    static Integer maximoEntreTresNumeros(Integer unNumeroA, Integer unNumeroB, Integer
            unNumeroC){
        return Math.max(Math.max(unNumeroA, unNumeroB), unNumeroC);
    }

}
