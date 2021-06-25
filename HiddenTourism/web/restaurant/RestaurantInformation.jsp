<%-- 
    Document   : showRestaurants
    Created on : 28/05/2021, 13:36:43
    Author     : WINDOWS-Sebastian
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="/img/logoICO.ico">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Reading Restaurants JSP</title>
    </head>
    <body>
        <%
        Connection connect = null;
        Statement s = null;
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mariadb://localhost/hiddentourismdata" 
                    + "?user=root&password=12345");
            
            s = connect.createStatement();
            
            String SQL = "SELECT * FROM restaurant ORDER BY restaurantID ASC";
            ResultSet rec = s.executeQuery(SQL);
        %>
        <h1>Restaurant Information</h1>
        <table class="table table-hover table-dark">
            <thread>
                <tr>
                    <th scope="col"><div align="center">Restaurant ID</div></th>
                    <th scope="col"><div align="center">Restaurant Name</div></th>
                    <th scope="col"><div align="center">Address</div></th>
                    <th scope="col"><div align="center">Description</div></th>
                    <th scope="col"><div align="center">Opening Time</div></th> 
                    <th scope="col"><div align="center">Closing Time</div></th>
                    <th scope="col"><div align="center">Consumption Type</div></th>
                </tr>
            </thread>
            <%while ((rec != null) && (rec.next())) {%>
            <tr>
                <td scope="row"><div align="center"><%=rec.getString("restaurantID")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantName")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantAddress")%></div></td>
                <td><div align="center"><%=rec.getString("restaurantDescription")%></div></td>
                <td><div align="center"><%=rec.getString("openingTime")%></div></td>
                <td><div align="center"><%=rec.getString("closingTime")%></div></td>
                <td><div align="center"><%=rec.getString("consumptionType")%></div></td>
            </tr>
            <%}%>
        </table>
        <%
            }catch(Exception e){
                out.println(e.getMessage());
                out.println("Stack in the catch --> "+e.toString());
                e.printStackTrace();
            }
            
            try {
                if (s != null) {
                    s.close();
                    connect.close();
                }
            } catch (SQLException e) {
                out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
