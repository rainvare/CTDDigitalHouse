package com.dh.proxy.service.impl;

import com.dh.proxy.service.IConexionInternet;

import java.util.List;

public class ProxyInternet implements IConexionInternet {
    private InternetService internetService;
    private List<String> sitiosBloqueados;

    public ProxyInternet(List<String> sitiosBloqueados, InternetService internetService) {
        this.sitiosBloqueados = sitiosBloqueados;
        this.internetService = internetService;
    }
 //Si la url a la que nos queremos conectar, no esta en la lista de sitios bloqueados, nos conectamos.
    @Override
    public void conectarCon(String url) {
        if(!this.sitiosBloqueados.contains(url))
            this.internetService.conectarCon(url);
        else
            System.out.println("Acceso denegado");


    }
}
