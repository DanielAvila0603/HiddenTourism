package ec.espe.edu.controller;

import ec.espe.edu.conexionDB.ConexionDB;
import ec.espe.edu.model.Restaurant;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author WINDOWS-Sebastian
 */
public class RestaurantController {
   
    
    public ArrayList<Restaurant> readDBRestaurant() {
        Connection conn = null;
        Statement statement = null;
        ArrayList<Restaurant> arr = new ArrayList<>();
        
        ConexionDB dbConnection = new ConexionDB();
        try{
            conn = dbConnection.getDBConnection();
            statement = conn.createStatement();
            
            String sql = "select * from restaurant";
            ResultSet res = statement.executeQuery(sql);
            
            while((res != null) && (res.next())){
                arr.add(new Restaurant(res.getString(1),
                    res.getString(2),
                    res.getString(3),
                    res.getString(4),
                    res.getString(5),
                    res.getString(6),
                    res.getString(7)));
            }
            
        }catch(SQLException ex){
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return arr;
    }
}
