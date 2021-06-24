/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import ec.espe.edu.model.Restaurant;
import ec.espe.edu.model.Tourist;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author SEBASTIAN
 */
public class TouristController {
    
    /*public void save(Tourist tourist){
         System.out.println("saving from a class and output in the web server console -> " + restaurant.getRestaurantName());
    }*/
    
    /*public Map<String, String> getHeadersInfo(HttpServletRequest request) {

        Map<String, String> map = new HashMap<String, String>();

        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }

        return map;
    }*/
    
    public ArrayList<Tourist> readDBTourist() throws ClassNotFoundException, SQLException{
        ArrayList<Tourist> arr;
        Connection connect = null;
        Statement s = null;

        arr = new ArrayList();

        Class.forName("org.mariadb.jdbc.Driver");
        connect = DriverManager.getConnection(
                "jdbc:mariadb://localhost/hiddentourism" + 
                        "?user=root&password=12345"
        );

        s = connect.createStatement();
        String SQLQuery = "SELECT * FROM tourist";
        ResultSet rs = s.executeQuery(SQLQuery);

        while(rs.next()){
            arr.add(new Tourist(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getDate(5),
                    rs.getString(6)
                    ));
        }

        return arr;
    }
    
}
