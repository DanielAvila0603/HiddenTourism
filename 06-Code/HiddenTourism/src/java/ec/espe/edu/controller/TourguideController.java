/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import ec.espe.edu.conexionDB.ConexionDB;
import ec.espe.edu.model.Tourguide;
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
 * @author SEBASTIAN
 */
public class TourguideController {
    
    public TourguideController(){
    }
    
    
    
    public List<Tourguide> readTourguide() {
        Connection conn = null;
        Statement statement = null;
        List<Tourguide> tourguideList = new ArrayList<>();
        
        ConexionDB dbConnection = new ConexionDB();
        try{
            conn = dbConnection.getDBConnection();
            statement = conn.createStatement();
            
            String sql = "select * from tourguide";
            ResultSet res = statement.executeQuery(sql);
            
            while((res != null) && (res.next())){
                tourguideList.add(new Tourguide(res.getString("idTourguide"), res.getString("firstName"), res.getString("lastName")));
            }
            
        }catch(SQLException ex){
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return tourguideList;
    }
    
    
    
}
