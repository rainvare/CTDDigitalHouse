package com.dh;

import java.sql.*;

public class Figuras {
    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
//creamos una nueva instancia del driver
        Class.forName("org.h2.Driver").newInstance();

// creamos una nueva conexion de tipo Connection con el driverManager(url de la BBDD, usuario, contraseña)
        Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "");

//creamos objetos statement
        Statement statement = connection.createStatement();

//Cremos un table
        String createTable = "DROP TABLE IF EXISTS FIGURA;" + //, si existe la deberia borrar y si no la deberia crear.
                " CREATE TABLE FIGURA" + //nombre de la tabla
                "(ID INT PRIMARY KEY," + //atributos(id obligatorio + nombre-atributos tipo(valores))
                " FIGURA VARCHAR(255), " +
                "COLOR VARCHAR(255))";

//Ejecutamos el sql
        statement.execute(createTable);

//insertamos los datos en la tabla (en el orden de los atributos definidos)
        String insertarFila = "INSERT INTO FIGURA VALUES(1, 'Circulo', 'Rojo')";
        String insertarFila2 = "INSERT INTO FIGURA VALUES(2, 'Circulo', 'Azul')";
        String insertarFila3 = "INSERT INTO FIGURA VALUES(3, 'Cuadrado', 'Violeta')";
        String insertarFila4 = "INSERT INTO FIGURA VALUES(4, 'Cuadrado', 'Naranja')";
        String insertarFila5 = "INSERT INTO FIGURA VALUES(5, 'Cuadrado', 'Verde')";

//Ejecutamos los statement
        statement.execute(insertarFila);
        statement.execute(insertarFila2);
        statement.execute(insertarFila3);
        statement.execute(insertarFila4);
        statement.execute(insertarFila5);

//obtenemos los datos
        String sql = "SELECT * FROM FIGURA WHERE COLOR = 'ROJO'";

//Ejecutamos el statement, que nos va a devolver n objeto de tipo resultSet
        ResultSet resultSet = statement.executeQuery(sql);

//iteramos mientras tenga un proximo elemento
        while (resultSet.next()){
            try {
                System.out.println(resultSet.getInt(1) +
                        " " + resultSet.getString(2) +
                        " " + resultSet.getString(3));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }
}