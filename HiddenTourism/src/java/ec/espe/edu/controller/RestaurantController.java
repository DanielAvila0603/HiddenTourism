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
    public ArrayList<Restaurant> readDBRestaurant() throws ClassNotFoundException, SQLException{
        ArrayList<Restaurant> arr;
        Connection connect = null;
        Statement s = null;

        arr = new ArrayList();

        Class.forName("org.mariadb.jdbc.Driver");
        connect = DriverManager.getConnection(
                "jdbc:mariadb://localhost/hiddentourismdata" + 
                        "?user=root&password=12345"
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
