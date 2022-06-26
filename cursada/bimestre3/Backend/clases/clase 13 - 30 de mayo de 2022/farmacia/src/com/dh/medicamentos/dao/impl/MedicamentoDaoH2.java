package com.dh.medicamentos.dao.impl;

import com.dh.medicamentos.dao.IDao;
import com.dh.medicamentos.model.Medicamento;
import org.apache.log4j.Logger;

import java.sql.*;


public class MedicamentoDaoH2 implements IDao<Medicamento> {

    private final static String DB_JDBC_DRIVER = "org.h2.Driver";
    //con la instruccion INIT=RUNSCRIPT cuando se conecta a la base ejecuta el script de sql que esta en dicho archivo
    private final static String DB_URL = "jdbc:h2:~/test;INIT=RUNSCRIPT FROM 'create.sql'";
    private final static String DB_USER ="sa";
    private final static String DB_PASSWORD = "";

    final static Logger log = Logger.getLogger(MedicamentoDaoH2.class);


    @Override
    public Medicamento guardar(Medicamento medicamento) {
        log.debug("Registrando un nuevo medicamento : "+ medicamento.toString());

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            //1 Levantar el driver y Conectarnos
            Class.forName(DB_JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            //2 Crear una sentencia
            preparedStatement = connection.prepareStatement("INSERT INTO medicamentos(nombre,laboratorio,cantidad,precio) VALUES(?,?,?,?)");
            //No le vamos a pasar el ID ya que hicimos que fuera autoincremental en la base de datos
            //preparedStatement.setInt(1,avion.getId());
            preparedStatement.setString(1, medicamento.getNombre());
            preparedStatement.setString(2, medicamento.getLaboratorio());
            preparedStatement.setInt(3, medicamento.getCantidad());
            preparedStatement.setDouble(4, medicamento.getPrecio());

            //3 Ejecutar una sentencia SQL
            preparedStatement.executeUpdate();
            preparedStatement.close();

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return medicamento;
    }

    @Override
    public Medicamento buscar(Integer id) {
        log.debug("Buscando medicamento con id : "+id);
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Medicamento medicamento = null;
        try {
            //1 Levantar el driver y Conectarnos
            Class.forName(DB_JDBC_DRIVER);
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            //2 Crear una sentencia
            preparedStatement = connection.prepareStatement("SELECT id,nombre,laboratorio,cantidad,precio  FROM medicamentos where id = ?");
            preparedStatement.setInt(1,id);

            //3 Ejecutar una sentencia SQL
            ResultSet result = preparedStatement.executeQuery();

            //4 Obtener resultados
            while (result.next()) {
                int idMedicamento = result.getInt("id");
                String nombre = result.getString("nombre");
                String laboratorio = result.getString("laboratorio");
                Integer cantidad = result.getInt("cantidad");
                Double precio = result.getDouble("precio");
                medicamento = new Medicamento(idMedicamento,nombre,laboratorio,cantidad,precio);
            }

            preparedStatement.close();
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }

        return medicamento;
    }
}