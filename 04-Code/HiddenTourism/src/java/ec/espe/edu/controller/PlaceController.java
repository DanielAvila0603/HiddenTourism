/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;


import ec.espe.edu.conexionDB.ConexionDB;
import ec.espe.edu.model.Place;
import java.sql.Connection;
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

    public PlaceController() {
    }
    
    
    
    public List<Place> readPlace(){
        Connection con = null;
        Statement st = null;
        List<Place> placeList = new ArrayList<>();
        ConexionDB dbConnection = new ConexionDB();
        
        PlaceController db = new PlaceController();
        try{
            con = dbConnection.getDBConnection();
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
        ConexionDB dbConnection = new ConexionDB();
   
        try{
            con = dbConnection.getDBConnection();
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

