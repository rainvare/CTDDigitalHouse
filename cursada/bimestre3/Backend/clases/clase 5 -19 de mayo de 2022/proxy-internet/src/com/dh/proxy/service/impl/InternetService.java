package com.dh.proxy.service.impl;

import com.dh.proxy.service.IConexionInternet;

public class InternetService implements IConexionInternet {


    @Override
    public void conectarCon(String url) {
        System.out.println("Conectando con "+url);
    }
}
