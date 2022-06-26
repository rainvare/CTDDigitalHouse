package a.com;

/*Crear una tabla de figuras y guardar el 
tipo de figura: ejemplo circulo
color: ejemplo rojo
(No nos olvidemos que el id es obligatorio)
Crear una conexion a la BD
insertar 2 circulos y 3 cuadrados de distinto color
crear una query para ver los circulos color rojo
mostrar todos las figuras en pantalla con un resultSet y un System.out.println
*/

import java.sql.*;

public class Test2 {

    private static final String SQL_CREATE_TABLE = "DROP TABLE IF EXISTS FIGURAS; CREATE TABLE FIGURAS "
            + "("
            + " ID INT PRIMARY KEY,"
            + " COLOR varchar(100) NOT NULL, "
            + " TIPO varchar(100) NOT NULL "
            + " )";

    private static final String SQL_INSERT =  "INSERT INTO FIGURAS (ID, COLOR, TIPO) VALUES (1, 'ROJO', 'Circulo')";
    private static final String SQL_INSERT2 =  "INSERT INTO FIGURAS (ID, COLOR, TIPO) VALUES (2, 'VERDE', 'Cuadrado')";
    private static final String SQL_INSERT3 =  "INSERT INTO FIGURAS (ID, COLOR, TIPO) VALUES (3, 'AZUL', 'Cuadrado')";
    private static final String SQL_INSERT4 =  "INSERT INTO FIGURAS (ID, COLOR, TIPO) VALUES (4, 'ROJO', 'Cuadrado')";
    private static final String SQL_INSERT5 =  "INSERT INTO FIGURAS (ID, COLOR, TIPO) VALUES (5, 'VERDE', 'Circulo')";

    private static final String SQL_DELETE =  "DELETE FROM FIGURAS WHERE ID=2";


    public static void main(String[] args) throws Exception {

        Connection connection = null;

        try {
            connection= getConnection();
            Statement statement = connection.createStatement();
            statement.execute(SQL_CREATE_TABLE);

            Statement statementIns = connection.createStatement();
            statementIns.execute(SQL_INSERT);

            Statement statementIns2 = connection.createStatement();
            statementIns2.execute(SQL_INSERT2);

            Statement statementIns3 = connection.createStatement();
            statementIns3.execute(SQL_INSERT3);

            Statement statementIns4 = connection.createStatement();
            statementIns4.execute(SQL_INSERT4);

            Statement statementIns5 = connection.createStatement();
            statementIns5.execute(SQL_INSERT5);


            verFiguras(connection, "SELECT * FROM FIGURAS WHERE COLOR = 'ROJO'");

            Statement statementDEl = connection.createStatement();
            statementDEl.execute(SQL_DELETE);

            verFiguras(connection, "SELECT * FROM FIGURAS");


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connection.close();
        }
    }

    private static void verFiguras(Connection connection, String sql) throws SQLException {
        Statement sqlSmt = connection.createStatement();
        ResultSet rs = sqlSmt.executeQuery(sql);
        while (rs.next()) {
            System.out.println(rs.getInt(1) + rs.getString(2) + rs.getString(3));
        }
    }

    public static Connection getConnection() throws Exception {
        Class.forName("org.h2.Driver").newInstance();
        return DriverManager.getConnection("jdbc:h2:~/test");

    }
}
