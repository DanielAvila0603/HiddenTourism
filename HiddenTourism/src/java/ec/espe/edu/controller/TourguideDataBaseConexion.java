/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author SEBASTIAN
 */
public class TourguideDataBaseConexion {
    public Connection getDBConnection(){
        Connection conn = null;
        Statement sqlStatement = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hiddentourism" + "?user=root&password=12345");
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
    
}
