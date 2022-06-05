package main.com.dh.academia.dao;

import java.util.List;

public interface IDao<T> {

    public T guardar(T t);
    public void eliminar(Long id);
    public T buscar(Long id);
    public List<T> buscarTodos();


}
