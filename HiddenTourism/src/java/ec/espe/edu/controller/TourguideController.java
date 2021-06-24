/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import ec.espe.edu.model.Tourguide;
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
 * @author SEBASTIAN
 */
public class TourguideController {
    
    public TourguideController(){
    }
    public Connection getDBConnection(){
        Connection conn = null;
        Statement sqlStatement = null;
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourism" + "?user=root&password=12345");
                sqlStatement = conn.createStatement();
            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println("Stack in the catch -> " + e.toString());
                e.printStackTrace();
            }
            try {
                if (sqlStatement != null) {
                    sqlStatement.close();
                }
            } 
            catch (SQLException e) {
                
                e.printStackTrace();
            }
           
        return conn;
    }
    
    public  List<Tourguide> readTourguide(){
        Connection conn = null;
        Statement statement = null;
        List<Tourguide> tourguideList = new ArrayList<>();
        
        TourguideController dbConnection = new TourguideController();
        try{
            conn = dbConnection.getDBConnection();
            statement = conn.createStatement();
            
            String sql = "SELECT * FROM tourguide";
            ResultSet res = statement.executeQuery(sql);
            
            while((res != null) && (res.next())){
                tourguideList.add(new Tourguide(res.getString("idTourguide"), res.getString("firstName"), res.getString("lastName")));
            }
            
        }catch(SQLException ex){
            Logger.getLogger(TourguideController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return tourguideList;
    }
    
    
    
}
