package ec.espe.edu.controller;

import ec.espe.edu.model.Restaurant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author WINDOWS-Sebastian
 */
public class RestaurantController {
    public void save(Restaurant restaurant){
         System.out.println("saving from a class and output in the web server console -> " + restaurant.getRestaurantName());
    }
    
    public Map<String, String> getHeadersInfo(HttpServletRequest request) {

        Map<String, String> map = new HashMap<String, String>();

        Enumeration headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = (String) headerNames.nextElement();
            String value = request.getHeader(key);
            map.put(key, value);
        }

        return map;
    }
    
    public ArrayList<Restaurant> readDBRestaurant() throws ClassNotFoundException, SQLException{
        ArrayList<Restaurant> arr;
        Connection connect = null;
        Statement s = null;

        arr = new ArrayList();

        Class.forName("org.mariadb.jdbc.Driver");
        connect = DriverManager.getConnection(
                "jdbc:mariadb://localhost/hiddentourismdb" + 
                        "?user=root&password=56793640"
        );

        s = connect.createStatement();
        String SQLQuery = "SELECT * FROM restaurant";
        ResultSet rs = s.executeQuery(SQLQuery);

        while(rs.next()){
            arr.add(new Restaurant(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7)));
        }

        return arr;
    }
}
