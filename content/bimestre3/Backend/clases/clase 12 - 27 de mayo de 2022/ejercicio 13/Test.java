package a.com.example2;

import java.sql.*;

public class Test {

    private static final String SQL_CREATE_TABLE = "DROP TABLE IF EXISTS CUENTA; CREATE TABLE CUENTA "
                                                    + "("
                                                    + " ID INT PRIMARY KEY,"
                                                    + " NOMBRE varchar(100) NOT NULL, "
                                                    + " NRO_CUENTA NUMERIC(10, 2) NOT NULL,"
                                                    + " SALDO INT NOT NULL"
                                                    + " )";

    private static final String SQL_INSERT =  "INSERT INTO CUENTA (ID, NOMBRE, NRO_CUENTA, SALDO) VALUES (?,?,?,?)";
    private static final String SQL_UPDATE =  "UPDATE CUENTA SET SALDO=? WHERE ID=?";

    public static void main(String[] args) throws Exception {
        Cuenta cuenta = new Cuenta(12, "Sueldo", 10);

        Connection connection = null;

        try {
            connection= getConnection();
            Statement statement = connection.createStatement();
            statement.execute(SQL_CREATE_TABLE);

            PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
            psInsert.setInt(1, 1);
            psInsert.setString(2, cuenta.getNombre());
            psInsert.setInt(3, cuenta.getNroCuenta());
            psInsert.setDouble(4, cuenta.getSaldo());

            psInsert.execute();

            PreparedStatement psUpdate1 = connection.prepareStatement(SQL_UPDATE);
            psUpdate1.setDouble(1, cuenta.getSaldo() + 10);
            psUpdate1.setInt(2, 1);
            psUpdate1.execute();

            connection.setAutoCommit(false);

            PreparedStatement psUpdate2 = connection.prepareStatement(SQL_UPDATE);
            psUpdate2.setDouble(1, cuenta.getSaldo() + 10);
            psUpdate2.setInt(2, 1);
            psUpdate2.execute();
            int a = 4 /0;
            connection.commit();

            connection.setAutoCommit(true);

            String sql = "SELECT * FROM CUENTA";
            Statement sqlSmt = connection.createStatement();
            ResultSet rs = sqlSmt.executeQuery(sql);
            while (rs.next()) {
                System.out.println(rs.getInt(1) + rs.getString(2) + rs.getInt(3) + rs.getString(4));
            }


        } catch (Exception e) {
            connection.rollback();
        } finally {
            connection.close();
        }

        Connection connection2= getConnection();
        String sql = "SELECT * FROM CUENTA";
        Statement sqlSmt = connection2.createStatement();
        ResultSet rs = sqlSmt.executeQuery(sql);
        while (rs.next()) {
            System.out.println(rs.getInt(1) + rs.getString(2) + rs.getInt(3) + rs.getString(4));
        }

    }

    public static Connection getConnection() throws Exception {
        Class.forName("org.h2.Driver").newInstance();
        return DriverManager.getConnection("jdbc:h2:~/test");

    }

}
