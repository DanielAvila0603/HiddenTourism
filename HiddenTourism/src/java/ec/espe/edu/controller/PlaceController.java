/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;


import ec.edu.espe.places.model.Place;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nayeli
 */
public class PlaceController {
    public Connection getDBConnection(){
        Connection conn = null;
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(
                "jdbc:mariadb://localhost/hiddentourismdata" + 
                        "?user=root&password=12345"
        );
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PlaceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return conn;
    }
    public List<Place> readPlace(){
        Connection con = null;
        Statement st = null;
        List<Place> placeList = new ArrayList<>();
        
        PlaceController db = new PlaceController();
        try{
            con = db.getDBConnection();
            st = con.createStatement();
            
            String sql = "SELECT * FROM places";
            ResultSet res = st.executeQuery(sql);
            
            while((res != null) && (res.next())){
                placeList.add(new Place(res.getString("TourismName"),res.getString("Province"),res.getString("Canton"),res.getString("Address"),res.getString("Contact"),res.getString("Activities")));
            }
            
        }catch(SQLException ex){
            Logger.getLogger(PlaceController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return placeList;
    }
    
    public int totalPlace(){
        Connection con = null;
        Statement st = null;
        int total=0;
        
        PlaceController db = new PlaceController();
        try{
            con = db.getDBConnection();
            st = con.createStatement();
            
            String sql = "SELECT * FROM places";
            ResultSet res = st.executeQuery(sql);
            while(res.next()){
                total++;
            }
                        
        }catch(SQLException ex){
           ex.printStackTrace();
        }
        return total;
    }
    
}

