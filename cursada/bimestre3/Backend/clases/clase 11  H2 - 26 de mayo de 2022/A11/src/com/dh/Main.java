package com.dh;

import java.sql.*;
import java.time.LocalDate;
import java.util.Map;

public class Main {

    public static void main(String[] args) {

        //establecer conexion
        Connection connection = null;

        try {
        connection = getConnection();
        Statement statement = connection.createStatement();
        //creo mi tabla
        String createTable = Empleado.crearTabla(
                Map.of("id", "INTEGER PRIMARY KEY",
                        "nombre", "VARCHAR(50)",
                        "nombreEmpresa", "VARCHAR(50)",
                        "fechaIngreso", "VARCHAR(50)")
        );
        //inicio statements
        statement.execute(createTable);

        //inserto filas
        statement.execute(Empleado.generarInsert(1, "Juan", "Digital", LocalDate.of(2021, 8, 15)));
        statement.execute(Empleado.generarInsert(2, "Dayana", "Google", LocalDate.of(2022, 3, 4)));
        statement.execute(Empleado.generarInsert(3, "Stephan", "Facebook", LocalDate.of(2020, 5, 25)));


        statement.execute(Empleado.generarDelete(3));

        //creo los results
        ResultSet results = statement.executeQuery(Empleado.generarSelectAll());
        while (results.next()) {
            String registry = results.getInt("id") + ". " +
                    results.getString("nombre")  + " trabaja en " +
                    results.getString("nombreEmpresa") + " desde " +
                    results.getString("fechaIngreso");
            System.out.println(registry);
        }
//capturo errores
    } catch(Exception e) {
        System.out.println(e.getMessage());
    } finally {
        try {
            assert connection != null;
            connection.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (NullPointerException e) {
            System.err.println("La conexión no puede cerrarse porque nunca se inicializó (es null)");
        }
    }
}
//conecto BBDD
    public static Connection getConnection() throws Exception {
        Class.forName("org.h2.Driver");
        return DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
    }
}
