package main.com.dh.clinica.dao;

import java.util.List;
import java.util.Optional;

public interface IDao<T> {

    public T guardar(T t);
    public T buscar(int id);
    public void eliminar(int id);
    public List<T> buscarTodos();


}
