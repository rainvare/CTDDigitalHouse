package com.dh;
import static java.sql.DriverManager.getConnection;
import com.dh.entidad.Odontologo;
import org.apache.log4j.Logger;
import java.sql.*;



public class Test {
    //logger
    private static final Logger logger = Logger.getLogger(Test.class);
//Query para crear tabla
    private static final String SQL_CREATE_TABLE = "DROP TABLE IF EXISTS ODONTOLOGOS;"
        +   "CREATE TABLE ODONTOLOGOS ("
        +   "ID INT PRIMARY KEY,"
        +    "NOMBRE varchar(100) NOT NULL,"
        +    "APELLIDO varchar(100) NOT NULL,"
        +    "MATRICULA varchar(100) NOT NULL)";

//query para insertar datos
    private static final String SQL_INSERT = "INSERT INTO ODONTOLOGOS(ID, NOMBRE, APELLIDO, MATRICULA) VALUES (?,?,?,?)";
//Query update para cambiar la matricula
    private static final String SQL_UPDATE = "UPDATE ODONTOLOGOS SET MATRICULA=? WHERE NOMBRE=? AND APELLIDO=?";
//Query para consultar todos los datos
    private static final String SQL_SELECT_ALL = "SELECT * FROM ODONTOLOGOS";

//método getConnection
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("org.h2.Driver");
        return DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
    }

    public static void main(String[] args)  throws Exception {
//instanciamos
        Odontologo odontologo = new Odontologo("Humberto", "García", "35890658");
//conectamos la BBDD
        Connection connection = null;


        try {
            logger.info("Se está creando la tabla");
            connection = getConnection();
    //statement para crear una tabla
            Statement statement = connection.createStatement();
            statement.execute(SQL_CREATE_TABLE);

            logger.info("Se están insertando los datos en la BDD");
    //preparedStatement para insertar datos
            PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);

    //muestro los datos insertados
            psInsert.setInt(1, 1); //doy valor al id
            psInsert.setString(2, odontologo.getNombre());
            psInsert.setString(3, odontologo.getApellido());
            psInsert.setString(4, odontologo.getMatricula());
    //ejecuto mi insert
            psInsert.execute();
    //verifico mi update
            logger.info("Update");
            connection.setAutoCommit(false);
     // actualizo datos
            PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE);
            psUpdate.setString(1, odontologo.setMatricula("35890632"));
            psUpdate.setString(2, odontologo.getNombre());
            psUpdate.setString(3, odontologo.getApellido());
    //ejecuto actualización
            psUpdate.execute();

            //consulto todos los registros y los guardo en el resultset
            Statement consulta = connection.createStatement();
            ResultSet resultadoConsulta = consulta.executeQuery(SQL_SELECT_ALL);

    //configuro mi resultset
            while (resultadoConsulta.next()) {
                logger.debug("\n" + resultadoConsulta.getInt(1)
                        + "\n" + resultadoConsulta.getString(2)
                        + "\n" + resultadoConsulta.getString(3)
                        + "\n" + resultadoConsulta.getString(4)
                );


        }
    } //capturo errores
      catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            logger.error("Error en la BBDD", e);
            e.printStackTrace();
            assert connection != null;
            connection.rollback();

        }


    }
}
