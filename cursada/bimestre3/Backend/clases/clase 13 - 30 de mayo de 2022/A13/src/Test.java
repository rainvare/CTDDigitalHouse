import org.apache.log4j.Logger;

import java.sql.*;

public class Test {
    private static final Logger logger = Logger.getLogger(Test.class);
    private static final String SQL_CREATE_TABLE = "DROP TABLE IF EXISTS PACIENTES;" +
            "CREATE TABLE PACIENTES (" +
            "ID INT PRIMARY KEY," +
            "NOMBRE varchar(100) NOT NULL," +
            "APELLIDO varchar(100) NOT NULL," +
            "DOMICILIO varchar(255) NOT NULL," +
            "DNI bigint NOT NULL," +
            "FECHA_ALTA varchar(100) NOT NULL," +
            "USUARIO varchar(255) NOT NULL," +
            "PASSWORD varchar(50) NOT NULL)";

    private static final String SQL_INSERT = "INSERT INTO PACIENTES (ID, NOMBRE, APELLIDO, DOMICILIO, DNI, FECHA_ALTA, USUARIO, PASSWORD) VALUES (?,?,?,?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE PACIENTES SET PASSWORD=? WHERE NOMBRE=? AND USUARIO=?";
    private static final String SQL_SELECT_ALL = "SELECT * FROM PACIENTES";

    public static void main(String[] args) throws Exception{

        Pacientes.Paciente usuario = new Pacientes.Paciente("Luana", "Santos", "Av Silva", 184672428, "lsilva", "12345", "2022-05-12");

        Connection connection = null;
        try{
            logger.info("Creacion de tabla");
            connection = getConnection();
            Statement statement = connection.createStatement();
            statement.execute(SQL_CREATE_TABLE);

            logger.info("Insercion datos en la BDD");
            PreparedStatement psInsertar = connection.prepareStatement(SQL_INSERT);

            psInsertar.setInt(1, 1);
            psInsertar.setString(2, usuario.getNombre());
            psInsertar.setString(3, usuario.getApellido());
            psInsertar.setString(4, usuario.getDomicilio());
            psInsertar.setInt(5, usuario.getDNI());
            psInsertar.setString(6, usuario.getFechaDeAlta());
            psInsertar.setString(7, usuario.getUsuario());
            psInsertar.setString(8, usuario.getPassword());

            psInsertar.execute();

            logger.info("Update 1");
//autocommit de la transaccion
            connection.setAutoCommit(false);

            PreparedStatement psUpdate1 = connection.prepareStatement(SQL_UPDATE);
            psUpdate1.setString(1, usuario.setPassword("54321"));
            psUpdate1.setString(2, usuario.getNombre());
            psUpdate1.setString(3, usuario.getUsuario());

            psUpdate1.execute();

            Statement consulta = connection.createStatement();
            ResultSet resultadoConsulta = consulta.executeQuery(SQL_SELECT_ALL);

            while (resultadoConsulta.next()) {
                logger.debug("\n" + resultadoConsulta.getInt(1)
                        + "\n" + resultadoConsulta.getString(2)
                        + "\n" + resultadoConsulta.getString(3)
                        + "\n" + resultadoConsulta.getString(4)
                        + "\n" + resultadoConsulta.getInt(5)
                        + "\n" + resultadoConsulta.getString(6)
                        + "\n" + resultadoConsulta.getString(7)
                        + "\n" + resultadoConsulta.getString(8)
                );
            }

            logger.error("Update 2");

            PreparedStatement psUpdate2 = connection.prepareStatement(SQL_UPDATE);
            psUpdate2.setString(1, usuario.setPassword("asf"));
            psUpdate2.setString(2, usuario.getNombre());
            psUpdate2.setString(3, usuario.getUsuario());

            psUpdate2.execute();

            connection.commit();
            connection.setAutoCommit(true);

            Statement consulta2 = connection.createStatement();
            ResultSet resultadoConsulta2 = consulta2.executeQuery(SQL_SELECT_ALL);
            while (resultadoConsulta2.next()) {
                logger.debug(
                        "\n" + resultadoConsulta2.getInt(1) + "\n"
                        + resultadoConsulta2.getString(2)
                        + "\n" + resultadoConsulta2.getString(3)
                        + "\n" + resultadoConsulta2.getString(4)
                        + "\n" + resultadoConsulta2.getInt(5)
                        + "\n" + resultadoConsulta2.getString(6)
                        + "\n" + resultadoConsulta2.getString(7)
                        + "\n" + resultadoConsulta2.getString(8)
                );
            }

        }
        catch (Exception e){
            logger.error("Error en la BBDD", e);
            assert connection != null;
            connection.rollback();
        }
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("org.h2.Driver");
        return DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
    }
}
