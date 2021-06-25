/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.espe.edu.controller;

import ec.espe.edu.model.Tourist;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author SEBASTIAN
 */
public class TouristController {

    public ArrayList<Tourist> readDBTourist() throws ClassNotFoundException, SQLException {
        ArrayList<Tourist> arr;
        Connection connect = null;
        Statement s = null;

        arr = new ArrayList();

        Class.forName("org.mariadb.jdbc.Driver");
        connect = DriverManager.getConnection(
                "jdbc:mariadb://localhost/hiddentourism"
                + "?user=root&password=12345"
        );

        s = connect.createStatement();
        String SQLQuery = "SELECT * FROM tourist";
        ResultSet rs = s.executeQuery(SQLQuery);

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

        return arr;
    }

    public void saveInDB(Tourist t) {
        Connection connect = null;
        Statement s = null;

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" 
                    + "?user=root&password=12345");

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
