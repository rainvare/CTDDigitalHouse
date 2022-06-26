import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.io.File;
import java.sql.*;
import java.sql.ResultSet;

public class Test {

        private static final Logger logger = Logger.getLogger(Test.class);


        //Método que conecta el driver con la BBDD
        public static Connection getConnection() throws Exception {
            Class.forName("org.h2.Driver").newInstance();
            return DriverManager.getConnection("jdbc:h2:~/test", "sa", "");
        }

        // creo la tabla
        private static final String  SQL_CREATE_TABLE = "DROP TABLE IF EXISTS EMPLEADO; CREATE TABLE EMPLEADO "
                + "("
                + " ID INT PRIMARY KEY,"
                + " NOMBRE varchar(100) NOT NULL, "
                + " EMPRESA varchar(100) NOT NULL, "
                + " EDAD INT NOT NULL,"
                + " FECHA_INICIO varchar(100) NOT NULL"
                + " )";

        private static final String SQL_INSERT1 = "INSERT INTO EMPLEADO (ID, NOMBRE, EMPRESA, EDAD, FECHA_INICIO) VALUES (5,'Pepe','Facebook',40,'09/11/2020')";
        private static final String SQL_INSERT2 =  "INSERT INTO EMPLEADO (ID, NOMBRE, EMPRESA, EDAD, FECHA_INICIO) VALUES (6,'Diego','Google',33,'12/20/2021')";
        private static final String SQL_INSERT3 =  "INSERT INTO EMPLEADO (ID, NOMBRE, EMPRESA, EDAD, FECHA_INICIO) VALUES (7,'juan','duck',33,'12/20/2022')";

        public static void main(String[] args) throws SQLException {

//instaciar el archivo de configuración que se debe crear en el proyecto como: log4j.properties
            File log4jfile = new File("src/config/log4j.properties");
            PropertyConfigurator.configure(log4jfile.getAbsolutePath());
// Conecta la base de datos (creamos la propiedad)
            Connection connection = null;

            try{
// se genera la conexión
                connection = getConnection();
// objeto Statement que nos va a permitir ejecutar la consulta
// **puedo crearlo una sola vez y usarlo en cada consulta**
                Statement statement = connection.createStatement();
                statement.execute(SQL_CREATE_TABLE);

//se crea un try-catch especial par este segmento de forma que
// podamos capturar el error de forma aislada en el logger
                try {
                    //instert de los registros
                    Statement stm = connection.createStatement();
                    stm.execute(SQL_INSERT1);
                    stm.execute(SQL_INSERT2);
                    stm.execute(SQL_INSERT3);
                }catch (SQLException e){
                    logger.error("Error al insertar un registro", e);
                }

//update de un registro
                String updateSql="update EMPLEADO set EMPRESA = 'DH' WHERE ID = 2 ";
                statement.executeUpdate(updateSql);
                logger.debug("Se actualizo registro");

//delete de un registro por ID
                String deleteSql="delete from EMPLEADO WHERE ID = 3";
                statement.executeUpdate(deleteSql);
                logger.info("Se eliminó el registro");

//delete de un registro por EMPRESA
                String deleteSql2="delete from EMPLEADO WHERE EMPRESA = 'DH'";
                statement.executeUpdate(deleteSql2);
                logger.info("Se eliminó el registro");


                String sqlempleado = "select * from EMPLEADO ";
                ResultSet rs = statement.executeQuery(sqlempleado);

                System.out.println("Resultado de la tabla actualizada");
                while (rs.next()) {
                    System.out.println(
                            rs.getInt(1) + " "
                            + rs.getString(2) + " "
                            + rs.getString(3) + " "
                            + rs.getInt(4) + " "
                            + rs.getString(5));
                }

            } catch (Exception e) {
                e.printStackTrace();

            } finally {
                connection.close();
            }
        }
    }
