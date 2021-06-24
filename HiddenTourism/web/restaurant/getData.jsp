<%-- 
    Document   : getData
    Created on : 18/06/2021, 0:29:30
    Author     : WINDOWS-Sebastian
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ec.espe.edu.model.Restaurant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Data Format: JSON</title>
    </head>
    <body>
        <h1>Restaurant Data Format: JSON</h1>
        <%
            ArrayList<Restaurant> arr;
            
            Connection connect = null;
            Statement s = null;

            try{
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
                
                 String json = new Gson().toJson(arr); 
                 out.println(json);
                
            }catch(ClassNotFoundException | NumberFormatException | SQLException e){}
            
            try {
                if (s != null) {
                    s.close();
                }
            } catch (SQLException e) {}
        %>
    </body>
</html>
