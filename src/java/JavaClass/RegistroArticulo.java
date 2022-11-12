/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JavaClass;

import Conexion.ConexionBaseDeDatos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Hatziry Chacón
 */
public class RegistroArticulo {
   Articulo[] vectorArticulo;
    int indice;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;

    public RegistroArticulo() {
        this.vectorArticulo = new Articulo[100];
        this.indice = 0;
    }

    public void almacenar(Articulo articulo) {
        this.vectorArticulo[indice] = articulo;
        this.indice = indice + 1;
    }

    public Articulo[] mostrar() {
        return this.vectorArticulo;
    }

    public void iniciarConexion() {
        conectorBD = new ConexionBaseDeDatos();
        conexion = conectorBD.conectar();
    }

    public String guardarLibroBD(Articulo articulo) {
        String sql = "INSERT INTO final_progra.articulo(codigo_articulo, nombre_articulo, alias, fecha_registro, id_categoria)";
        sql += "VALUES (?,?,?,?,?)";

        try {
            iniciarConexion();
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, articulo.getCodigo());
            statement.setString(2, articulo.getNombre());
            statement.setString(3, articulo.getAlias());
            statement.setString(4, articulo.getFecha());
            statement.setInt(5, articulo.getCategoria());
            int resultado = statement.executeUpdate();
            // podemos colocar en vez de resultado el llamado de la función 
            // prstmt.executeUpdate() => if(prstmt.executeUpdate() > 0)
            if (resultado > 0) {
                return String.valueOf(resultado);
            } else {
                return String.valueOf(resultado);
            }
        } catch (SQLException e) {
            return e.getMessage();
        }
    }

    public void getClientes2(StringBuffer respuesta) {
        String sql = "select * from final_progra.articulo";
        try {
            iniciarConexion();
            respuesta.setLength(0);
            statement = conexion.prepareStatement(sql);
            result = statement.executeQuery();
            if (result != null) {
                while (result.next()) {
                    respuesta.append("<tr>");
                    //nombre de los encabezados en las columnas del query en mySQL Workbench, deben estar todos en el mismo orden
                    respuesta.append("<td >").append(result.getString("codigo_articulo")).append("</td>");
                    respuesta.append("<td >").append(result.getString("nombre_articulo")).append("</td>");
                    respuesta.append("<td >").append(result.getString("alias")).append("</td>");
                    respuesta.append("<td >").append(result.getString("fecha_registro")).append("</td>");
                    respuesta.append("<td >").append(result.getString("id_categoria")).append("</td>");
                    respuesta.append("<td id=\"").append(result.getString("codigo"))
                            .append("\"  onclick=\"eliminar(this.id);\">")
                            .append(" <a class=\"btn-group btn-group-md btn-warning\"'><i class=\"bi bi-vector-pen\"></i>  </a>"
                                    + " <a class=\"btn-group btn-group-md btn-danger\"'> <i class=\"bi bi-trash3\"></i> </a>"
                                    + " <td></tr>");
                }
            } else {
                respuesta.append("error al consultar");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public String eliminarLibro(int codArticulo) {
        String sql = "DELETE FROM articulo WHERE codigo_articulo=" + codArticulo;
        try {
            iniciarConexion();
            statement = conexion.prepareStatement(sql);
            int resultado = statement.executeUpdate();
            if (resultado > 0) {
                return String.valueOf(resultado);
            } else {
                return String.valueOf(resultado);
            }
        } catch (SQLException e) {
            return e.getMessage();
        }
    } 
}
