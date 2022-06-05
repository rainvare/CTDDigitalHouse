package com.dh.clinica.DAO;

import java.util.List;

public interface IDao <T>{

    public void vaciar();
    public T guardar(T t);
    public T buscar(int id);
    public List<T> listarTodos();

}