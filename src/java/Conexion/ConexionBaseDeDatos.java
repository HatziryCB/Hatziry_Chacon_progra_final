/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hatziry Chacón
 */
public class ConexionBaseDeDatos {
     private String url = "jdbc:mysql://localhost:3306/final_progra";//url de MySQL
    private String usuario = "root";
    private String clave = "root";
    private Connection conexion = null;

    public Connection conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, clave);
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return conexion;
    }
}