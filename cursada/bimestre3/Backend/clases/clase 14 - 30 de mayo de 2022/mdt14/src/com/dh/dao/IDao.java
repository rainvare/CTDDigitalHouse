package com.dh.dao;

import java.sql.SQLException;
import java.util.List;

public interface IDao<T> {
    T consultarPorId(Integer id) throws SQLException;
    List<T> consultarTodos() throws  SQLException;
    Integer insertarNuevo(T t) throws SQLException;
    void borrarTodos() throws SQLException;
    void borrarPorId(Integer id) throws SQLException;
}
