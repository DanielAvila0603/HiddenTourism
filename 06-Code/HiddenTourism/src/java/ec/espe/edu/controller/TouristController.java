/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import ec.espe.edu.conexionDB.ConexionDB;
import ec.espe.edu.model.Tourist;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SEBASTIAN
 */
public class TouristController {

    
    public ArrayList<Tourist> readDBRestaurant() {
        Connection conn = null;
        Statement statement = null;
        ArrayList<Tourist> arr = new ArrayList<>();
        
        ConexionDB dbConnection = new ConexionDB();
        try{
            conn = dbConnection.getDBConnection();
            statement = conn.createStatement();
            
            String sql = "select * from tourist";
            ResultSet rs = statement.executeQuery(sql);
            
            while (rs.next()) {
            arr.add(new Tourist(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5),
                    rs.getString(6)
            ));
        }
            
        }catch(SQLException ex){
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return arr;
    }
    
    public void saveInDB(Tourist t) {
        Connection connect = null;
        Statement s = null;
        ConexionDB dbConnection = new ConexionDB();

        try {
            
            connect = dbConnection.getDBConnection();
            s = connect.createStatement();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            String SQL = "INSERT INTO tourist VALUES ('"
                    + t.getIdTourist() + "', '"
                    + t.getFirstName() + "', '"
                    + t.getLastName() + "', '"
                    + t.getLocation() + "', '"
                    + sdf.format(t.getResevationDate()) + "', '"
                    + t.getPaymentType() + "'"
                    + ")";

            SQL = SQL.replaceAll("'", "\"");
            s.executeQuery(SQL);

        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if (s != null) {
                s.close();
                connect.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
