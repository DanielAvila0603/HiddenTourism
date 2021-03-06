package ec.espe.edu.conexionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SEBASTIAN
 */
public class ConexionDB {
    public Connection getDBConnection(){
        Connection conn = null;
        String path = "C:\\config\\config.json";
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://" + ConfigDB.readConfig(path, "Host") + ":" 
                    + ConfigDB.readConfig(path, "Port") + "/" 
                    + ConfigDB.readConfig(path, "Name")
                    + "?user=" + ConfigDB.readConfig(path, "User")
                    + "&password=" + ConfigDB.readConfig(path, "Password"));
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return conn;
    }
}
